// Flutter imports:
import 'dart:convert';
import 'package:excel/excel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:data_patient/data_patient.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class StatementModel {
  StatementModel({
    required this.patientRepository,
  });

  final PatientRepository patientRepository;

  ValueNotifier<AsyncData<Patient>> patientData =
      ValueNotifier(const AsyncData());

  ValueNotifier<AsyncData<MedicalRecord>> medicalRecordData =
      ValueNotifier(const AsyncData());

  ValueNotifier<AsyncData<List<MedicalInvoiceResponse>>> medicalInvoiceData =
      ValueNotifier(const AsyncData());

  Future<void> initialData({
    required Patient patient,
    required MedicalRecord medicalRecord,
    required FormGroup formGroup,
  }) async {
    patientData.value = AsyncData(data: patient);
    medicalRecordData.value = AsyncData(data: medicalRecord);
    formGroup.control('medicalRecord').value = medicalRecord.id;
    formGroup.control('user').value = patient.id;
    await fetchMedicalInvoice(medicalRecordId: medicalRecord.id);
  }

  ValueNotifier<AsyncData<MedicalInvoiceResponse>> editData =
      ValueNotifier(const AsyncData());

  void resetEditData() {
    editData.value = const AsyncData();
  }

  Future<void> editInvoice({
    required MedicalInvoiceResponse invoice,
    required FormGroup formGroup,
  }) async {
    editData.value = AsyncData(data: invoice);
    formGroup.control('_id').value = invoice.id;
    formGroup.control('logoFile').value = FileSelect(
      url: invoice.logoFile,
    );
    formGroup.control('stampFile').value = FileSelect(
      url: invoice.stampFile,
    );
    formGroup.control('invoiceNumber').value = invoice.invoiceNumber;
    formGroup.control('invoiceDate').value = invoice.invoiceDate;
    formGroup.control('companyName').value = invoice.companyName;
    formGroup.control('address').value = invoice.address;
    formGroup.control('telNumber').value = invoice.telNumber;
    formGroup.control('fexNumber').value = invoice.fexNumber;
    formGroup.control('inCharge').value = invoice.inCharge;

    formGroup.control('medicalRecord').value = invoice.medicalRecord;
    formGroup.control('user').value = invoice.user;
    formGroup.control('hospitalRecord').value = invoice.hospitalRecord;

    formGroup.control('remarks').value = invoice.remarks;

    if (invoice.notes != null && invoice.notes!.isNotEmpty) {
      FormArray notes = formGroup.control('notes') as FormArray;
      notes.clear();

      for (var note in invoice.notes!) {
        notes.add(
          FormGroup({
            '_id': FormControl(value: note.id),
            'note': FormControl(value: note.note),
          }),
        );
      }
    }

    if (invoice.item != null && invoice.item!.isNotEmpty) {
      FormArray item = formGroup.control('item') as FormArray;
      item.clear();

      for (var itemData in invoice.item!) {
        item.add(
          FormGroup({
            '_id': FormControl(value: itemData.id),
            'itemCode': FormControl(value: itemData.itemCode),
            'details': FormControl(value: itemData.details),
            'quantity': FormControl(value: itemData.quantity),
            'unit': FormControl(value: itemData.unit),
            'unitPrice': FormControl(value: itemData.unitPrice),
          }),
        );
      }
    }
  }

  Future<void> fetchMedicalInvoice({
    required String medicalRecordId,
  }) async {
    try {
      medicalInvoiceData.value = const AsyncData(loading: true);
      final response = await patientRepository.getInvoices(
        medicalRecord: medicalRecordId,
        type: true,
      );
      medicalInvoiceData.value = AsyncData(data: response);
    } catch (e) {
      logger.e(e);
      medicalInvoiceData.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<bool>> submitData = ValueNotifier(const AsyncData());

  Future<void> submit({
    required FormGroup formGroup,
  }) async {
    try {
      submitData.value = const AsyncData(loading: true);

      List<ItemRequest>? items = [];
      formGroup.control('item').value.forEach((item) {
        items.add(ItemRequest(
          itemCode: item['itemCode'],
          details: item['details'],
          quantity: item['quantity'],
          unit: item['unit'],
          unitPrice: item['unitPrice'],
        ));
      });

      List<NoteInvoiceRequest>? notes = [];

      formGroup.control('notes').value.forEach((note) {
        notes.add(NoteInvoiceRequest(
          note: note['note'],
        ));
      });

      String? logoFile;
      if (formGroup.control('logoFile').value != null) {
        FileSelect docFile = formGroup.control('logoFile').value;
        if (docFile.file != null) {
          try {
            String base64Image = base64Encode(docFile.file!);
            FileResponse fileData = await patientRepository.uploadFileBase64(
              base64Image,
              docFile.filename!,
            );
            logoFile = fileData.filename;
          } catch (e) {
            logger.e(e);
          }
        } else {
          logoFile = docFile.url;
        }
      }

      String? stampFile;
      if (formGroup.control('stampFile').value != null) {
        FileSelect docFile = formGroup.control('stampFile').value;
        if (docFile.file != null) {
          try {
            String base64Image = base64Encode(docFile.file!);
            FileResponse fileData = await patientRepository.uploadFileBase64(
              base64Image,
              docFile.filename!,
            );
            stampFile = fileData.filename;
          } catch (e) {
            logger.e(e);
          }
        } else {
          stampFile = docFile.url;
        }
      }

      MedicalInvoiceRequest request = MedicalInvoiceRequest(
        logoFile: logoFile,
        stampFile: stampFile,
        type: false,
        invoiceNumber: formGroup.control('invoiceNumber').value,
        invoiceDate: formGroup.control('invoiceDate').value,
        companyName: formGroup.control('companyName').value,
        address: formGroup.control('address').value,
        telNumber: formGroup.control('telNumber').value,
        fexNumber: formGroup.control('fexNumber').value,
        inCharge: formGroup.control('inCharge').value,
        remarks: formGroup.control('remarks').value,
        notes: notes,
        item: items,
        medicalRecord: formGroup.control('medicalRecord').value,
        user: formGroup.control('user').value,
        patient: formGroup.control('user').value,
        hospitalRecord: formGroup.control('hospitalRecord').value,
      );

      Uint8List? pathFileJP = await generatePdfFromInvoice(
          request, patientData.value.requireData, 'JP');
      String? fileNamePdfJP;

      if (pathFileJP != null) {
        try {
          String base64Image = base64Encode(pathFileJP);
          FileResponse fileData = await patientRepository.uploadFileBase64(
            base64Image,
            // get timestamp to avoid duplicate file name
            'quotation_${DateTime.now().millisecondsSinceEpoch}_JP.pdf',
          );
          fileNamePdfJP = fileData.filename;
        } catch (e) {
          logger.e(e);
        }
      }

      Uint8List? pathFileZH = await generatePdfFromInvoice(
          request, patientData.value.requireData, 'ZH');
      String? fileNamePdfZH;

      if (pathFileZH != null) {
        try {
          String base64Image = base64Encode(pathFileZH);
          FileResponse fileData = await patientRepository.uploadFileBase64(
            base64Image,
            // get timestamp to avoid duplicate file name
            'quotation_${DateTime.now().millisecondsSinceEpoch}_ZH.pdf',
          );
          fileNamePdfZH = fileData.filename;
        } catch (e) {
          logger.e(e);
        }
      }

      Uint8List? pathFileZHTW = await generatePdfFromInvoice(
          request, patientData.value.requireData, 'ZHTW');
      String? fileNamePdfZHTW;

      if (pathFileZHTW != null) {
        try {
          String base64Image = base64Encode(pathFileZHTW);
          FileResponse fileData = await patientRepository.uploadFileBase64(
            base64Image,
            // get timestamp to avoid duplicate file name
            'quotation_${DateTime.now().millisecondsSinceEpoch}_ZHTW.pdf',
          );
          fileNamePdfZHTW = fileData.filename;
        } catch (e) {
          logger.e(e);
        }
      }

      Uint8List? pathFileVN = await generatePdfFromInvoice(
          request, patientData.value.requireData, 'VN');
      String? fileNamePdfVN;

      if (pathFileVN != null) {
        try {
          String base64Image = base64Encode(pathFileVN);
          FileResponse fileData = await patientRepository.uploadFileBase64(
            base64Image,
            // get timestamp to avoid duplicate file name
            'quotation_${DateTime.now().millisecondsSinceEpoch}_VN.pdf',
          );
          fileNamePdfVN = fileData.filename;
        } catch (e) {
          logger.e(e);
        }
      }

      Uint8List? pathFileEN = await generatePdfFromInvoice(
          request, patientData.value.requireData, 'EN');
      String? fileNamePdfEN;

      if (pathFileEN != null) {
        try {
          String base64Image = base64Encode(pathFileEN);
          FileResponse fileData = await patientRepository.uploadFileBase64(
            base64Image,
            // get timestamp to avoid duplicate file name
            'quotation_${DateTime.now().millisecondsSinceEpoch}_EN.pdf',
          );
          fileNamePdfEN = fileData.filename;
        } catch (e) {
          logger.e(e);
        }
      }

      if (fileNamePdfJP != null) {
        if (formGroup.control('_id').value != null) {
          await updateInvoice(
            id: formGroup.control('_id').value,
            request: request.copyWith(
              fileNamePdfJP: fileNamePdfJP,
              fileNamePdfZH: fileNamePdfZH,
              fileNamePdfVN: fileNamePdfVN,
              fileNamePdfEN: fileNamePdfEN,
              fileNamePdfZHTW: fileNamePdfZHTW,
            ),
          );
        } else {
          await createInvoice(
            request: request.copyWith(
              fileNamePdfJP: fileNamePdfJP,
              fileNamePdfZH: fileNamePdfZH,
              fileNamePdfVN: fileNamePdfVN,
              fileNamePdfEN: fileNamePdfEN,
              fileNamePdfZHTW: fileNamePdfZHTW,
            ),
          );
        }

        editData.value = const AsyncData();
        submitData.value = const AsyncData(data: true);
        formGroup.reset();
      } else {
        submitData.value = const AsyncData(error: 'ファイルの作成に失敗しました');
      }
    } catch (e) {
      logger.e(e);
      submitData.value = AsyncData(error: e);
    }
  }

  Future<void> createInvoice({
    required MedicalInvoiceRequest request,
  }) async {
    try {
      medicalInvoiceData.value = medicalInvoiceData.value.copyWith(
        loading: true,
      );
      final response = await patientRepository.postInvoice(request);
      medicalInvoiceData.value = AsyncData(data: [
        response,
        ...medicalInvoiceData.value.data ?? [],
      ]);
    } catch (e) {
      logger.e(e);
      medicalInvoiceData.value = AsyncData(error: e);
    }
  }

  Future<void> updateInvoice({
    required String id,
    required MedicalInvoiceRequest request,
  }) async {
    try {
      medicalInvoiceData.value = medicalInvoiceData.value.copyWith(
        loading: true,
      );
      final response = await patientRepository.putInvoice(id, request);
      medicalInvoiceData.value = AsyncData(data: [
        response,
        ...medicalInvoiceData.value.data ??
            [].where((element) => element.id != response.id),
      ]);
    } catch (e) {
      logger.e(e);
      medicalInvoiceData.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<bool>> delete = ValueNotifier(const AsyncData());

  Future<void> deleteInvoice(List<String> ids) async {
    try {
      delete.value = const AsyncData(loading: true);
      for (var id in ids) {
        await patientRepository.deleteInvoice(id);
        medicalInvoiceData.value = AsyncData(
            data: medicalInvoiceData.value.data!
              ..removeWhere((element) => element.id == id));
      }

      delete.value = const AsyncData(data: true);
    } catch (e) {
      logger.e(e);
      delete.value = AsyncData(error: e.toString());
    }
  }
}

Future<Uint8List?> generatePdfFromInvoice(
    MedicalInvoiceRequest request, Patient patient, String language) async {
  final pdf = pw.Document(pageMode: PdfPageMode.fullscreen);

  late ByteData fontData;
  late pw.Font ttf;

  ByteData fontDataJP = await rootBundle.load('assets/fonts/NotoSans_JP.ttf');
  pw.Font ttfJP = pw.Font.ttf(fontDataJP);

  // Load font based on language
  switch (language) {
    case 'JP':
      fontData = await rootBundle.load('assets/fonts/NotoSans_JP.ttf');
      break;
    case 'ZH':
      fontData = await rootBundle.load('assets/fonts/Noto_Sans_ZH.ttf');
      break;
    case 'ZHTW':
      fontData = await rootBundle.load('assets/fonts/Noto_Sans_TC.ttf');
      break;
    case 'VN':
      fontData = await rootBundle.load('assets/fonts/Roboto_VN.ttf');
      break;
    default: // EN
      fontData = await rootBundle.load('assets/fonts/Open_Sans_EN.ttf');
  }
  ttf = pw.Font.ttf(fontData);

  String title;
  String quotationNumberLabel;
  String quotationDateLabel;
  String companyNameLabel;
  String addressLabel;
  String telNumberLabel;
  String fexNumberLabel;
  String inChargeLabel;
  List<String> tableHeaders;

  // Load appropriate fonts and text labels based on the language
  switch (language) {
    case 'JP':
      title = '請　求　書';
      quotationNumberLabel = '見積番号: ';
      quotationDateLabel = '見積日: ';
      companyNameLabel = '件名: ';
      addressLabel = '住所: ';
      telNumberLabel = '電話番号: ';
      fexNumberLabel = 'FAX番号: ';
      inChargeLabel = '担当者: ';
      tableHeaders = ['', '項目', '数', '量', '単価', '金額'];
      break;

    case 'ZH':
      title = '报价单';
      quotationNumberLabel = '报价单号: ';
      quotationDateLabel = '预计日期: ';
      companyNameLabel = '主题: ';
      addressLabel = '地址: ';
      telNumberLabel = '电话号码: ';
      fexNumberLabel = '传真号码: ';
      inChargeLabel = '负责人: ';
      tableHeaders = ['', '项目', '数', '量', '单价', '金额'];
      break;

    case 'ZHTW':
      title = '報價單';
      quotationNumberLabel = '報價單號: ';
      quotationDateLabel = '預計日期: ';
      companyNameLabel = '主題: ';
      addressLabel = '地址: ';
      telNumberLabel = '電話號碼: ';
      fexNumberLabel = '傳真號碼: ';
      inChargeLabel = '負責人: ';
      tableHeaders = ['', '項目', '數', '量', '單價', '金額'];
      break;

    case 'VN':
      title = 'báo giá';
      quotationNumberLabel = 'số báo giá: ';
      quotationDateLabel = 'ngày dự kiến: ';
      companyNameLabel = 'chủ đề: ';
      addressLabel = 'địa chỉ: ';
      telNumberLabel = 'số điện thoại: ';
      fexNumberLabel = 'số fax: ';
      inChargeLabel = 'người chịu trách nhiệm: ';
      tableHeaders = ['', 'mục', 'số', 'lượng', 'đơn giá', 'số tiền'];
      break;

    default:
      title = 'Invoice';
      quotationNumberLabel = 'Quotation number: ';
      quotationDateLabel = 'Quotation date: ';
      companyNameLabel = 'Company name: ';
      addressLabel = 'Address: ';
      telNumberLabel = 'Tel number: ';
      fexNumberLabel = 'Fex number: ';
      inChargeLabel = 'In charge: ';
      tableHeaders = ['', 'Item', 'Quantity', 'Unit', 'Unit Price', 'Amount'];
  }
  Uint8List? logoImage;
  Uint8List? stampImage;

  if (request.logoFile != null && request.logoFile!.isNotEmpty) {
    logoImage = await downloadImageAsUint8List(request.logoFile!);
  }

  if (request.stampFile != null && request.stampFile!.isNotEmpty) {
    stampImage = await downloadImageAsUint8List(request.stampFile!);
  }

  pdf.addPage(
    pw.MultiPage(
      margin: const pw.EdgeInsets.all(8),
      theme: pw.ThemeData(
        defaultTextStyle: pw.TextStyle(
          font: ttf,
          fontSize: 12,
        ),
      ),
      build: (context) => [
        pw.Header(
          level: 0,
          child: pw.Align(
            alignment: pw.Alignment.center,
            child: pw.Text(
              title,
              style: pw.TextStyle(
                font: ttf,
                fontSize: 30,
              ),
              textAlign: pw.TextAlign.center,
            ),
          ),
        ),
        pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            mainAxisAlignment: pw.MainAxisAlignment.end,
            children: [
              pw.Text(
                quotationNumberLabel,
                style: pw.TextStyle(font: ttf),
              ),
              pw.Text(
                request.invoiceNumber ?? '',
                style: pw.TextStyle(font: ttfJP),
              ),
            ]),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              mainAxisAlignment: pw.MainAxisAlignment.start,
              children: [
                pw.Text(
                  '${patient.firstNameRomanized ?? ''} ${patient.middleNameRomanized ?? ''} ${patient.familyNameRomanized ?? ''}'
                  ' 様',
                  style: pw.TextStyle(font: ttfJP),
                ),
              ]),
          pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              mainAxisAlignment: pw.MainAxisAlignment.end,
              children: [
                pw.Text(
                  quotationDateLabel,
                  style: pw.TextStyle(font: ttf),
                ),
                pw.Text(
                  request.invoiceDate != null
                      ? Dates.formatFullDate(request.invoiceDate!)
                      : '',
                  style: pw.TextStyle(font: ttfJP),
                ),
              ])
        ]),
        if (logoImage != null || stampImage != null)
          pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              mainAxisAlignment: pw.MainAxisAlignment.end,
              children: [
                if (logoImage != null)
                  pw.Image(
                    pw.MemoryImage(logoImage),
                    height: 100,
                    width: 100,
                    fit: pw.BoxFit.contain,
                  ),
                if (stampImage != null)
                  pw.Image(
                    pw.MemoryImage(stampImage),
                    height: 100,
                    width: 100,
                    fit: pw.BoxFit.contain,
                  ),
              ]),
        pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            mainAxisAlignment: pw.MainAxisAlignment.end,
            children: [
              pw.Text(
                companyNameLabel,
                style: pw.TextStyle(font: ttf),
              ),
              pw.Text(
                request.companyName ?? '',
                style: pw.TextStyle(font: ttfJP),
              ),
            ]),
        pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            mainAxisAlignment: pw.MainAxisAlignment.end,
            children: [
              pw.Text(
                addressLabel,
                style: pw.TextStyle(font: ttf),
              ),
              pw.Text(
                request.address ?? '',
                style: pw.TextStyle(font: ttfJP),
              ),
            ]),
        pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            mainAxisAlignment: pw.MainAxisAlignment.end,
            children: [
              pw.Text(
                telNumberLabel,
                style: pw.TextStyle(font: ttf),
              ),
              pw.Text(
                request.telNumber ?? '',
                style: pw.TextStyle(font: ttfJP),
              ),
            ]),
        pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            mainAxisAlignment: pw.MainAxisAlignment.end,
            children: [
              pw.Text(
                fexNumberLabel,
                style: pw.TextStyle(font: ttf),
              ),
              pw.Text(
                request.fexNumber ?? '',
                style: pw.TextStyle(font: ttfJP),
              ),
            ]),
        pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            mainAxisAlignment: pw.MainAxisAlignment.end,
            children: [
              pw.Text(
                inChargeLabel,
                style: pw.TextStyle(font: ttf),
              ),
              pw.Text(
                request.inCharge ?? '',
                style: pw.TextStyle(font: ttfJP),
              ),
            ]),
        pw.SizedBox(height: 20),
        pw.TableHelper.fromTextArray(
          headers: tableHeaders,
          headerStyle: pw.TextStyle(font: ttf),
          columnWidths: {
            0: const pw.FlexColumnWidth(1),
            1: const pw.FlexColumnWidth(6),
            2: const pw.FlexColumnWidth(1),
            3: const pw.FlexColumnWidth(1),
            4: const pw.FlexColumnWidth(2),
            5: const pw.FlexColumnWidth(2),
          },
          headerAlignment: pw.Alignment.centerLeft,
          cellAlignment: pw.Alignment.centerLeft,
          headerCellDecoration:
              const pw.BoxDecoration(color: PdfColor.fromInt(0xff98FF98)),
          oddCellStyle: pw.TextStyle(font: ttfJP),
          cellStyle: pw.TextStyle(font: ttfJP),
          data: request.item
                  ?.map((item) => [
                        pw.Text(
                          item.itemCode ?? '--',
                          style: pw.TextStyle(
                            font: ttfJP,
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 9,
                          ),
                        ),
                        pw.Text(
                          item.details ?? '',
                          style: pw.TextStyle(
                            font: ttfJP,
                            fontWeight: pw.FontWeight.normal,
                            fontSize: 10,
                          ),
                        ),
                        item.quantity ?? '',
                        item.unit ?? '',
                        '${Strings.formatCurrency(item.unitPrice ?? 0)}'
                            ' 円',
                        '${Strings.formatCurrency((item.quantity ?? 0) * (double.tryParse("${item.unit ?? 0}") ?? 0))}'
                            ' 円',
                      ])
                  .toList() ??
              [],
        ),
        // notes
        pw.TableHelper.fromTextArray(
          columnWidths: {
            0: const pw.FlexColumnWidth(0),
            1: const pw.FlexColumnWidth(12),
          },
          data: request.notes
                  ?.map((note) => [
                        '',
                        pw.Text(
                          note.note ?? '',
                          style: pw.TextStyle(
                            font: ttfJP,
                            fontWeight: pw.FontWeight.normal,
                            fontSize: 10,
                          ),
                        ),
                      ])
                  .toList() ??
              [],
        ),
        pw.TableHelper.fromTextArray(columnWidths: {
          0: const pw.FlexColumnWidth(10),
          1: const pw.FlexColumnWidth(0),
          2: const pw.FlexColumnWidth(0),
          3: const pw.FlexColumnWidth(0),
          4: const pw.FlexColumnWidth(0),
          5: const pw.FlexColumnWidth(2),
        }, data: [
          [
            '計',
            '',
            '',
            '',
            '',
            Strings.formatCurrency(subTotal(request.item ?? [])),
          ],
          [
            '消費税（${int.tryParse(request.taxRate.toString()) ?? 0}%）',
            '',
            '',
            '',
            '',
            Strings.formatCurrency(
                taxCalculation(subTotal(request.item ?? []), request.taxRate)),
          ],
        ]),
        pw.TableHelper.fromTextArray(
            headerCellDecoration:
                const pw.BoxDecoration(color: PdfColor.fromInt(0xff98FF98)),
            cellDecoration: (i, _, __) {
              return const pw.BoxDecoration(
                  color: PdfColor.fromInt(0xff98FF98));
            },
            columnWidths: {
              0: const pw.FlexColumnWidth(10),
              1: const pw.FlexColumnWidth(0),
              2: const pw.FlexColumnWidth(0),
              3: const pw.FlexColumnWidth(0),
              4: const pw.FlexColumnWidth(0),
              5: const pw.FlexColumnWidth(2),
            },
            data: [
              [
                '合計',
                '',
                '',
                '',
                '',
                Strings.formatCurrency(total(
                    subTotal(request.item ?? []),
                    taxCalculation(
                        subTotal(request.item ?? []), request.taxRate))),
              ],
            ]),
        pw.SizedBox(height: 20),
        pw.Text(
          '【特記事項】',
          style: pw.TextStyle(font: ttfJP),
        ),
        pw.Text(
          request.remarks ?? '',
          style: pw.TextStyle(font: ttfJP),
        ),
      ],
    ),
  );

  try {
    Uint8List pdfBytes = await pdf.save();
    return pdfBytes;
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    return null;
  }
}

double subTotal(List<ItemRequest> items) {
  double total = 0;
  for (var item in items) {
    total += (item.quantity ?? 0) * (item.unitPrice ?? 0);
  }
  return total;
}

double taxCalculation(double subTotal, String? taxRate) {
  return subTotal * (int.tryParse(taxRate ?? '0') ?? 0) / 100;
}

double total(double subTotal, double tax) {
  return subTotal + tax;
}
