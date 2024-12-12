// Flutter imports:
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:core_utils/core_utils.dart';

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
    editData.value = AsyncData(data: invoice,loading: true);
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
    formGroup.control('totalAmount').value = invoice.totalAmount;

    formGroup.control('medicalRecord').value = invoice.medicalRecord.id;
    formGroup.control('user').value = invoice.user?.id;
    formGroup.control('hospitalRecord').value = invoice.hospitalRecord?.id;

    formGroup.control('remarks').value = invoice.remarks;
    formGroup.control('taxRate').value = invoice.taxRate;
    formGroup.control('taxRateOption').value = invoice.taxRateOption;

    if (invoice.notes?.isNotEmpty == true) {
      FormArray notes = formGroup.control('notes') as FormArray;
      notes.clear();
      notes.reset();
      for (NoteInvoiceResponse note in invoice.notes ?? []) {
        notes.add(
          FormGroup({
            '_id': FormControl<String>(value: note.id),
            'note': FormControl<String>(value: note.note),
          }),
        );
      }
    }

    try {
      if (invoice.item?.isNotEmpty == true) {
        FormArray item = formGroup.control('item') as FormArray;
        item.clear();
        item.reset();
        for (ItemResponse itemData in invoice.item ?? []) {
          logger.d('edit info: ${itemData.toJson()}');
          item.add(
            FormGroup({
              '_id': FormControl<String>(value: itemData.id),
              'itemCode': FormControl<String>(value: itemData.itemCode),
              'details': FormControl<String>(value: itemData.details),
              'quantity': FormControl<double>(value: itemData.quantity),
              'unit': FormControl<String>(value: itemData.unit ?? '式'),
              'unitPrice': FormControl<double>(value: itemData.unitPrice),
            }),
          );
        }
      }
      await Future.delayed(const Duration(milliseconds: 500), () {
        editData.value = AsyncData(data: invoice);
      });
    } catch (e) {
      logger.e(e);
      editData.value = AsyncData(data: invoice);
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
        items.add(ItemRequest.fromJson(item));
      });

      List<NoteInvoiceRequest>? notes = [];

      formGroup.control('notes').value.forEach((note) {
        notes.add(NoteInvoiceRequest.fromJson(note));
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
        type: true,
        invoiceNumber: formGroup.control('invoiceNumber').value,
        invoiceDate: formGroup.control('invoiceDate').value,
        companyName: formGroup.control('companyName').value,
        address: formGroup.control('address').value,
        telNumber: formGroup.control('telNumber').value,
        fexNumber: formGroup.control('fexNumber').value,
        inCharge: formGroup.control('inCharge').value,
        totalAmount: formGroup.control('totalAmount').value,
        remarks: formGroup.control('remarks').value,
        notes: notes,
        item: items,
        medicalRecord: formGroup.control('medicalRecord').value,
        user: formGroup.control('user').value,
        patient: formGroup.control('user').value,
        hospitalRecord: formGroup.control('hospitalRecord').value,
        taxRate: formGroup.control('taxRate').value,
        taxRateOption: formGroup.control('taxRateOption').value,
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
      medicalInvoiceData.value = AsyncData(
        data: medicalInvoiceData.value.data ?? []
          ..removeWhere((element) => element.id == id)
          ..add(response),
      );
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

  final Uint8List fontData;

  Uint8List fontDataJP = (await rootBundle.load('assets/fonts/NotoSans_JP.ttf'))
      .buffer
      .asUint8List();
  final ttfJP = pw.Font.ttf(fontDataJP.buffer.asByteData());

  Uint8List fontDataJPRegular =
      (await rootBundle.load('assets/fonts/NotoSansJP_Bold.ttf'))
          .buffer
          .asUint8List();
  final ttfJPPRegular = pw.Font.ttf(fontDataJPRegular.buffer.asByteData());

  // Load font based on language
  switch (language) {
    case 'JP':
      fontData = (await rootBundle.load('assets/fonts/NotoSans_JP.ttf'))
          .buffer
          .asUint8List();
      break;
    case 'ZH':
      fontData = (await rootBundle.load('assets/fonts/Noto_Sans_ZH.ttf'))
          .buffer
          .asUint8List();
      break;
    case 'ZHTW':
      fontData = (await rootBundle.load('assets/fonts/Noto_Sans_TC.ttf'))
          .buffer
          .asUint8List();
      ;
      break;
    case 'VN':
      fontData = (await rootBundle.load('assets/fonts/Roboto_VN.ttf'))
          .buffer
          .asUint8List();
      break;
    default: // EN
      fontData = (await rootBundle.load('assets/fonts/Open_Sans_EN.ttf'))
          .buffer
          .asUint8List();
  }
  final ttf = pw.Font.ttf(fontData.buffer.asByteData());

  String title;
  String quotationNumberLabel;
  String quotationDateLabel;
  String totalAmountLabel;
  List<String> tableHeaders;
  String subTotalLabel;
  String taxLabel;
  String totalLabel;
  String remarksLabel;
  String subTitle;

  switch (language) {
    case 'JP':
      title = '御　見　積　書';
      subTitle = '下記の通り御見積りいたします。ご用命の程宜しくお願い申し上げます。';
      quotationNumberLabel = '見積番号: ';
      quotationDateLabel = '見積日: ';
      totalAmountLabel = '合計金額: ';
      tableHeaders = ['', '項目', '数', '量', '単価', '金額'];
      subTotalLabel = '計';
      taxLabel = '消費税';
      totalLabel = '合　　計';
      remarksLabel = '【特記事項】';
      break;

    case 'ZH':
      title = '报价单';
      subTitle = '我们将为您提供如下估价。感谢您一直以来的支持。';
      quotationNumberLabel = '报价单号: ';
      quotationDateLabel = '预计日期: ';
      totalAmountLabel = '总金额: ';
      tableHeaders = ['', '项目', '数', '量', '单价', '金额'];
      subTotalLabel = '計';
      taxLabel = '消費税';
      totalLabel = '合  计';
      remarksLabel = '【特記事項】';
      break;

    case 'ZHTW':
      title = '報價單';
      subTitle = '我們將為您提供以下估價。感謝您一直以來的支持。';
      quotationNumberLabel = '報價單號: ';
      quotationDateLabel = '預計日期: ';
      totalAmountLabel = '總金額: ';
      tableHeaders = ['', '項目', '數', '量', '單價', '金額'];
      subTotalLabel = '計';
      taxLabel = '消費税';
      totalLabel = '合  计';
      remarksLabel = '【特記事項】';
      break;

    case 'VN':
      title = 'Báo giá';
      subTitle =
          'Chúng tôi sẽ cung cấp cho bạn một ước tính như dưới đây.\n Cảm ơn bạn đã tiếp tục hỗ trợ.';
      quotationNumberLabel = 'số báo giá: ';
      quotationDateLabel = 'ngày dự kiến: ';
      totalAmountLabel = 'tổng số tiền: ';
      tableHeaders = ['', 'mục', 'số', 'lượng', 'đơn giá', 'số tiền'];
      subTotalLabel = 'tổng cộng';
      taxLabel = 'thuế';
      totalLabel = 'tổng cộng';
      remarksLabel = 'ghi chú';
      break;

    default:
      title = 'Invoice';
      subTitle =
          'We would like to provide you with a quote as shown below.\n We look forward to hearing from you.';
      quotationNumberLabel = 'Invoice number: ';
      quotationDateLabel = 'Invoice date: ';
      totalAmountLabel = 'Total amount: ';
      tableHeaders = ['', 'Item', 'Quantity', 'Unit', 'Unit Price', 'Amount'];
      subTotalLabel = 'Sub Total';
      taxLabel = 'Tax';
      totalLabel = 'Total';
      remarksLabel = 'Remarks';
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
          font: ttfJPPRegular,
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
                font: language == 'ZH' ? ttf : ttfJPPRegular,
                fontBold: ttfJPPRegular,
                fontSize: 30,
              ),
              textAlign: pw.TextAlign.center,
            ),
          ),
        ),
        pw.SizedBox(height: 20),
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
                style: pw.TextStyle(font: ttf),
              ),
            ]),

        pw.SizedBox(height: 20),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              mainAxisAlignment: pw.MainAxisAlignment.start,
              children: [
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text(
                        '${patient.firstNameRomanized ?? ''} ${patient.middleNameRomanized ?? ''} ${patient.familyNameRomanized ?? ''}'
                        ' 様',
                        style: pw.TextStyle(
                            font: ttfJPPRegular, fontBold: ttfJPPRegular
                            //fontWeight: pw.FontWeight.bold,
                            ),
                      ),
                      pw.Text(
                        subTitle,
                        style: pw.TextStyle(font: ttf),
                      ),
                    ])
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
                  style: pw.TextStyle(font: ttf),
                ),
              ])
        ]),
        pw.SizedBox(height: 20),
        pw.Row(children: [
          pw.Expanded(
            flex: 4,
            child: pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  pw.Container(
                    padding: const pw.EdgeInsets.all(8),
                    decoration: pw.BoxDecoration(
                      color: const PdfColor.fromInt(0xff98FF98),
                      border: pw.Border.all(
                        color: const PdfColor.fromInt(0xff000000),
                        width: 1,
                      ),
                    ),
                    child: pw.Text(
                      totalAmountLabel,
                      style: pw.TextStyle(font: ttf),
                    ),
                  ),
                  pw.Container(
                    padding: const pw.EdgeInsets.all(8),
                    decoration: pw.BoxDecoration(
                      color: const PdfColor.fromInt(0xffffffff),
                      border: pw.Border.all(
                        color: const PdfColor.fromInt(0xff000000),
                        width: 1,
                      ),
                    ),
                    child: pw.Text(
                      Strings.formatCurrency(total(
                          subTotal(request.item ?? []),
                          taxCalculation(subTotal(request.item ?? []),
                              (request.taxRate ?? 0)))),
                      style: pw.TextStyle(
                        font: ttfJPPRegular,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ),
                ]),
          ),
          pw.Expanded(
            flex: 8,
            child: pw.Row(
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
          )
        ]),
        pw.SizedBox(height: 20),
        pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            mainAxisAlignment: pw.MainAxisAlignment.end,
            children: [
              pw.Text(
                request.companyName ?? '',
                style: pw.TextStyle(font: ttf),
              ),
            ]),
        pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            mainAxisAlignment: pw.MainAxisAlignment.end,
            children: [
              pw.Text(
                request.address ?? '',
                style: pw.TextStyle(font: ttf),
              ),
            ]),
        pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            mainAxisAlignment: pw.MainAxisAlignment.end,
            children: [
              pw.Text(
                'Tel : ${request.telNumber ?? ''}',
                style: pw.TextStyle(font: ttf),
              ),
            ]),
        pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            mainAxisAlignment: pw.MainAxisAlignment.end,
            children: [
              pw.Text(
                'Fax : ${request.fexNumber ?? ''}',
                style: pw.TextStyle(font: ttf),
              ),
            ]),
        pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            mainAxisAlignment: pw.MainAxisAlignment.end,
            children: [
              pw.Text(
                '担当 : ${request.inCharge ?? ''}',
                style: pw.TextStyle(font: ttfJPPRegular),
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
          oddCellStyle: pw.TextStyle(font: ttfJPPRegular),
          cellStyle: pw.TextStyle(font: ttfJPPRegular),
          data: request.item
                  ?.map((item) => [
                        pw.Text(
                          item.itemCode ?? '--',
                          style: pw.TextStyle(
                            font: ttf,
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 9,
                          ),
                        ),
                        pw.Text(
                          item.details ?? '',
                          style: pw.TextStyle(
                            font: ttfJPPRegular,
                            fontWeight: pw.FontWeight.normal,
                            fontSize: 10,
                          ),
                        ),
                        item.quantity ?? '',
                        item.unit ?? '',
                        Strings.formatCurrency(item.unitPrice ?? 0),
                        Strings.formatCurrency(
                            (item.quantity ?? 0) * (item.unitPrice ?? 0)),
                      ])
                  .toList() ??
              [
                [
                  '',
                  '',
                  '',
                  '',
                  '',
                  '',
                ],
                [
                  '',
                  '',
                  '',
                  '',
                  '',
                  '',
                ]
              ],
        ),
        // notes
        pw.TableHelper.fromTextArray(
          columnWidths: {
            1: const pw.FlexColumnWidth(12),
          },
          data: request.notes
                  ?.map((note) => [
                        pw.Row(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text(
                                note.note ?? '',
                                style: pw.TextStyle(
                                  font: ttfJP,
                                  fontWeight: pw.FontWeight.normal,
                                  fontSize: 10,
                                ),
                                textAlign: pw.TextAlign.left,
                              )
                            ]),
                      ])
                  .toList() ??
              [
                [
                  '',
                ],
                [
                  '',
                ]
              ],
        ),
        pw.TableHelper.fromTextArray(columnWidths: {
          0: const pw.FlexColumnWidth(10),
          1: const pw.FlexColumnWidth(2),
        }, data: [
          [
            pw.Align(
              alignment: pw.Alignment.centerLeft,
              child: pw.Text(
                subTotalLabel,
                style: pw.TextStyle(font: ttf),
              ),
            ),
            pw.Align(
              alignment: pw.Alignment.centerRight,
              child: pw.Text(
                Strings.formatCurrency(subTotal(request.item ?? [])),
                style: pw.TextStyle(font: ttfJPPRegular),
              ),
            ),
          ],
          [
            pw.Align(
              alignment: pw.Alignment.centerLeft,
              child: pw.Text(
                '$taxLabel（${int.tryParse(request.taxRate.toString()) ?? 0}%）',
                style: pw.TextStyle(font: ttfJPPRegular),
              ),
            ),
            pw.Align(
              alignment: pw.Alignment.centerRight,
              child: pw.Text(
                request.taxRateOption ? '（外税）' : '（内税）',
                style: pw.TextStyle(font: ttfJPPRegular),
              ),
            ),
          ],
        ]),
        pw.TableHelper.fromTextArray(
            headerCellDecoration:
                const pw.BoxDecoration(color: PdfColor.fromInt(0xff98FF98)),
            headerDecoration:
                const pw.BoxDecoration(color: PdfColor.fromInt(0xff98FF98)),
            cellDecoration: (i, _, __) {
              return const pw.BoxDecoration(
                  color: PdfColor.fromInt(0xff98FF98));
            },
            rowDecoration:
                const pw.BoxDecoration(color: PdfColor.fromInt(0xff98FF98)),
            oddRowDecoration:
                const pw.BoxDecoration(color: PdfColor.fromInt(0xff98FF98)),
            headerHeight: 0,
            columnWidths: {
              0: const pw.FlexColumnWidth(10),
              1: const pw.FlexColumnWidth(2),
            },
            data: [
              [
                pw.Align(
                  alignment: pw.Alignment.centerLeft,
                  child: pw.Text(
                    totalLabel,
                    style: pw.TextStyle(font: ttf),
                  ),
                ),
                pw.Align(
                  alignment: pw.Alignment.centerRight,
                  child: pw.Text(
                    Strings.formatCurrency(total(
                        subTotal(request.item ?? []),
                        taxCalculation(
                            subTotal(request.item ?? []), request.taxRate))),
                    style: pw.TextStyle(
                      font: ttfJPPRegular,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ]),
        pw.SizedBox(height: 20),
        pw.Text(
          remarksLabel,
          style: pw.TextStyle(font: ttf),
        ),
        pw.SizedBox(height: 20),
        pw.Text(
          request.remarks ?? '',
          style: pw.TextStyle(font: ttf),
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

double taxCalculation(double subTotal, int? taxRate) {
  return subTotal * (taxRate ?? 0) / 100;
}

double total(double subTotal, double tax) {
  return subTotal + tax;
}
