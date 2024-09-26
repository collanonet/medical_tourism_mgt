// Flutter imports:
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';

import 'dart:typed_data';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart' show rootBundle;

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
        patient: formGroup.control('user').value,
        hospitalRecord: formGroup.control('hospitalRecord').value,
      );

      Uint8List? pathFile = await generatePdfFromQuotation(
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
            'quotation_${DateTime.now().millisecondsSinceEpoch}.pdf',
          );
          fileName = fileData.filename;
        } catch (e) {
          logger.e(e);
        }
      }

      // List<int>? excelFile = await generateExcelFromQuotation(
      //   request,
      //   patientData.value.requireData,
      // );

      // String? fileNameExcel;

      // if (excelFile != null) {
      //   try {
      //     String base64Image = base64Encode(Uint8List.fromList(excelFile));
      //     FileResponse fileData = await patientRepository.uploadFileBase64(
      //       base64Image,
      //       // get timestamp to avoid duplicate file name
      //       'quotation_${DateTime.now().millisecondsSinceEpoch}.xlsx',
      //     );
      //     fileNameExcel = fileData.filename;
      //   } catch (e) {
      //     logger.e(e);
      //   }
      // }

      if (fileName != null) {
        await createQuotation(
          request: request.copyWith(
            fileName: fileName,
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

  Future<void> createQuotation({
    required MedicalQuotationRequest request,
  }) async {
    try {
      medicalQuotationData.value = medicalQuotationData.value.copyWith(
        loading: true,
      );
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
    MedicalQuotationRequest request, Patient patient) async {
  final pdf = pw.Document();
  final ByteData fontData =
      await rootBundle.load('assets/fonts/NotoSansJPRegular.ttf');
  final ttf = pw.Font.ttf(fontData);

  pdf.addPage(
    pw.MultiPage(
      build: (context) => [
        pw.Header(
          level: 0,
          child: pw.Align(
            alignment: pw.Alignment.center,
            child: pw.Text(
              '見積書',
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
            '見積番号: ${request.quotationNumber ?? ''}',
            style: pw.TextStyle(
              font: ttf,
            ),
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
            '見積日: ${request.quotationDate != null ? Dates.formatFullDate(request.quotationDate!) : ''}',
            style: pw.TextStyle(
              font: ttf,
            ),
            textAlign: pw.TextAlign.right,
          ),
        ]),
        pw.Align(
          alignment: pw.Alignment.centerRight,
          child: pw.Text(
            '担当者: ${request.contact ?? ''}',
            style: pw.TextStyle(
              font: ttf,
            ),
            textAlign: pw.TextAlign.right,
          ),
        ),
        pw.Align(
          alignment: pw.Alignment.centerRight,
          child: pw.Text(
            '登録番号: ${request.registrationNumber ?? ''}',
            style: pw.TextStyle(
              font: ttf,
            ),
            textAlign: pw.TextAlign.right,
          ),
        ),
        pw.Text(
          '件名: ${request.subject ?? ''}',
          style: pw.TextStyle(
            font: ttf,
          ),
          textAlign: pw.TextAlign.left,
        ),
        pw.Text(
          '合計金額: ${request.totalAmount ?? ''}',
          style: pw.TextStyle(
            font: ttf,
          ),
          textAlign: pw.TextAlign.left,
        ),
        pw.SizedBox(height: 20),
        pw.TableHelper.fromTextArray(
          headers: ['税率', '税抜合線(門)', '消費税(円)', '合計金額(円)'],
          headerCellDecoration: const pw.BoxDecoration(
            color: PdfColor.fromInt(0xffe0e0e0),
          ),
          columnWidths: {
            0: const pw.FlexColumnWidth(1),
            1: const pw.FlexColumnWidth(2),
            2: const pw.FlexColumnWidth(2),
            3: const pw.FlexColumnWidth(2),
          },
          headerAlignment: pw.Alignment.centerLeft,
          cellAlignment: pw.Alignment.centerLeft,
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
          headers: [
            '有効期限',
            request.validityPeriod != null
                ? Dates.formatFullDate(request.validityPeriod!)
                : ''
          ],
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
              '備考',
              request.remarks ?? '',
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
          data: request.item
                  ?.map((item) => [
                        (request.item?.indexOf(item) ?? 0) + 1,
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
    if (kDebugMode) {
      print(e);
    }
    return null;
  }
}

Future<List<int>?> generateExcelFromQuotation(
    MedicalQuotationRequest request, Patient patient) async {
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

  cell2.value = TextCellValue('見積番号: ${request.quotationNumber ?? ''}');

  var cell3 = sheetObject.cell(CellIndex.indexByString('A3'));
  cell3.value = TextCellValue(
      '${patient.firstNameRomanized ?? ''} ${patient.middleNameRomanized ?? ''} ${patient.familyNameRomanized ?? ''} 様');

  var cell4 = sheetObject.cell(CellIndex.indexByString('E3'));
  cell4.value = TextCellValue(
      '見積日: ${request.quotationDate != null ? Dates.formatFullDate(request.quotationDate!) : ''}');

  var cell5 = sheetObject.cell(CellIndex.indexByString('E4'));
  cell5.value = TextCellValue('担当者: ${request.contact ?? ''}');

  var cell6 = sheetObject.cell(CellIndex.indexByString('E5'));
  cell6.value = TextCellValue('登録番号: ${request.registrationNumber ?? ''}');

  var cell7 = sheetObject.cell(CellIndex.indexByString('A7'));
  cell7.value = TextCellValue('件名: ${request.subject ?? ''}');

  var cell8 = sheetObject.cell(CellIndex.indexByString('A8'));
  cell8.value = TextCellValue('合計金額: ${request.totalAmount ?? ''}');

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
  cell14.value = TextCellValue(request.validityPeriod != null
      ? Dates.formatFullDate(request.validityPeriod!)
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
