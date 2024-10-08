// Flutter imports:
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:core_utils/core_utils.dart';

import 'package:excel/excel.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:data_patient/data_patient.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class EstimateModel {
  EstimateModel({
    required this.patientRepository,
  });

  final PatientRepository patientRepository;

  ValueNotifier<AsyncData<Patient>> patientData =
      ValueNotifier(const AsyncData());
  ValueNotifier<AsyncData<MedicalRecord>> medicalRecordData =
      ValueNotifier(const AsyncData());

  ValueNotifier<AsyncData<List<MedicalInvoiceResponse>>> medicalQuotationData =
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
    await fetchMedicalQuotation(medicalRecordId: medicalRecord.id);
  }

  Future<void> fetchMedicalQuotation({
    required String medicalRecordId,
  }) async {
    try {
      medicalQuotationData.value = const AsyncData(loading: true);
      final response = await patientRepository.getInvoices(
        medicalRecord: medicalRecordId,
        type: false, // Quotation
      );
      medicalQuotationData.value = AsyncData(data: response);
    } catch (e) {
      logger.e(e);
      medicalQuotationData.value = AsyncData(error: e);
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
          transactionDate: item['transactionDate'],
          details: item['details'],
          quantity: item['quantity'],
          unit: item['unit'],
          unitPrice: item['unitPrice'],
          amount: item['amount'],
          taxRate: item['taxRate'],
        ));
      });

      List<TotalPaymentRequest>? totalPayment = [];

      formGroup.control('totalPayment').value.forEach((payment) {
        totalPayment.add(TotalPaymentRequest(
          taxRate: payment['taxRate'],
          amountExcludingTaxInYen: payment['amountExcludingTaxInYen'],
          consumptionTaxAmountInYen: payment['consumptionTaxAmountInYen'],
        ));
      });

      MedicalInvoiceRequest request = MedicalInvoiceRequest(
        type: false,
        invoiceNumber: formGroup.control('invoiceNumber').value,
        invoiceDate: formGroup.control('invoiceDate').value,
        contact: formGroup.control('contact').value,
        registrationNumber: formGroup.control('registrationNumber').value,
        subject: formGroup.control('subject').value,
        amountBilled: formGroup.control('amountBilled').value,
        paymentDeadline: formGroup.control('paymentDeadline').value,
        remarks: formGroup.control('remarks').value,
        totalPayment: totalPayment,
        item: items,
        medicalRecord: formGroup.control('medicalRecord').value,
        user: formGroup.control('user').value,
        patient: formGroup.control('user').value,
        hospitalRecord: formGroup.control('hospitalRecord').value,
      );

      Uint8List? pathFileJP = await generatePdfFromQuotation(
        request,
        patientData.value.requireData,
        'JP',
      );
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

      Uint8List? pathFileZH = await generatePdfFromQuotation(
        request,
        patientData.value.requireData,
        'ZH',
      );
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

      Uint8List? pathFileZHTW = await generatePdfFromQuotation(
        request,
        patientData.value.requireData,
        'ZHTW',
      );
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

      Uint8List? pathFileVN = await generatePdfFromQuotation(
        request,
        patientData.value.requireData,
        'VN',
      );
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

      Uint8List? pathFileEN = await generatePdfFromQuotation(
        request,
        patientData.value.requireData,
        'EN',
      );
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
        await createQuotation(
          request: request.copyWith(
            fileNamePdfJP: fileNamePdfJP,
            fileNamePdfZH: fileNamePdfZH,
            fileNamePdfVN: fileNamePdfVN,
            fileNamePdfEN: fileNamePdfEN,
            fileNamePdfZHTW: fileNamePdfZHTW,
          ),
        );
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

  ValueNotifier<AsyncData<bool>> delete = ValueNotifier(const AsyncData());

  Future<void> deleteInvoice(List<String> ids) async {
    try {
      delete.value = const AsyncData(loading: true);
      for (var id in ids) {
        await patientRepository.deleteInvoice(id);
        medicalQuotationData.value = AsyncData(
            data: medicalQuotationData.value.data!
              ..removeWhere((element) => element.id == id));
      }

      delete.value = const AsyncData(data: true);
    } catch (e) {
      logger.e(e);
      delete.value = AsyncData(error: e.toString());
    }
  }

  Future<void> createQuotation({
    required MedicalInvoiceRequest request,
  }) async {
    try {
      medicalQuotationData.value = medicalQuotationData.value.copyWith(
        loading: true,
      );
      final response = await patientRepository.postInvoice(request);
      medicalQuotationData.value = AsyncData(data: [
        response,
        ...medicalQuotationData.value.data ?? [],
      ]);
      logger.d('Quotation created: ${medicalQuotationData.value.data?.length}');
    } catch (e) {
      logger.e(e);
      medicalQuotationData.value = AsyncData(error: e);
    }
  }
}

Future<Uint8List?> generatePdfFromQuotation(
    MedicalInvoiceRequest request, Patient patient, String language) async {
  final pdf = pw.Document();

  late ByteData fontData;
  late pw.Font ttf;
  pw.PageTheme pageTheme = pw.PageTheme(
    pageFormat: PdfPageFormat.a4,
    margin: pw.EdgeInsets.zero,
  );

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
  String subjectLabel;
  String totalAmountLabel;
  String contactLabel;
  String registrationNumberLabel;
  String paymentDeadlineLabel;
  String remarksLabel;
  String taxRateLabel;
  String taxExcludedAmountLabel;
  String consumptionTaxLabel;
  String totalAmountYenLabel;
  List<String> tableHeaders;

  // Load appropriate fonts and text labels based on the language
  switch (language) {
    case 'JP':
      title = '見積書';
      quotationNumberLabel = '見積番号: ';
      quotationDateLabel = '見積日: ';
      subjectLabel = '件名: ';
      totalAmountLabel = '合計金額: ';
      contactLabel = '担当者: ';
      registrationNumberLabel = '登録番号: ';
      paymentDeadlineLabel = '有効期限';
      remarksLabel = '備考';
      taxRateLabel = '税率';
      taxExcludedAmountLabel = '税抜金額（円）';
      consumptionTaxLabel = '消費税(円)';
      totalAmountYenLabel = '合計金額(円)';
      tableHeaders = ['', '取引日', '内訳', '数量', '単位', '単価', '金額', '税率'];
      break;

    case 'ZH':
      title = '估计';
      quotationNumberLabel = '报价单号: ';
      quotationDateLabel = '预计日期: ';
      subjectLabel = '主题: ';
      totalAmountLabel = '总金额: ';
      contactLabel = '经理: ';
      registrationNumberLabel = '注册号: ';
      paymentDeadlineLabel = '到期日期';
      remarksLabel = '评论';
      taxRateLabel = '税率';
      taxExcludedAmountLabel = '减税金额（元）';
      consumptionTaxLabel = '消费税（日元）';
      totalAmountYenLabel = '总金额（日元）';
      tableHeaders = ['', '交易日', '分解', '数量', '首位', '单价', '数量', '税率'];
      break;

    case 'ZHTW':
      title = '估計';
      quotationNumberLabel = '報價單號: ';
      quotationDateLabel = '預計日期: ';
      subjectLabel = '主題: ';
      totalAmountLabel = '總金額: ';
      contactLabel = '主管: ';
      registrationNumberLabel = '註冊號: ';
      paymentDeadlineLabel = '到期日期';
      remarksLabel = '評論';
      taxRateLabel = '稅率';
      taxExcludedAmountLabel = '減稅金額（元）';
      consumptionTaxLabel = '消費稅（日元）';
      totalAmountYenLabel = '總金額（日元）';
      tableHeaders = ['', '交易日', '分解', '數量', '首位', '單價', '數量', '稅率'];
      break;

    case 'VN':
      title = 'Ước lượng';
      quotationNumberLabel = 'số báo giá: ';
      quotationDateLabel = 'ngày dự kiến: ';
      subjectLabel = 'chủ thể: ';
      totalAmountLabel = 'tổng số tiền: ';
      contactLabel = 'giám đốc: ';
      registrationNumberLabel = 'số đăng ký: ';
      paymentDeadlineLabel = 'ngày hết hạn';
      remarksLabel = 'nhận xét';
      taxRateLabel = 'thuế suất';
      taxExcludedAmountLabel = 'Dòng khấu trừ thuế (cổng)';
      consumptionTaxLabel = 'Thuế tiêu dùng (yên)';
      totalAmountYenLabel = 'Tổng số tiền (yên)';
      tableHeaders = [
        '',
        'ngày giao dịch',
        'sự cố',
        'Số lượng',
        'Vị trí đầu tiên',
        'đơn giá',
        'số lượng',
        'thuế suất'
      ];
      break;

    default:
      title = 'Quotation';
      quotationNumberLabel = 'Quotation number: ';
      quotationDateLabel = 'Quotation date: ';
      subjectLabel = 'Subject: ';
      totalAmountLabel = 'Total amount: ';
      contactLabel = 'Contact: ';
      registrationNumberLabel = 'Registration number: ';
      paymentDeadlineLabel = 'Date of Expiry';
      remarksLabel = 'Remarks';
      taxRateLabel = 'Tax rate';
      taxExcludedAmountLabel = 'Tax excluded amount (yen)';
      consumptionTaxLabel = 'Consumption tax (yen)';
      totalAmountYenLabel = 'Total amount (yen)';
      tableHeaders = [
        '',
        'Transaction Date',
        'Detail',
        'QTY',
        'Unit',
        'Unit price',
        'Amount',
        'Tax rate'
      ];
  }

  // Add the content to the PDF
  pdf.addPage(
    pw.MultiPage(
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
        pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            mainAxisAlignment: pw.MainAxisAlignment.end,
            children: [
              pw.Text(
                contactLabel,
                style: pw.TextStyle(font: ttf),
              ),
              pw.Text(
                request.contact ?? '',
                style: pw.TextStyle(font: ttfJP),
              ),
            ]),
        pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            mainAxisAlignment: pw.MainAxisAlignment.end,
            children: [
              pw.Text(
                registrationNumberLabel,
                style: pw.TextStyle(font: ttf),
              ),
              pw.Text(
                request.registrationNumber ?? '',
                style: pw.TextStyle(font: ttfJP),
              ),
            ]),
        pw.Row(children: [
          pw.Text(
            subjectLabel,
            style: pw.TextStyle(font: ttf),
          ),
          pw.Text(
            request.subject ?? '',
            style: pw.TextStyle(font: ttfJP),
          ),
        ]),
        pw.Row(children: [
          pw.Text(
            totalAmountLabel,
            style: pw.TextStyle(font: ttf),
          ),
          pw.Text(
            '${request.amountBilled ?? ''} 円',
            style: pw.TextStyle(font: ttfJP),
          ),
        ]),
        pw.SizedBox(height: 20),
        pw.TableHelper.fromTextArray(
          headers: [
            taxRateLabel,
            taxExcludedAmountLabel,
            consumptionTaxLabel,
            totalAmountYenLabel
          ],
          headerCellDecoration:
              const pw.BoxDecoration(color: PdfColor.fromInt(0xffe0e0e0)),
          columnWidths: {
            0: const pw.FlexColumnWidth(1),
            1: const pw.FlexColumnWidth(2),
            2: const pw.FlexColumnWidth(2),
            3: const pw.FlexColumnWidth(2),
          },
          headerAlignment: pw.Alignment.centerLeft,
          cellAlignment: pw.Alignment.centerLeft,
          headerStyle: pw.TextStyle(font: ttf),
          oddCellStyle: pw.TextStyle(font: ttfJP),
          cellStyle: pw.TextStyle(font: ttfJP),
          data: request.totalPayment
                  ?.map((payment) => [
                        payment.taxRate ?? '' ' %',
                        payment.amountExcludingTaxInYen ?? '' ' 円',
                        payment.consumptionTaxAmountInYen ?? '' ' 円',
                        '${(payment.amountExcludingTaxInYen ?? 0) + (payment.consumptionTaxAmountInYen ?? 0)}'
                            ' 円',
                      ])
                  .toList() ??
              [],
        ),
        pw.SizedBox(height: 20),
        pw.TableHelper.fromTextArray(
          columnWidths: {
            0: const pw.FlexColumnWidth(1),
            1: const pw.FlexColumnWidth(2)
          },
          headerAlignment: pw.Alignment.centerLeft,
          cellAlignment: pw.Alignment.centerLeft,
          cellDecoration: (rowIndex, value, columnIndex) {
            if (columnIndex == 0) {
              return const pw.BoxDecoration(
                  color: PdfColor.fromInt(0xffe0e0e0));
            }
            return const pw.BoxDecoration(color: PdfColor.fromInt(0xffffffff));
          },
          oddCellStyle: pw.TextStyle(font: ttfJP),
          cellStyle: pw.TextStyle(font: ttf),
          data: [
            [
              pw.Text(
                paymentDeadlineLabel,
                style: pw.TextStyle(font: ttf),
                textAlign: pw.TextAlign.left,
              ),
              pw.Text(
                request.paymentDeadline != null
                    ? Dates.formatFullDate(request.paymentDeadline!)
                    : '',
                style: pw.TextStyle(font: ttfJP),
                textAlign: pw.TextAlign.left,
              ),
            ],
            [
              pw.Text(
                remarksLabel,
                style: pw.TextStyle(font: ttf),
                textAlign: pw.TextAlign.left,
              ),
              pw.Text(
                request.remarks ?? '',
                style: pw.TextStyle(font: ttfJP),
                textAlign: pw.TextAlign.left,
              ),
            ]
          ],
        ),
        pw.SizedBox(height: 20),
        pw.TableHelper.fromTextArray(
          headers: tableHeaders,
          headerStyle: pw.TextStyle(font: ttf),
          columnWidths: {
            0: const pw.FlexColumnWidth(0.5),
            1: const pw.FlexColumnWidth(1.5),
            2: const pw.FlexColumnWidth(4),
            3: const pw.FlexColumnWidth(1),
            4: const pw.FlexColumnWidth(1),
            5: const pw.FlexColumnWidth(2),
            6: const pw.FlexColumnWidth(2),
            7: const pw.FlexColumnWidth(1),
          },
          headerAlignment: pw.Alignment.centerLeft,
          cellAlignment: pw.Alignment.centerLeft,
          headerCellDecoration:
              const pw.BoxDecoration(color: PdfColor.fromInt(0xffe0e0e0)),
          oddCellStyle: pw.TextStyle(font: ttfJP),
          cellStyle: pw.TextStyle(font: ttfJP),
          data: request.item
                  ?.map((item) => [
                        (request.item?.indexOf(item) ?? 0) + 1,
                        item.transactionDate != null
                            ? Dates.formatFullDate(item.transactionDate!)
                            : '',
                        item.details ?? '',
                        item.quantity ?? '',
                        item.unit ?? '',
                        item.unitPrice ?? '' ' 円',
                        item.amount ?? '' ' 円',
                        item.taxRate ?? '' ' %',
                      ])
                  .toList() ??
              [],
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

// Excel File
Future<List<int>?> generateExcelFromQuotation(
    MedicalInvoiceRequest request, Patient patient) async {
  var excel = Excel.createExcel();
  Sheet sheetObject = excel['Quotation'];

  int rowIndex = 1;
  // Add header
  var cell1 = sheetObject.cell(CellIndex.indexByString('C$rowIndex'));
  rowIndex++;
  cell1.value = TextCellValue('見積書');
  cell1.cellStyle = CellStyle(
    bold: true,
    fontSize: 30,
  );

  var cell2 = sheetObject.cell(CellIndex.indexByString('E3'));
  rowIndex = 4;

  cell2.value = TextCellValue('見積番号: ${request.invoiceNumber ?? ''}');

  var cell3 = sheetObject.cell(CellIndex.indexByString('A3'));
  cell3.value = TextCellValue(
      '${patient.firstNameRomanized ?? ''} ${patient.middleNameRomanized ?? ''} ${patient.familyNameRomanized ?? ''} 様');

  var cell4 = sheetObject.cell(CellIndex.indexByString('E3'));
  cell4.value = TextCellValue(
      '見積日: ${request.invoiceDate != null ? Dates.formatFullDate(request.invoiceDate!) : ''}');

  var cell5 = sheetObject.cell(CellIndex.indexByString('E4'));
  cell5.value = TextCellValue('担当者: ${request.contact ?? ''}');

  var cell6 = sheetObject.cell(CellIndex.indexByString('E5'));
  cell6.value = TextCellValue('登録番号: ${request.registrationNumber ?? ''}');

  var cell7 = sheetObject.cell(CellIndex.indexByString('A7'));
  cell7.value = TextCellValue('件名: ${request.subject ?? ''}');

  var cell8 = sheetObject.cell(CellIndex.indexByString('A8'));
  cell8.value = TextCellValue('合計金額: ${request.amountBilled ?? ''}' ' 円');

  var cell9 = sheetObject.cell(CellIndex.indexByString('A10'));
  cell9.value = TextCellValue('税率');
  var cell10 = sheetObject.cell(CellIndex.indexByString('B10'));
  cell10.value = TextCellValue('税抜合線(門)');
  var cell11 = sheetObject.cell(CellIndex.indexByString('C10'));
  cell11.value = TextCellValue('消費税(円)');
  var cell12 = sheetObject.cell(CellIndex.indexByString('D10'));
  cell12.value = TextCellValue('合計金額(円)');
  rowIndex = 11;
  request.totalPayment?.forEach((payment) {
    var cell = sheetObject.cell(CellIndex.indexByString(
        'A${(request.totalPayment?.indexOf(payment) ?? 0) + rowIndex}'));
    cell.value = TextCellValue(
        payment.taxRate != null ? payment.taxRate.toString() : '');

    var cell1 = sheetObject.cell(CellIndex.indexByString(
        'B${(request.totalPayment?.indexOf(payment) ?? 0) + rowIndex}'));
    cell1.value = TextCellValue(payment.amountExcludingTaxInYen != null
        ? payment.amountExcludingTaxInYen.toString()
        : '');

    var cell2 = sheetObject.cell(CellIndex.indexByString(
        'C${(request.totalPayment?.indexOf(payment) ?? 0) + rowIndex}'));
    cell2.value = TextCellValue(payment.consumptionTaxAmountInYen != null
        ? payment.consumptionTaxAmountInYen.toString()
        : '');

    var cell3 = sheetObject.cell(CellIndex.indexByString(
        'D${(request.totalPayment?.indexOf(payment) ?? 0) + rowIndex}'));
    cell3.value = TextCellValue(((payment.amountExcludingTaxInYen ?? 0) +
            (payment.consumptionTaxAmountInYen ?? 0))
        .toString());
    rowIndex++;
  });

  var cell13 = sheetObject.cell(CellIndex.indexByString('A$rowIndex'));
  rowIndex++;
  cell13.value = TextCellValue('有効期限');
  var cell14 = sheetObject.cell(CellIndex.indexByString('B$rowIndex'));
  cell14.value = TextCellValue(request.paymentDeadline != null
      ? Dates.formatFullDate(request.paymentDeadline!)
      : '');
  var cell15 = sheetObject.cell(CellIndex.indexByString('A$rowIndex'));
  rowIndex++;
  cell15.value = TextCellValue('備考');
  var cell16 = sheetObject.cell(CellIndex.indexByString('B$rowIndex'));
  rowIndex++;
  cell16.value = TextCellValue(request.remarks ?? '');

  // Add item details

  var cell17 = sheetObject.cell(CellIndex.indexByString('A$rowIndex'));
  cell17.value = TextCellValue('');
  var cell18 = sheetObject.cell(CellIndex.indexByString('B$rowIndex'));
  cell18.value = TextCellValue('取引日');
  var cell19 = sheetObject.cell(CellIndex.indexByString('C$rowIndex'));
  cell19.value = TextCellValue('内訳');
  var cell20 = sheetObject.cell(CellIndex.indexByString('D$rowIndex'));
  cell20.value = TextCellValue('数量');
  var cell21 = sheetObject.cell(CellIndex.indexByString('E$rowIndex'));
  cell21.value = TextCellValue('单位');
  var cell22 = sheetObject.cell(CellIndex.indexByString('F$rowIndex'));
  cell22.value = TextCellValue('単価');
  var cell23 = sheetObject.cell(CellIndex.indexByString('G$rowIndex'));
  cell23.value = TextCellValue('金額');
  var cell24 = sheetObject.cell(CellIndex.indexByString('H$rowIndex'));
  cell24.value = TextCellValue('税率');
  rowIndex++;

  request.item?.forEach((item) {
    var cell = sheetObject.cell(CellIndex.indexByString(
        'A${((request.item?.indexOf(item) ?? 0) + 1) + rowIndex}'));
    cell.value =
        TextCellValue(((request.item?.indexOf(item) ?? 0) + 1).toString());

    var cell1 = sheetObject.cell(CellIndex.indexByString(
        'B${((request.item?.indexOf(item) ?? 0) + 1) + rowIndex}'));
    cell1.value = TextCellValue(item.transactionDate != null
        ? Dates.formatFullDate(item.transactionDate!)
        : '');

    var cell2 = sheetObject.cell(CellIndex.indexByString(
        'C${((request.item?.indexOf(item) ?? 0) + 1) + rowIndex}'));
    cell2.value = TextCellValue(item.details ?? '');

    var cell3 = sheetObject.cell(CellIndex.indexByString(
        'D${((request.item?.indexOf(item) ?? 0) + 1) + rowIndex}'));

    cell3.value =
        TextCellValue(item.quantity != null ? item.quantity.toString() : '');

    var cell4 = sheetObject.cell(CellIndex.indexByString(
        'E${((request.item?.indexOf(item) ?? 0) + 1) + rowIndex}'));

    cell4.value = TextCellValue(item.unit ?? '');

    var cell5 = sheetObject.cell(CellIndex.indexByString(
        'F${((request.item?.indexOf(item) ?? 0) + 1) + rowIndex}'));

    cell5.value =
        TextCellValue(item.unitPrice != null ? item.unitPrice.toString() : '');

    var cell6 = sheetObject.cell(CellIndex.indexByString(
        'G${((request.item?.indexOf(item) ?? 0) + 1) + rowIndex}'));

    cell6.value =
        TextCellValue(item.amount != null ? item.amount.toString() : '');

    var cell7 = sheetObject.cell(CellIndex.indexByString(
        'H${((request.item?.indexOf(item) ?? 0) + 1) + rowIndex}'));

    cell7.value =
        TextCellValue(item.taxRate != null ? item.taxRate.toString() : '');
    rowIndex++;
  });

  // Save the Excel file
  try {
    var excelBytes = excel.encode();
    return excelBytes;
  } catch (e) {
    print(e);
    return null;
  }
}
