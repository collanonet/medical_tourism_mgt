// Flutter imports:
import 'dart:convert';
import 'package:flutter/services.dart';
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
      final response = await patientRepository.getInvoices(medicalRecordId);
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

      Uint8List? pathFile = await generatePdfFromInvoice(
        request,
        patientData.value.requireData,
      );
      String? fileName;

      if (pathFile != null) {
        try {
          String base64Image = base64Encode(pathFile);
          FileResponse fileData = await patientRepository.uploadFileBase64(
            base64Image,
            // get timestamp to avoid duplicate file name
            'invoice_${DateTime.now().millisecondsSinceEpoch}.pdf',
          );
          fileName = fileData.filename;
        } catch (e) {
          logger.e(e);
        }
      }
      if (fileName != null) {
        await createInvoice(request: request.copyWith(fileName: fileName));
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
}

Future<Uint8List?> generatePdfFromInvoice(
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
              ),
              textAlign: pw.TextAlign.center,
            ),
          ),
        ),
        pw.Align(
          alignment: pw.Alignment.centerRight,
          child: pw.Text(
            '請求書番号: ${invoice.invoiceNumber}',
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
            '担当者: ${invoice.contact}',
            style: pw.TextStyle(
              font: ttf,
            ),
            textAlign: pw.TextAlign.right,
          ),
        ),
        pw.Align(
          alignment: pw.Alignment.centerRight,
          child: pw.Text(
            '登録番号: ${invoice.registrationNumber}',
            style: pw.TextStyle(
              font: ttf,
            ),
            textAlign: pw.TextAlign.right,
          ),
        ),
        pw.Text(
          '件名: ${invoice.subject}',
          style: pw.TextStyle(
            font: ttf,
          ),
          textAlign: pw.TextAlign.left,
        ),
        pw.Text(
          'ご請求額: ${invoice.amountBilled}',
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
          cellAlignment: pw.Alignment.centerLeft,
          oddCellStyle: pw.TextStyle(
            font: ttf,
          ),
          cellStyle: pw.TextStyle(
            font: ttf,
          ),
          data: invoice.totalPayment!
              .map((payment) => [
                    payment.taxRate,
                    payment.amountExcludingTaxInYen,
                    payment.consumptionTaxAmountInYen,
                    (payment.amountExcludingTaxInYen ?? 0) +
                        (payment.consumptionTaxAmountInYen ?? 0),
                  ])
              .toList(),
        ),
        pw.SizedBox(height: 20),
        pw.TableHelper.fromTextArray(
          headers: [
            '有効期限',
            invoice.paymentDeadline != null
                ? Dates.formatFullDate(invoice.paymentDeadline!)
                : '',
          ],
          headerStyle: pw.TextStyle(
            font: ttf,
          ),
          headerAlignment: pw.Alignment.centerLeft,
          cellAlignment: pw.Alignment.centerLeft,
          oddCellStyle: pw.TextStyle(
            font: ttf,
          ),
          cellStyle: pw.TextStyle(
            font: ttf,
          ),
          data: [
            [
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
          oddCellStyle: pw.TextStyle(
            font: ttf,
          ),
          cellStyle: pw.TextStyle(
            font: ttf,
          ),
          cellAlignment: pw.Alignment.centerLeft,
          data: invoice.item!
              .map((item) => [
                    (invoice.item?.indexWhere((element) => element == item) ??
                            0) +
                        1,
                    item.transactionDate != null
                        ? Dates.formatFullDate(item.transactionDate!)
                        : '',
                    item.details,
                    item.quantity,
                    item.unit,
                    item.unitPrice,
                    item.amount,
                    item.taxRate,
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
    print(e);
    return null;
  }
}
