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
        type: true,
        invoiceNumber: formGroup.control('invoiceNumber').value,
        invoiceDate: formGroup.control('invoiceDate').value,
        contact: formGroup.control('contact').value,
        registrationNumber: formGroup.control('registrationNumber').value,
        subject: formGroup.control('subject').value,
        amountBilled: formGroup.control('amountBilled').value,
        paymentDeadline: formGroup.control('paymentDeadline').value,
        bankTransferInformation:
            formGroup.control('bankTransferInformation').value,
        remarks: formGroup.control('remarks').value,
        totalPayment: totalPayment,
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
        await createInvoice(
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

  Future<void> createInvoice({
    required MedicalInvoiceRequest request,
  }) async {
    try {
      medicalInvoiceData.value = medicalInvoiceData.value.copyWith(
        loading: true,
      );
      final response = await patientRepository.postInvoice(request);
      medicalInvoiceData.value = AsyncData(data: [
        ...medicalInvoiceData.value.data ?? [],
        response,
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
    MedicalInvoiceRequest invoice, Patient patient, String language) async {
  final pdf = pw.Document();
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

  // Labels for different languages
  String title,
      quotationNumberLabel,
      quotationDateLabel,
      subjectLabel,
      totalAmountLabel,
      contactLabel,
      registrationNumberLabel,
      paymentDeadlineLabel,
      bankTransfer,
      remarksLabel,
      taxRateLabel,
      taxExcludedAmountLabel,
      consumptionTaxLabel,
      totalAmountYenLabel;
  List<String> tableHeaders;

  // Assign labels based on the language
  switch (language) {
    case 'JP':
      title = '請求書';
      quotationNumberLabel = '請求書番号: ';
      quotationDateLabel = '見積日: ';
      subjectLabel = '件名: ';
      totalAmountLabel = 'ご請求額: ';
      contactLabel = '担当者: ';
      registrationNumberLabel = '登録番号: ';
      paymentDeadlineLabel = '有効期限';
      bankTransfer = 'お振込先';
      remarksLabel = '備考';
      taxRateLabel = '税率';
      taxExcludedAmountLabel = '税抜合線(門)';
      consumptionTaxLabel = '消費税(円)';
      totalAmountYenLabel = '合計金額(円)';
      tableHeaders = ['', '取引日', '内訳', '数量', '単位', '単価', '金額', '税率'];
      break;
    case 'ZH':
      title = '发票';
      quotationNumberLabel = '发票号码: ';
      quotationDateLabel = '预计日期: ';
      subjectLabel = '件名: ';
      totalAmountLabel = '主题: ';
      contactLabel = '经理: ';
      registrationNumberLabel = '注册号: ';
      paymentDeadlineLabel = '到期日期';
      bankTransfer = '转移';
      remarksLabel = '评论';
      taxRateLabel = '税率';
      taxExcludedAmountLabel = '减税线（门）';
      consumptionTaxLabel = '消费税（日元）';
      totalAmountYenLabel = '总金额（日元）';
      tableHeaders = ['', '交易日', '分解', '数量', '首位', '单价', '数量', '税率'];
      break;
    case 'ZHTW':
      title = '發票';
      quotationNumberLabel = '發票號碼: ';
      quotationDateLabel = '預計日期: ';
      subjectLabel = '主題: ';
      totalAmountLabel = '計費金額: ';
      contactLabel = '担当者: ';
      registrationNumberLabel = '註冊號: ';
      paymentDeadlineLabel = '到期日期';
      bankTransfer = '轉移';
      remarksLabel = '備考';
      taxRateLabel = '稅率';
      taxExcludedAmountLabel = '減稅線（門）';
      consumptionTaxLabel = '消費稅（日圓）';
      totalAmountYenLabel = '總金額（日圓）';
      tableHeaders = ['', '交易日', '分解', '數量', '首位', '單價', '數量', '稅率'];
      break;
    case 'VN':
      title = 'hóa đơn';
      quotationNumberLabel = 'số hóa đơn: ';
      quotationDateLabel = 'ngày dự kiến: ';
      subjectLabel = 'chủ thể: ';
      totalAmountLabel = 'Số tiền được lập hóa đơn: ';
      contactLabel = 'giám đốc: ';
      registrationNumberLabel = 'Số đăng ký: ';
      paymentDeadlineLabel = 'ngày hết hạn';
      bankTransfer = 'Chuyển khoản';
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
    default: // EN
      title = 'Invoice';
      quotationNumberLabel = 'Invoice Number: ';
      quotationDateLabel = 'Invoice Date: ';
      subjectLabel = 'Subject: ';
      totalAmountLabel = 'Amount charged: ';
      contactLabel = 'Contact: ';
      registrationNumberLabel = 'Registration number: ';
      paymentDeadlineLabel = 'Date of expiry';
      bankTransfer = 'Bank transfer';
      remarksLabel = 'Remarks';
      taxRateLabel = 'Tax rate';
      taxExcludedAmountLabel = 'Tax excluded line (gate)';
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

  // Create PDF content
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
                invoice.invoiceNumber ?? '',
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
                  invoice.invoiceDate != null
                      ? Dates.formatFullDate(invoice.invoiceDate!)
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
                invoice.contact ?? '',
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
                invoice.registrationNumber ?? '',
                style: pw.TextStyle(font: ttfJP),
              ),
            ]),
        pw.Row(children: [
          pw.Text(
            subjectLabel,
            style: pw.TextStyle(font: ttf),
          ),
          pw.Text(
            invoice.subject ?? '',
            style: pw.TextStyle(font: ttfJP),
          ),
        ]),
        pw.Row(children: [
          pw.Text(
            totalAmountLabel,
            style: pw.TextStyle(font: ttf),
          ),
          pw.Text(
            '${invoice.amountBilled ?? ''} 円',
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
          headerStyle: pw.TextStyle(
            font: ttf,
          ),
          columnWidths: {
            0: const pw.FlexColumnWidth(1),
            1: const pw.FlexColumnWidth(2),
            2: const pw.FlexColumnWidth(2),
            3: const pw.FlexColumnWidth(2),
          },
          headerAlignment: pw.Alignment.centerLeft,
          cellAlignment: pw.Alignment.centerLeft,
          headerCellDecoration: const pw.BoxDecoration(
            color: PdfColor.fromInt(0xffe0e0e0),
          ),
          oddCellStyle: pw.TextStyle(
            font: ttfJP,
          ),
          cellStyle: pw.TextStyle(
            font: ttfJP,
          ),
          data: invoice.totalPayment!
              .map((payment) => [
                    payment.taxRate ?? '' ' %',
                    payment.amountExcludingTaxInYen ?? '' ' 円',
                    payment.consumptionTaxAmountInYen ?? '' ' 円',
                    '${(payment.amountExcludingTaxInYen ?? 0) + (payment.consumptionTaxAmountInYen ?? 0)}'
                        ' 円',
                  ])
              .toList(),
        ),
        pw.SizedBox(height: 20),
        pw.TableHelper.fromTextArray(
          columnWidths: {
            0: const pw.FlexColumnWidth(1),
            1: const pw.FlexColumnWidth(2),
          },
          headerStyle: pw.TextStyle(
            font: ttf,
          ),
          headerAlignment: pw.Alignment.centerLeft,
          cellAlignment: pw.Alignment.centerLeft,
          cellDecoration: (rowIndex, value, columnIndex) {
            if (columnIndex == 0) {
              return const pw.BoxDecoration(
                color: PdfColor.fromInt(0xffe0e0e0),
              );
            }
            return const pw.BoxDecoration(
              color: PdfColor.fromInt(0xffffffff),
            );
          },
          oddCellStyle: pw.TextStyle(
            font: ttfJP,
          ),
          cellStyle: pw.TextStyle(
            font: ttf,
          ),
          data: [
            [
              paymentDeadlineLabel,
              invoice.paymentDeadline != null
                  ? Dates.formatFullDate(invoice.paymentDeadline!)
                  : '',
            ],
            [
              bankTransfer, // Customizable based on language
              invoice.bankTransferInformation ?? '',
            ],
            [
              remarksLabel,
              invoice.remarks ?? '',
            ]
          ],
        ),
        pw.SizedBox(height: 20),
        pw.TableHelper.fromTextArray(
          headers: tableHeaders,
          headerStyle: pw.TextStyle(
            font: ttf,
          ),
          columnWidths: {
            0: const pw.FlexColumnWidth(0.5),
            1: const pw.FlexColumnWidth(1),
            2: const pw.FlexColumnWidth(2),
            3: const pw.FlexColumnWidth(1),
            4: const pw.FlexColumnWidth(1),
            5: const pw.FlexColumnWidth(1),
            6: const pw.FlexColumnWidth(1),
            7: const pw.FlexColumnWidth(1),
          },
          headerAlignment: pw.Alignment.centerLeft,
          cellAlignment: pw.Alignment.centerLeft,
          headerCellDecoration: const pw.BoxDecoration(
            color: PdfColor.fromInt(0xffe0e0e0),
          ),
          oddCellStyle: pw.TextStyle(
            font: ttfJP,
          ),
          cellStyle: pw.TextStyle(
            font: ttfJP,
          ),
          data: invoice.item!
              .map((item) => [
                    (invoice.item?.indexWhere((element) => element == item) ??
                            0) +
                        1,
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
              .toList(),
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
