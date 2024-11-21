// Flutter imports:
import 'package:core_network/core_network.dart';
import 'package:core_utils/async.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:data_auth/data_auth.dart';
import 'package:data_patient/data_patient.dart';
import 'package:injectable/injectable.dart';

@injectable
class MedicalVisaDetailModel with ChangeNotifier {
  MedicalVisaDetailModel({
    required this.authRepository,
    required this.patientRepository,
  });

  final AuthRepository authRepository;
  final PatientRepository patientRepository;

  ValueNotifier<AsyncData<Patient>> patientData =
      ValueNotifier<AsyncData<Patient>>(const AsyncData());

  ValueNotifier<AsyncData<MedicalRecord>> medicalRecord =
      ValueNotifier<AsyncData<MedicalRecord>>(const AsyncData());

  initMedicalRecord(Patient? patient, String? id) async {
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
      } catch (error) {
        patientData.value = AsyncData<Patient>(error: error);
      }
    } else {
      patientData.value = const AsyncData();
    }
    if (patientData.value.hasData) {
      medicalRecord.value = const AsyncData(loading: true);
      try {
        var result = await patientRepository
            .medicalRecordsByPatient(patientData.value.requireData.id);

        medicalRecord.value = AsyncData(data: result.first);
      } catch (error) {
        medicalRecord.value = AsyncData(error: error);
      }
    }
  }
}
