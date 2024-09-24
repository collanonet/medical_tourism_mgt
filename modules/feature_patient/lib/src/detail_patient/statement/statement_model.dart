// Flutter imports:
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

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
        hospitalRecord: formGroup.control('hospitalRecord').value,
      );


      String html = generateHtmlFromInvoice(
        request,
      );
      Uint8List? pathFile = await generatePdfFromHtml(html);
      String? fileName;

      if (pathFile != null) {
        try {
          String base64Image = base64Encode(pathFile);
          FileResponse fileData = await patientRepository.uploadFileBase64(
            base64Image,
            'invoice_${DateTime.now().timeZoneOffset}.pdf',
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
      medicalInvoiceData.value = const AsyncData(loading: true);
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

String generateHtmlFromInvoice(MedicalInvoiceRequest request) {
  final headerInfo = '''
    <h1>請求書</h1>
    <p><strong>請求書番号 :</strong> ${request.invoiceNumber ?? ''}</p>
    <p><strong>請求日:</strong> ${request.invoiceDate != null ? Dates.formatFullDate(request.invoiceDate!) : ''}</p>
    <p><strong>担当者:</strong> ${request.contact ?? ''}</p>
    <p><strong>登録番号:</strong> ${request.registrationNumber ?? ''}</p>
    <p><strong>件名:</strong> ${request.subject ?? ''}</p>
    <p><strong>ご請求額:</strong> ${request.amountBilled ?? ''}</p>
    <p><strong>支払期限:</strong> ${request.paymentDeadline != null ? Dates.formatFullDate(request.paymentDeadline!) : ''}</p>
    <p><strong>お振込み:</strong> ${request.bankTransferInformation ?? ''}</p>
    <p><strong>備考:</strong> ${request.remarks ?? ''}</p>
  ''';

  const paymentTableHeader = '''
    <table border="1">
      <tr>
        <th>税率</th>
        <th>税抜合線(門)</th>
        <th>消費税(円)</th>
        <th>合計金額(円)</th>
      </tr>
  ''';

  final paymentTableRows = request.totalPayment?.map((payment) {
        return '''
      <tr>
        <td>${payment.taxRate ?? ''}</td>
        <td>${payment.amountExcludingTaxInYen ?? ''}</td>
        <td>${payment.consumptionTaxAmountInYen ?? ''}</td>
        <td>${(payment.amountExcludingTaxInYen ?? 0) + (payment.consumptionTaxAmountInYen ?? 0)}</td>
      </tr>
    ''';
      }).join() ??
      '';

  final paymentTable = '''
    $paymentTableHeader
    $paymentTableRows
    </table>
  ''';

  const itemTableHeader = '''
    <table border="1">
      <tr>
        <th>取引日</th>
        <th>内訳</th>
        <th>数量</th>
        <th>单位</th>
        <th>単価</th>
        <th>金額</th>
        <th>税率</th>
      </tr>
  ''';

  final itemTableRows = request.item?.map((item) {
        return '''
      <tr>
        <td>${item.transactionDate != null ? Dates.formatFullDate(item.transactionDate!) : ''}</td>
        <td>${item.details ?? ''}</td>
        <td>${item.quantity ?? ''}</td>
        <td>${item.unit ?? ''}</td>
        <td>${item.unitPrice ?? ''}</td>
        <td>${item.amount ?? ''}</td>
        <td>${item.taxRate ?? ''}</td>
      </tr>
    ''';
      }).join() ??
      '';

  final itemTable = '''
    $itemTableHeader
    $itemTableRows
    </table>
  ''';

  return '''
    <html>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <body>
        $headerInfo
        $paymentTable
        $itemTable
      </body>
    </html>
  ''';
}
