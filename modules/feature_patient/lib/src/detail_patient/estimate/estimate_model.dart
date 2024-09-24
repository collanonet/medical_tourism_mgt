// Flutter imports:
import 'dart:convert';
import 'dart:io';

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
    String? id,
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

      logger.d('formGroup.value: ${formGroup.value}');
      MedicalQuotationRequest request = MedicalQuotationRequest(
        quotationNumber: formGroup.control('quotationNumber').value,
        quotationDate: formGroup.control('quotationDate').value,
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

      logger.d('request: ${request.toJson()}');

      String html = generateHtmlFromQuotation(
        request,
      );
      String? pathFile = await generatePdfFromHtml(html);
      String? fileName;

      if (pathFile != null) {
        try {
          File file = File(pathFile);
          String base64Image = base64Encode(file.readAsBytesSync());
          FileResponse fileData = await patientRepository.uploadFileBase64(
            base64Image,
            pathFile.split('/').last,
          );
          fileName = fileData.filename;
        } catch (e) {
          logger.e(e);
        }
      }

      if (fileName != null) {
        request.file = fileName;

        await createQuotation(request: request);
        submitData.value = const AsyncData(data: true);
        formGroup.reset();
      } else {
        submitData.value = const AsyncData(error: 'ファイルの作成に失敗しました');
      }
    } catch (e) {
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
    } catch (e) {
      medicalQuotationData.value = AsyncData(error: e);
    }
  }
}

String generateHtmlFromQuotation(MedicalQuotationRequest request) {
  final headerInfo = '''
    <h1>Quotation Details</h1>
    <p><strong>Quotation Number:</strong> ${request.quotationNumber}</p>
    <p><strong>Quotation Date:</strong> ${request.quotationDate != null ? Dates.formatFullDate(request.quotationDate!) : request.quotationDate}</p>
    <p><strong>Registration Number:</strong> ${request.registrationNumber}</p>
    <p><strong>Subject:</strong> ${request.subject}</p>
    <p><strong>Total Amount:</strong> ${request.totalAmount}</p>
    <p><strong>Validity Period:</strong> ${request.validityPeriod}</p>
    <p><strong>Remarks:</strong> ${request.remarks}</p>
  ''';

  const paymentTableHeader = '''
    <h2>Payment Details</h2>
    <table border="1">
      <tr>
        <th>Tax Rate</th>
        <th>Amount Excluding Tax (Yen)</th>
        <th>Consumption Tax Amount (Yen)</th>
      </tr>
  ''';

  final paymentTableRows = request.totalPayment?.map((payment) {
    return '''
      <tr>
        <td>${payment.taxRate}</td>
        <td>${payment.amountExcludingTaxInYen}</td>
        <td>${payment.consumptionTaxAmountInYen}</td>
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
    <h2>Item Details</h2>
    <table border="1">
      <tr>
        <th>Transaction Date</th>
        <th>Details</th>
        <th>Quantity</th>
        <th>Unit</th>
        <th>Unit Price</th>
        <th>Amount</th>
        <th>Tax Rate</th>
      </tr>
  ''';

  final itemTableRows = request.item?.map((item) {
    return '''
      <tr>
        <td>${item.transactionDate != null ? Dates.formatFullDate(item.transactionDate!) : item.transactionDate}</td>
        <td>${item.details ?? ''}</td>
        <td>${item.quantity}</td>
        <td>${item.unit}</td>
        <td>${item.unitPrice}</td>
        <td>${item.amount}</td>
        <td>${item.taxRate}</td>
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
      <body>
        $headerInfo
        $paymentTable
        $itemTable
      </body>
    </html>
  ''';
}
