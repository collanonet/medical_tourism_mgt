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

// Project imports:
import '../utils/summary_html_builder.dart';

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
      final htmlContent = buildSummaryHtml(summary);

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

}
