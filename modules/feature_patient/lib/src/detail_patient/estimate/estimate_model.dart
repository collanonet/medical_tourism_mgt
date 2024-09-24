// Flutter imports:
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:pdf/widgets.dart' as pw;
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

      Uint8List? pathFile = await generatePdfFromQuotation(request);
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

Future<Uint8List?> generatePdfFromQuotation(
    MedicalQuotationRequest request) async {
  final pdf = pw.Document();
  final Uint8List fontData =
      File('assets/fonts/NotoSansJPRegular.ttf').readAsBytesSync();
  final ttf = pw.Font.ttf(fontData.buffer.asByteData());
  pdf.addPage(
    pw.MultiPage(
      build: (context) => [
        pw.Header(
          level: 0,
          child: pw.Text(
            '見積書',
            style: pw.TextStyle(
              font: ttf,
            ),
          ),
        ),
        pw.Text(
          '見積番号: ${request.quotationNumber ?? ''}',
          style: pw.TextStyle(
            font: ttf,
          ),
        ),
        pw.Text(
          '見積日: ${request.quotationDate != null ? Dates.formatFullDate(request.quotationDate!) : ''}',
          style: pw.TextStyle(
            font: ttf,
          ),
        ),
        pw.Text(
          '担当者: ${request.contact ?? ''}',
          style: pw.TextStyle(
            font: ttf,
          ),
        ),
        pw.Text(
          '登録番号: ${request.registrationNumber ?? ''}',
          style: pw.TextStyle(
            font: ttf,
          ),
        ),
        pw.Text(
          '件名: ${request.subject ?? ''}',
          style: pw.TextStyle(
            font: ttf,
          ),
        ),
        pw.Text(
          '合計金額: ${request.totalAmount ?? ''}',
          style: pw.TextStyle(
            font: ttf,
          ),
        ),
        pw.Text(
          '有効期限: ${request.validityPeriod != null ? Dates.formatFullDate(request.validityPeriod!) : ''}',
          style: pw.TextStyle(
            font: ttf,
          ),
        ),
        pw.Text(
          '備考: ${request.remarks ?? ''}',
          style: pw.TextStyle(
            font: ttf,
          ),
        ),
        pw.SizedBox(height: 20),
        pw.TableHelper.fromTextArray(
          headers: ['税率', '税抜合線(門)', '消費税(円)', '合計金額(円)'],
          headerStyle: pw.TextStyle(
            font: ttf,
          ),
          oddCellStyle: pw.TextStyle(
            font: ttf,
          ),
          cellStyle: pw.TextStyle(
            font: ttf,
          ),
          data: request.totalPayment
                  ?.map((payment) => [
                        payment.taxRate ?? '',
                        payment.amountExcludingTaxInYen ?? '',
                        payment.consumptionTaxAmountInYen ?? '',
                        (payment.amountExcludingTaxInYen ?? 0) +
                            (payment.consumptionTaxAmountInYen ?? 0),
                      ])
                  .toList() ??
              [],
        ),
        pw.SizedBox(height: 20),
        pw.TableHelper.fromTextArray(
          headers: ['取引日', '内訳', '数量', '单位', '単価', '金額', '税率'],
          headerStyle: pw.TextStyle(
            font: ttf,
          ),
          oddCellStyle: pw.TextStyle(
            font: ttf,
          ),
          cellStyle: pw.TextStyle(
            font: ttf,
          ),
          data: request.item
                  ?.map((item) => [
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
    print(e);
    return null;
  }
}
