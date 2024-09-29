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

      Uint8List? pathFileJP = await generatePdfFromInvoiceJP(
        request,
        patientData.value.requireData,
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

      Uint8List? pathFileZH = await generatePdfFromInvoiceZH(
        request,
        patientData.value.requireData,
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

      Uint8List? pathFileZHTW = await generatePdfFromInvoiceZHTW(
        request,
        patientData.value.requireData,
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

      Uint8List? pathFileVN = await generatePdfFromInvoiceVN(
        request,
        patientData.value.requireData,
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

      Uint8List? pathFileEN = await generatePdfFromInvoiceEN(
        request,
        patientData.value.requireData,
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

Future<Uint8List?> generatePdfFromInvoiceJP(
    MedicalInvoiceRequest invoice, Patient patient) async {
  final pdf = pw.Document();
  final ByteData fontData =
      await rootBundle.load('assets/fonts/NotoSansJP_VariableFont_wght.ttf');
  final ttf = pw.Font.ttf(fontData);

  pdf.addPage(
    pw.MultiPage(
      build: (context) => [
        pw.Header(
          level: 0,
          child: pw.Align(
            alignment: pw.Alignment.center,
            child: pw.Text(
              '請求書',
              style: pw.TextStyle(
                font: ttf,
                fontSize: 30,
              ),
              textAlign: pw.TextAlign.center,
            ),
          ),
        ),
        pw.Align(
          alignment: pw.Alignment.centerRight,
          child: pw.Text(
            '請求書番号: ${invoice.invoiceNumber ?? ''}',
            style: pw.TextStyle(
              font: ttf,
            ),
            textAlign: pw.TextAlign.right,
          ),
        ),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text(
            '${patient.firstNameRomanized ?? ''} ${patient.middleNameRomanized ?? ''} ${patient.familyNameRomanized ?? ''}'
            '様',
            style: pw.TextStyle(
              font: ttf,
            ),
          ),
          pw.Text(
            '見積日: ${invoice.invoiceDate != null ? Dates.formatFullDate(invoice.invoiceDate!) : ''}',
            style: pw.TextStyle(
              font: ttf,
            ),
            textAlign: pw.TextAlign.right,
          ),
        ]),
        pw.Align(
          alignment: pw.Alignment.centerRight,
          child: pw.Text(
            '担当者: ${invoice.contact ?? ''}',
            style: pw.TextStyle(
              font: ttf,
            ),
            textAlign: pw.TextAlign.right,
          ),
        ),
        pw.Align(
          alignment: pw.Alignment.centerRight,
          child: pw.Text(
            '登録番号: ${invoice.registrationNumber ?? ''}',
            style: pw.TextStyle(
              font: ttf,
            ),
            textAlign: pw.TextAlign.right,
          ),
        ),
        pw.Text(
          '件名: ${invoice.subject ?? ''}',
          style: pw.TextStyle(
            font: ttf,
          ),
          textAlign: pw.TextAlign.left,
        ),
        pw.Text(
          'ご請求額: ${invoice.amountBilled ?? ''}',
          style: pw.TextStyle(
            font: ttf,
          ),
          textAlign: pw.TextAlign.left,
        ),
        pw.SizedBox(height: 20),
        pw.TableHelper.fromTextArray(
          headers: ['税率', '税抜合線(門)', '消費税(円)', '合計金額(円)'],
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
            font: ttf,
          ),
          cellStyle: pw.TextStyle(
            font: ttf,
          ),
          data: invoice.totalPayment!
              .map((payment) => [
                    payment.taxRate ?? '',
                    payment.amountExcludingTaxInYen ?? '',
                    payment.consumptionTaxAmountInYen ?? '',
                    (payment.amountExcludingTaxInYen ?? 0) +
                        (payment.consumptionTaxAmountInYen ?? 0),
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
            font: ttf,
          ),
          cellStyle: pw.TextStyle(
            font: ttf,
          ),
          data: [
            [
              '有効期限',
              invoice.paymentDeadline != null
                  ? Dates.formatFullDate(invoice.paymentDeadline!)
                  : '',
            ],
            [
              'お振込み',
              invoice.bankTransferInformation ?? '',
            ],
            [
              '備考',
              invoice.remarks ?? '',
            ]
          ],
        ),
        pw.SizedBox(height: 20),
        pw.TableHelper.fromTextArray(
          headers: ['', '取引日', '内訳', '数量', '单位', '単価', '金額', '税率'],
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
            font: ttf,
          ),
          cellStyle: pw.TextStyle(
            font: ttf,
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
                    item.unitPrice ?? '',
                    item.amount ?? '',
                    item.taxRate ?? '',
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

Future<Uint8List?> generatePdfFromInvoiceZH(
    MedicalInvoiceRequest invoice, Patient patient) async {
  final pdf = pw.Document();
  final ByteData fontData =
      await rootBundle.load('assets/fonts/NotoSansJP_VariableFont_wght.ttf');
  final ttf = pw.Font.ttf(fontData);

  pdf.addPage(
    pw.MultiPage(
      build: (context) => [
        pw.Header(
          level: 0,
          child: pw.Align(
            alignment: pw.Alignment.center,
            child: pw.Text(
              '发票',
              style: pw.TextStyle(
                font: ttf,
                fontSize: 30,
              ),
              textAlign: pw.TextAlign.center,
            ),
          ),
        ),
        pw.Align(
          alignment: pw.Alignment.centerRight,
          child: pw.Text(
            '发票号码: ${invoice.invoiceNumber ?? ''}',
            style: pw.TextStyle(
              font: ttf,
            ),
            textAlign: pw.TextAlign.right,
          ),
        ),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text(
            '${patient.firstNameRomanized ?? ''} ${patient.middleNameRomanized ?? ''} ${patient.familyNameRomanized ?? ''}'
            '先生。',
            style: pw.TextStyle(
              font: ttf,
            ),
          ),
          pw.Text(
            '预计日期: ${invoice.invoiceDate != null ? Dates.formatFullDate(invoice.invoiceDate!) : ''}',
            style: pw.TextStyle(
              font: ttf,
            ),
            textAlign: pw.TextAlign.right,
          ),
        ]),
        pw.Align(
          alignment: pw.Alignment.centerRight,
          child: pw.Text(
            '经理: ${invoice.contact ?? ''}',
            style: pw.TextStyle(
              font: ttf,
            ),
            textAlign: pw.TextAlign.right,
          ),
        ),
        pw.Align(
          alignment: pw.Alignment.centerRight,
          child: pw.Text(
            '注册号: ${invoice.registrationNumber ?? ''}',
            style: pw.TextStyle(
              font: ttf,
            ),
            textAlign: pw.TextAlign.right,
          ),
        ),
        pw.Text(
          '件名: ${invoice.subject ?? ''}',
          style: pw.TextStyle(
            font: ttf,
          ),
          textAlign: pw.TextAlign.left,
        ),
        pw.Text(
          '主题: ${invoice.amountBilled ?? ''}',
          style: pw.TextStyle(
            font: ttf,
          ),
          textAlign: pw.TextAlign.left,
        ),
        pw.SizedBox(height: 20),
        pw.TableHelper.fromTextArray(
          headers: ['税率', '减税线（门）', '消费税（日元）', '总金额（日元）'],
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
            font: ttf,
          ),
          cellStyle: pw.TextStyle(
            font: ttf,
          ),
          data: invoice.totalPayment!
              .map((payment) => [
                    payment.taxRate ?? '',
                    payment.amountExcludingTaxInYen ?? '',
                    payment.consumptionTaxAmountInYen ?? '',
                    (payment.amountExcludingTaxInYen ?? 0) +
                        (payment.consumptionTaxAmountInYen ?? 0),
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
            font: ttf,
          ),
          cellStyle: pw.TextStyle(
            font: ttf,
          ),
          data: [
            [
              '到期日期',
              invoice.paymentDeadline != null
                  ? Dates.formatFullDate(invoice.paymentDeadline!)
                  : '',
            ],
            [
              '转移',
              invoice.bankTransferInformation ?? '',
            ],
            [
              '评论',
              invoice.remarks ?? '',
            ]
          ],
        ),
        pw.SizedBox(height: 20),
        pw.TableHelper.fromTextArray(
          headers: ['', '交易日', '分解', '数量', '首位', '单价', '数量', '税率'],
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
            font: ttf,
          ),
          cellStyle: pw.TextStyle(
            font: ttf,
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
                    item.unitPrice ?? '',
                    item.amount ?? '',
                    item.taxRate ?? '',
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

Future<Uint8List?> generatePdfFromInvoiceZHTW(
    MedicalInvoiceRequest invoice, Patient patient) async {
  final pdf = pw.Document();
  final ByteData fontData =
      await rootBundle.load('assets/fonts/NotoSansJP_VariableFont_wght.ttf');
  final ttf = pw.Font.ttf(fontData);

  pdf.addPage(
    pw.MultiPage(
      build: (context) => [
        pw.Header(
          level: 0,
          child: pw.Align(
            alignment: pw.Alignment.center,
            child: pw.Text(
              '發票',
              style: pw.TextStyle(
                font: ttf,
                fontSize: 30,
              ),
              textAlign: pw.TextAlign.center,
            ),
          ),
        ),
        pw.Align(
          alignment: pw.Alignment.centerRight,
          child: pw.Text(
            '發票號碼: ${invoice.invoiceNumber ?? ''}',
            style: pw.TextStyle(
              font: ttf,
            ),
            textAlign: pw.TextAlign.right,
          ),
        ),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text(
            '${patient.firstNameRomanized ?? ''} ${patient.middleNameRomanized ?? ''} ${patient.familyNameRomanized ?? ''}'
            '先生。',
            style: pw.TextStyle(
              font: ttf,
            ),
          ),
          pw.Text(
            '預計日期: ${invoice.invoiceDate != null ? Dates.formatFullDate(invoice.invoiceDate!) : ''}',
            style: pw.TextStyle(
              font: ttf,
            ),
            textAlign: pw.TextAlign.right,
          ),
        ]),
        pw.Align(
          alignment: pw.Alignment.centerRight,
          child: pw.Text(
            '担当者: ${invoice.contact ?? ''}',
            style: pw.TextStyle(
              font: ttf,
            ),
            textAlign: pw.TextAlign.right,
          ),
        ),
        pw.Align(
          alignment: pw.Alignment.centerRight,
          child: pw.Text(
            '註冊號: ${invoice.registrationNumber ?? ''}',
            style: pw.TextStyle(
              font: ttf,
            ),
            textAlign: pw.TextAlign.right,
          ),
        ),
        pw.Text(
          '主題: ${invoice.subject ?? ''}',
          style: pw.TextStyle(
            font: ttf,
          ),
          textAlign: pw.TextAlign.left,
        ),
        pw.Text(
          '計費金額: ${invoice.amountBilled ?? ''}',
          style: pw.TextStyle(
            font: ttf,
          ),
          textAlign: pw.TextAlign.left,
        ),
        pw.SizedBox(height: 20),
        pw.TableHelper.fromTextArray(
          headers: ['稅率', '減稅線（門）', '消費稅（日圓）', '總金額（日圓）'],
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
            font: ttf,
          ),
          cellStyle: pw.TextStyle(
            font: ttf,
          ),
          data: invoice.totalPayment!
              .map((payment) => [
                    payment.taxRate ?? '',
                    payment.amountExcludingTaxInYen ?? '',
                    payment.consumptionTaxAmountInYen ?? '',
                    (payment.amountExcludingTaxInYen ?? 0) +
                        (payment.consumptionTaxAmountInYen ?? 0),
                  ])
              .toList(),
        ),
        pw.SizedBox(height: 20),
        pw.TableHelper.fromTextArray(
          columnWidths: {
            0: const pw.FlexColumnWidth(1),
            1: const pw.FlexColumnWidth(2),
          },
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
            font: ttf,
          ),
          cellStyle: pw.TextStyle(
            font: ttf,
          ),
          data: [
            [
              '到期日期',
              invoice.paymentDeadline != null
                  ? Dates.formatFullDate(invoice.paymentDeadline!)
                  : '',
            ],
            [
              '轉移',
              invoice.bankTransferInformation ?? '',
            ],
            [
              '備考',
              invoice.remarks ?? '',
            ]
          ],
        ),
        pw.SizedBox(height: 20),
        pw.TableHelper.fromTextArray(
          headers: ['', '交易日', '分解', '數量', '首位', '單價', '數量', '稅率'],
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
            font: ttf,
          ),
          cellStyle: pw.TextStyle(
            font: ttf,
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
                    item.unitPrice ?? '',
                    item.amount ?? '',
                    item.taxRate ?? '',
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

Future<Uint8List?> generatePdfFromInvoiceVN(
    MedicalInvoiceRequest invoice, Patient patient) async {
  final pdf = pw.Document();
  final ByteData fontData =
      await rootBundle.load('assets/fonts/NotoSansJP_VariableFont_wght.ttf');
  final ttf = pw.Font.ttf(fontData);

  pdf.addPage(
    pw.MultiPage(
      build: (context) => [
        pw.Header(
          level: 0,
          child: pw.Align(
            alignment: pw.Alignment.center,
            child: pw.Text(
              'hóa đơn',
              style: pw.TextStyle(
                font: ttf,
                fontSize: 30,
              ),
              textAlign: pw.TextAlign.center,
            ),
          ),
        ),
        pw.Align(
          alignment: pw.Alignment.centerRight,
          child: pw.Text(
            'số hóa đơn: ${invoice.invoiceNumber ?? ''}',
            style: pw.TextStyle(
              font: ttf,
            ),
            textAlign: pw.TextAlign.right,
          ),
        ),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text(
            '${patient.firstNameRomanized ?? ''} ${patient.middleNameRomanized ?? ''} ${patient.familyNameRomanized ?? ''}'
            'Ông',
            style: pw.TextStyle(
              font: ttf,
            ),
          ),
          pw.Text(
            'ngày dự kiến: ${invoice.invoiceDate != null ? Dates.formatFullDate(invoice.invoiceDate!) : ''}',
            style: pw.TextStyle(
              font: ttf,
            ),
            textAlign: pw.TextAlign.right,
          ),
        ]),
        pw.Align(
          alignment: pw.Alignment.centerRight,
          child: pw.Text(
            'giám đốc: ${invoice.contact ?? ''}',
            style: pw.TextStyle(
              font: ttf,
            ),
            textAlign: pw.TextAlign.right,
          ),
        ),
        pw.Align(
          alignment: pw.Alignment.centerRight,
          child: pw.Text(
            'Số đăng ký: ${invoice.registrationNumber ?? ''}',
            style: pw.TextStyle(
              font: ttf,
            ),
            textAlign: pw.TextAlign.right,
          ),
        ),
        pw.Text(
          'chủ thể: ${invoice.subject ?? ''}',
          style: pw.TextStyle(
            font: ttf,
          ),
          textAlign: pw.TextAlign.left,
        ),
        pw.Text(
          'Số tiền được lập hóa đơn: ${invoice.amountBilled ?? ''}',
          style: pw.TextStyle(
            font: ttf,
          ),
          textAlign: pw.TextAlign.left,
        ),
        pw.SizedBox(height: 20),
        pw.TableHelper.fromTextArray(
          headers: ['thuế suất', 'Dòng khấu trừ thuế (cổng)', 'Thuế tiêu dùng (yên)', 'Tổng số tiền (yên)'],
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
            font: ttf,
          ),
          cellStyle: pw.TextStyle(
            font: ttf,
          ),
          data: invoice.totalPayment!
              .map((payment) => [
                    payment.taxRate ?? '',
                    payment.amountExcludingTaxInYen ?? '',
                    payment.consumptionTaxAmountInYen ?? '',
                    (payment.amountExcludingTaxInYen ?? 0) +
                        (payment.consumptionTaxAmountInYen ?? 0),
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
            font: ttf,
          ),
          cellStyle: pw.TextStyle(
            font: ttf,
          ),
          data: [
            [
              'ngày hết hạn',
              invoice.paymentDeadline != null
                  ? Dates.formatFullDate(invoice.paymentDeadline!)
                  : '',
            ],
            [
              'Chuyển khoản',
              invoice.bankTransferInformation ?? '',
            ],
            [
              'nhận xét',
              invoice.remarks ?? '',
            ]
          ],
        ),
        pw.SizedBox(height: 20),
        pw.TableHelper.fromTextArray(
          headers: ['', 'ngày giao dịch', 'sự cố', 'Số lượng', 'Vị trí đầu tiên', 'đơn giá', 'số lượng', 'thuế suất'],
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
            font: ttf,
          ),
          cellStyle: pw.TextStyle(
            font: ttf,
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
                    item.unitPrice ?? '',
                    item.amount ?? '',
                    item.taxRate ?? '',
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

Future<Uint8List?> generatePdfFromInvoiceEN(
    MedicalInvoiceRequest invoice, Patient patient) async {
  final pdf = pw.Document();
  final ByteData fontData =
      await rootBundle.load('assets/fonts/NotoSansJP_VariableFont_wght.ttf');
  final ttf = pw.Font.ttf(fontData);

  pdf.addPage(
    pw.MultiPage(
      build: (context) => [
        pw.Header(
          level: 0,
          child: pw.Align(
            alignment: pw.Alignment.center,
            child: pw.Text(
              'Invoice',
              style: pw.TextStyle(
                font: ttf,
                fontSize: 30,
              ),
              textAlign: pw.TextAlign.center,
            ),
          ),
        ),
        pw.Align(
          alignment: pw.Alignment.centerRight,
          child: pw.Text(
            'Invoice Number: ${invoice.invoiceNumber ?? ''}',
            style: pw.TextStyle(
              font: ttf,
            ),
            textAlign: pw.TextAlign.right,
          ),
        ),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text(
            'Mr/Ms. ${patient.firstNameRomanized ?? ''} ${patient.middleNameRomanized ?? ''} ${patient.familyNameRomanized ?? ''}',
            style: pw.TextStyle(
              font: ttf,
            ),
          ),
          pw.Text(
            'Invoice Date: ${invoice.invoiceDate != null ? Dates.formatFullDate(invoice.invoiceDate!) : ''}',
            style: pw.TextStyle(
              font: ttf,
            ),
            textAlign: pw.TextAlign.right,
          ),
        ]),
        pw.Align(
          alignment: pw.Alignment.centerRight,
          child: pw.Text(
            'Contact: ${invoice.contact ?? ''}',
            style: pw.TextStyle(
              font: ttf,
            ),
            textAlign: pw.TextAlign.right,
          ),
        ),
        pw.Align(
          alignment: pw.Alignment.centerRight,
          child: pw.Text(
            'Registration number: ${invoice.registrationNumber ?? ''}',
            style: pw.TextStyle(
              font: ttf,
            ),
            textAlign: pw.TextAlign.right,
          ),
        ),
        pw.Text(
          'Subject: ${invoice.subject ?? ''}',
          style: pw.TextStyle(
            font: ttf,
          ),
          textAlign: pw.TextAlign.left,
        ),
        pw.Text(
          'Amount charged: ${invoice.amountBilled ?? ''}',
          style: pw.TextStyle(
            font: ttf,
          ),
          textAlign: pw.TextAlign.left,
        ),
        pw.SizedBox(height: 20),
        pw.TableHelper.fromTextArray(
          headers: ['Tax rate', 'Tax excluded line (gate)', 'Consumption tax (yen)', 'Total amount (yen)'],
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
            font: ttf,
          ),
          cellStyle: pw.TextStyle(
            font: ttf,
          ),
          data: invoice.totalPayment!
              .map((payment) => [
                    payment.taxRate ?? '',
                    payment.amountExcludingTaxInYen ?? '',
                    payment.consumptionTaxAmountInYen ?? '',
                    (payment.amountExcludingTaxInYen ?? 0) +
                        (payment.consumptionTaxAmountInYen ?? 0),
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
            font: ttf,
          ),
          cellStyle: pw.TextStyle(
            font: ttf,
          ),
          data: [
            [
              'Date of expiry',
              invoice.paymentDeadline != null
                  ? Dates.formatFullDate(invoice.paymentDeadline!)
                  : '',
            ],
            [
              'Bank transfer',
              invoice.bankTransferInformation ?? '',
            ],
            [
              'Remarks',
              invoice.remarks ?? '',
            ]
          ],
        ),
        pw.SizedBox(height: 20),
        pw.TableHelper.fromTextArray(
          headers: ['', 'Transaction Date', 'Detail', 'QTY', 'Unit', 'Unit price', 'Amount', 'Tax rate'],
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
            font: ttf,
          ),
          cellStyle: pw.TextStyle(
            font: ttf,
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
                    item.unitPrice ?? '',
                    item.amount ?? '',
                    item.taxRate ?? '',
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

Future<List<int>?> generateExcelFromInvoice(
    MedicalInvoiceRequest request, Patient patient) async {
  var excel = Excel.createExcel();
  Sheet sheetObject = excel['Quotation'];

  int rowIndex = 1;

  // Save the Excel file
  try {
    var excelBytes = excel.encode();
    return excelBytes;
  } catch (e) {
    print(e);
    return null;
  }
}
