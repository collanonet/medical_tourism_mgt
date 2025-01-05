// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_patient/data_patient.dart';
import 'package:injectable/injectable.dart';

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
}
