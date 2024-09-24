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
    String? id,
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
      medicalInvoiceData.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<bool>> submitData = ValueNotifier(const AsyncData());

  Future<void> submit({
    required FormGroup formGroup,
  }) async {
    try {
      submitData.value = const AsyncData(loading: true);

      logger.d('formGroup.value: ${formGroup.value}');

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
      MedicalInvoiceRequest request = MedicalInvoiceRequest(
        invoiceNumber: formGroup.control('quotationNumber').value,
        invoiceDate: formGroup.control('quotationDate').value,
        registrationNumber: formGroup.control('registrationNumber').value,
        subject: formGroup.control('subject').value,
        amountBilled: formGroup.control('totalAmount').value,
        paymentDeadline: formGroup.control('validityPeriod').value,
        bankTransferInformation:
            formGroup.control('bankTransferInformation').value,
        remarks: formGroup.control('remarks').value,
        totalPayment: totalPayment,
        item: items,
        medicalRecord: formGroup.control('medicalRecord').value,
        user: formGroup.control('user').value,
        hospitalRecord: formGroup.control('hospitalRecord').value,
      );

      logger.d('request: ${request.toJson()}');

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
        await createInvoice(request: request.copyWith(file: fileName));
        submitData.value = const AsyncData(data: true);
        formGroup.reset();
      } else {
        submitData.value = const AsyncData(error: 'ファイルの作成に失敗しました');
      }
    } catch (e) {
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
      medicalInvoiceData.value = AsyncData(error: e);
    }
  }
}

String generateHtmlFromInvoice(MedicalInvoiceRequest request) {
  final headerInfo = '''
    <h1>Invoice Details</h1>
    <p><strong>Invoice Number:</strong> ${request.invoiceNumber}</p>
    <p><strong>Invoice Date:</strong> ${request.invoiceDate != null ? Dates.formatFullDate(request.invoiceDate!) : request.invoiceDate}</p>
    <p><strong>Registration Number:</strong> ${request.registrationNumber}</p>
    <p><strong>Subject:</strong> ${request.subject}</p>
    <p><strong>Amount Billed:</strong> ${request.amountBilled}</p>
    <p><strong>Payment Deadline:</strong> ${request.paymentDeadline}</p>
    <p><strong>Bank Transfer Information:</strong> ${request.bankTransferInformation}</p>
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
      }).join() ??
      '';

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
