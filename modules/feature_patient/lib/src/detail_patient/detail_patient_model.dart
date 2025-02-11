// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_patient/data_patient.dart';
import 'package:injectable/injectable.dart';

@injectable
class DetailPatientModel {
  DetailPatientModel({
    required this.patientRepository,
  });

  final PatientRepository patientRepository;

  ValueNotifier<AsyncData<Patient>> patientData =
      ValueNotifier<AsyncData<Patient>>(const AsyncData());

  ValueNotifier<AsyncData<MedicalRecord>> medicalRecord =
      ValueNotifier<AsyncData<MedicalRecord>>(const AsyncData());

  void updateMedicalRecord(MedicalRecord medicalRecord) {
    this.medicalRecord.value = AsyncData(data: medicalRecord);
  }

  Future<void> initialData({Patient? patient, String? id}) async {
    if (patient != null || id != null) {
      patientData.value = const AsyncData<Patient>(loading: true);

      try {
        if (patient == null) {
          if (id != null) {
            var result = await patientRepository.patient(id);
            patientData.value = AsyncData<Patient>(data: result);
          }
        } else {
          patientData.value = AsyncData<Patient>(data: patient);
        }
        await getPatientNames(
            patientId: patientData.value.data?.id ?? id ?? '');
      } catch (error) {
        patientData.value = AsyncData<Patient>(error: error);
      }
    } else {
      patientData.value = const AsyncData();
    }
  }

  ValueNotifier<AsyncData<PatientName>> patientNames = ValueNotifier(
    const AsyncData(),
  );

  Future<void> getPatientNames({
    String? patientId,
    PatientName? patientName,
  }) async {
    patientNames.value = const AsyncData(loading: true);

    if (patientName != null) {
      patientNames.value = AsyncData(data: patientName);
    } else {
      var names = await patientRepository
          .patientNamesByPatient(patientId ?? patientData.value.data?.id ?? '');

      if (names.isNotEmpty) {
        patientNames.value = AsyncData(data: names.firstOrNull);
      } else {
        patientNames.value = const AsyncData();
      }
    }
  }
}
