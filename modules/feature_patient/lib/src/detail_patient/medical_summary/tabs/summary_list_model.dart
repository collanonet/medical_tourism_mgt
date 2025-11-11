// Flutter imports:
import 'dart:convert';
import 'dart:typed_data';
import 'dart:io' show File;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_patient/data_patient.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

enum SummaryExportFormat { word, pdf }

@injectable
class SummaryListModel {
  SummaryListModel({
    required this.patientRepository,
  });

  final PatientRepository patientRepository;

  ValueNotifier<AsyncData<List<MedicalRecordFileSummaryResponse>>>
      fileSummaryListData =
      ValueNotifier(const AsyncData<List<MedicalRecordFileSummaryResponse>>());

  ValueNotifier<AsyncData<MedicalRecord>> medicalRecord =
      ValueNotifier<AsyncData<MedicalRecord>>(const AsyncData());

  ValueNotifier<AsyncData<MedicalRecordSummary>> medicalRecordSummary =
      ValueNotifier<AsyncData<MedicalRecordSummary>>(const AsyncData());

  ValueNotifier<AsyncData<bool>> exportSummaryState =
      ValueNotifier<AsyncData<bool>>(const AsyncData());

  Future<void> fetchSummaryList(String? patientId) async {
    if (patientId != null) {
      try {
        fileSummaryListData.value = const AsyncData(loading: true);
        var result = await patientRepository.medicalRecordsByPatient(patientId);

        medicalRecord.value = AsyncData(data: result.first);
        final response = await patientRepository
            .getSummaryList(medicalRecord.value.data?.id ?? '');
        fileSummaryListData.value = AsyncData(data: response);
      } catch (e) {
        logger.e(e);
        fileSummaryListData.value = AsyncData(error: e.toString());
      }
    }
  }

  ValueNotifier<AsyncData<bool>> delete = ValueNotifier(const AsyncData());

  Future<void> deleteDomesticMedical(List<String> ids) async {
    try {
      delete.value = const AsyncData(loading: true);
      for (var id in ids) {
        await patientRepository.deleteFileSummary(id);
        fileSummaryListData.value = AsyncData(
            data: fileSummaryListData.value.data ?? []
              ..removeWhere((element) => element.id == id));
      }

      delete.value = const AsyncData(data: true);
    } catch (e) {
      logger.e(e);
      delete.value = AsyncData(error: e.toString());
    }
  }

  Future<void> exportSummary({
    required SummaryExportFormat format,
  }) async {
    try {
      exportSummaryState.value = const AsyncData(loading: true);

      if (!medicalRecord.value.hasData) {
        throw Exception('医療情報が取得できませんでした');
      }

      final summary = await _getMedicalRecordSummary();
      final htmlContent = _buildSummaryHtml(summary);

      final now = DateTime.now();
      final timestamp = DateFormat('yyyyMMdd_HHmm').format(now);
      final documentName = '診療サマリー_$timestamp';

      Uint8List fileBytes;
      String fileExtension;

      if (format == SummaryExportFormat.pdf) {
        final pdfResult = await generatePdfFromHtml(htmlContent);
        if (pdfResult is Uint8List) {
          fileBytes = pdfResult;
        } else if (pdfResult is String) {
          final file = File(pdfResult);
          fileBytes = await file.readAsBytes();
        } else {
          throw Exception('PDFの生成に失敗しました');
        }
        fileExtension = 'pdf';
      } else {
        final docBytes = utf8.encode(htmlContent);
        fileBytes = Uint8List.fromList(docBytes);
        fileExtension = 'doc';
      }

      final fileName = 'summary_$timestamp.$fileExtension';
      final uploadResponse = await patientRepository.uploadFileBase64(
        base64Encode(fileBytes),
        fileName,
      );

      final request = MedicalRecordFileSummaryRequest(
        pathFile: uploadResponse.filename,
        documentName:
            '$documentName (${format == SummaryExportFormat.pdf ? 'PDF' : 'Word'})',
        publicationDate: now,
        share: '○',
        disclosureToAgent: '○',
        recordSummary: summary.id,
        medicalRecord: summary.medicalRecord,
      );

      final created = await patientRepository.postFileSummary(request);

      fileSummaryListData.value = AsyncData(data: [
        ...fileSummaryListData.value.data ?? [],
        created,
      ]);

      exportSummaryState.value = const AsyncData(data: true);
    } catch (e) {
      logger.e(e);
      exportSummaryState.value = AsyncData(error: e);
    }
  }

  Future<MedicalRecordSummary> _getMedicalRecordSummary() async {
    if (medicalRecordSummary.value.hasData) {
      return medicalRecordSummary.value.requireData;
    }

    final recordId = medicalRecord.value.requireData.id;
    try {
      medicalRecordSummary.value = const AsyncData(loading: true);
      final summary =
          await patientRepository.getMedicalRecordSummary(medicalRecord: recordId);
      medicalRecordSummary.value = AsyncData(data: summary);
      return summary;
    } catch (e) {
      medicalRecordSummary.value = AsyncData(error: e);
      rethrow;
    }
  }

  String _buildSummaryHtml(MedicalRecordSummary summary) {
    String formatDate(DateTime? date) {
      if (date == null) return '-';
      return DateFormat('yyyy/MM/dd').format(date);
    }

    String formatBool(bool? value, {String trueLabel = 'あり', String falseLabel = 'なし'}) {
      if (value == null) return '-';
      return value ? trueLabel : falseLabel;
    }

    String formatGender(bool? gender) {
      if (gender == null) return '-';
      return gender ? '男性' : '女性';
    }

    String formatText(String? value) {
      if (value == null || value.trim().isEmpty) return '-';
      return value.replaceAll('\n', '<br/>');
    }

    final buffer = StringBuffer()
      ..writeln('<html><head><meta charset="utf-8" />')
      ..writeln(
          '<style>body{font-family:"Noto Sans JP","Yu Gothic",sans-serif;} table{width:100%;border-collapse:collapse;} th,td{border:1px solid #999;padding:6px;text-align:left;vertical-align:top;} th{background-color:#f2f2f2;}</style>')
      ..writeln('</head><body>')
      ..writeln('<h1 style="text-align:center;">診療サマリー</h1>')
      ..writeln('<table>')
      ..writeln(_tableRow('記載日', formatDate(summary.entryDate)))
      ..writeln(_tableRow('氏名（パスポート）', formatText(summary.namePassport)))
      ..writeln(_tableRow('生年月日', formatDate(summary.dateOfBirth)))
      ..writeln(_tableRow('年齢', summary.age?.toString() ?? '-'))
      ..writeln(_tableRow('性別', formatGender(summary.gender)))
      ..writeln(_tableRow('氏名（中国語漢字/ベトナム語）',
          formatText(summary.nameChineseKanjiVietnamese)))
      ..writeln(_tableRow('氏名（カナ）', formatText(summary.nameKana)))
      ..writeln(_tableRow('現住所', formatText(summary.currentAddress)))
      ..writeln(_tableRow('携帯番号（患者）', formatText(summary.mobileNumberPatient)))
      ..writeln(_tableRow('携帯番号（国内可）', formatText(summary.mobileNumberDomestic)))
      ..writeln(_tableRow('病名', formatText(summary.diseaseName)))
      ..writeln(_tableRow('組織型', formatText(summary.tissueType)))
      ..writeln(_tableRow('特記事項', formatBool(summary.diseaseNotices)))
      ..writeln(_tableRow(
          '診断・診察医療機関名', formatText(summary.diagnosticMedicalInstitutionName)))
      ..writeln(_tableRow('既往歴・家族歴等',
          formatText(summary.pastIllnessFamilyHistory)))
      ..writeln(_tableRow(
          '紹介医療機関等', formatText(summary.referralMedicalInstitutionEtc)))
      ..writeln(_tableRow('病状経過と検査結果等',
          formatText(summary.diseaseCourseSndTestResultsEtc)))
      ..writeln(_tableRow('症状', formatText(summary.symptoms)))
      ..writeln(_tableRow('注意事項', formatBool(summary.notices)))
      ..writeln(_tableRow('転移', formatBool(summary.metastasis)))
      ..writeln(_tableRow(
          '放射線治療の有無', formatBool(summary.radiationTreatmentOrNot)))
      ..writeln(_tableRow('抗がん剤治療の有無',
          formatBool(summary.presenceOfAnticancerDrugTreatment)))
      ..writeln(_tableRow('生検', formatBool(summary.biopsy)))
      ..writeln(_tableRow('患者様の希望', formatText(summary.patientsWishes)))
      ..writeln(_tableRow('エージェント名', formatText(summary.agentName)))
      ..writeln(
          _tableRow('担当者名', formatText(summary.personInChargeName)))
      ..writeln(_tableRow('携帯番号（担当）', formatText(summary.mobileNumber)))
      ..writeln(_tableRow('滞在予定住所', formatText(summary.patientsAddressStay)))
      ..writeln(_tableRow('緊急連絡先', formatText(summary.emergencyContact)))
      ..writeln(_tableRow('備考', formatText(summary.remarks)))
      ..writeln('</table>')
      ..writeln('</body></html>');

    return buffer.toString();
  }

  String _tableRow(String title, String value) {
    return '<tr><th style="width:25%;">$title</th><td>$value</td></tr>';
  }
}
