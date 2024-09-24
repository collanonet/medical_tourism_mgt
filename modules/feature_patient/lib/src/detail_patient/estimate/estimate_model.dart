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
class EstimateModel {
  EstimateModel({
    required this.patientRepository,
  });

  final PatientRepository patientRepository;

  ValueNotifier<AsyncData<Patient>> patientData =
      ValueNotifier(const AsyncData());
  ValueNotifier<AsyncData<MedicalRecord>> medicalRecordData =
      ValueNotifier(const AsyncData());

  ValueNotifier<AsyncData<List<MedicalQuotationResponse>>>
      medicalQuotationData = ValueNotifier(const AsyncData());

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
      final response = await patientRepository.getQuotations(medicalRecordId);
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

      MedicalQuotationRequest request = MedicalQuotationRequest(
        quotationNumber: formGroup.control('quotationNumber').value,
        quotationDate: formGroup.control('quotationDate').value,
        contact: formGroup.control('contact').value,
        registrationNumber: formGroup.control('registrationNumber').value,
        subject: formGroup.control('subject').value,
        totalAmount: formGroup.control('totalAmount').value,
        validityPeriod: formGroup.control('validityPeriod').value,
        remarks: formGroup.control('remarks').value,
        totalPayment: totalPayment,
        item: items,
        medicalRecord: formGroup.control('medicalRecord').value,
        user: formGroup.control('user').value,
        hospitalRecord: formGroup.control('hospitalRecord').value,
      );


      String html = generateHtmlFromQuotation(
        request,
      );
      Uint8List? pathFile = await generatePdfFromHtml(html);
      String? fileName;

      if (pathFile != null) {
        try {
          String base64Image = base64Encode(pathFile);
          FileResponse fileData = await patientRepository.uploadFileBase64(
            base64Image,
            'quotation_${DateTime.now().timeZoneOffset}.pdf',
          );
          fileName = fileData.filename;
        } catch (e) {
          logger.e(e);
        }
      }

      if (fileName != null) {
        await createQuotation(request: request.copyWith(fileName: fileName));
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

  Future<void> createQuotation({
    required MedicalQuotationRequest request,
  }) async {
    try {
      medicalQuotationData.value = const AsyncData(loading: true);
      final response = await patientRepository.postQuotation(request);
      medicalQuotationData.value = AsyncData(data: [
        ...medicalQuotationData.value.data ?? [],
        response,
      ]);
      logger.d('Quotation created: ${medicalQuotationData.value.data?.length}');
    } catch (e) {
      logger.e(e);
      medicalQuotationData.value = AsyncData(error: e);
    }
  }
}

String generateHtmlFromQuotation(MedicalQuotationRequest request) {
  final headerInfo = '''
    <h1>見積書</h1>
    <p><strong>見積番号:</strong> ${request.quotationNumber ?? ''}</p>
    <p><strong>見積日:</strong> ${request.quotationDate != null ? Dates.formatFullDate(request.quotationDate!) : ''}</p>
    <p><strong>担当者:</strong> ${request.contact ?? ''}</p>
    <p><strong>登録番号:</strong> ${request.registrationNumber ?? ''}</p>
    <p><strong>件名:</strong> ${request.subject ?? ''}</p>
    <p><strong>合計金額:</strong> ${request.totalAmount ?? ''}</p>
    <p><strong>有効期限:</strong> ${request.validityPeriod != null ? Dates.formatFullDate(request.validityPeriod!) : ''}</p>
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
  }).join();

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
  }).join();

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
