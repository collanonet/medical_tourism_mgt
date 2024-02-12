import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_patient/data_patient.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class OverseasMedicalDataModel {
  OverseasMedicalDataModel({
    required this.patientRepository,
  });

  final PatientRepository patientRepository;

  ValueNotifier<AsyncData<bool>> loading =
      ValueNotifier<AsyncData<bool>>(const AsyncData());

  ValueNotifier<AsyncData<Patient>> patientData =
      ValueNotifier<AsyncData<Patient>>(const AsyncData());
  Future<void> initialData({Patient? patient, String? id}) async {
    loading.value = const AsyncData(loading: true);
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
        await getMedicalRecordData(patientData.value.data?.id ?? id ?? '');
      } catch (error) {
        patientData.value = AsyncData<Patient>(error: error);
      } finally {
        loading.value = const AsyncData();
      }
    } else {
      patientData.value = const AsyncData();
      loading.value = const AsyncData();
    }
  }

  ValueNotifier<AsyncData<MedicalRecord>> medicalRecordData =
      ValueNotifier<AsyncData<MedicalRecord>>(const AsyncData());

  getMedicalRecordData(String patientId) async {
    medicalRecordData.value = const AsyncData(loading: true);

    try {
      var result = await patientRepository.medicalRecordsByPatient(patientId);
      logger.d('result: $result');
      if (result.isNotEmpty) {
        medicalRecordData.value = AsyncData(data: result.first);
        await getMedicalRecordsOverseasData(medicalRecordData.value.requireData.id);
      } else {
        medicalRecordData.value = const AsyncData();
      }
    } catch (e) {
      logger.e(e);
      medicalRecordData.value = AsyncData(error: e);
    }
  }

//GET_MEDICAL_RECORDS_OVERSEAS_DATA
  ValueNotifier<AsyncData<List<MedicalRecordOverseaData>>>
      medicalRecordsOverseasData =
      ValueNotifier<AsyncData<List<MedicalRecordOverseaData>>>(
          const AsyncData());

  Future<void> getMedicalRecordsOverseasData(String medicalRecordId) async {
    medicalRecordsOverseasData.value = const AsyncData(loading: true);

    await patientRepository
        .medicalRecordsOverseasData(medicalRecordId)
        .then((value) {
      medicalRecordsOverseasData.value = AsyncData(data: value);
    }).catchError((error) {
      logger.d(error);
      medicalRecordsOverseasData.value = AsyncData(error: error);
    });
  }

  // post MEDICAL_RECORDS_OVERSEAS_DATA
  Future<void> postMedicalRecordsOverseasData(
    MedicalRecordOverseaDataRequest medicalRecordOverseaDataRequest,
  ) async {
    medicalRecordsOverseasData.value = const AsyncData(loading: true);

    await patientRepository
        .postMedicalRecordOverseaData(medicalRecordOverseaDataRequest)
        .then((value) {
      medicalRecordsOverseasData.value.data?.add(value);
    }).catchError((error) {
      logger.d(error);
      medicalRecordsOverseasData.value = AsyncData(error: error);
    });
  }

  Future<void> updateMedicalRecordsOverseasData(
    String id,
    MedicalRecordOverseaDataRequest medicalRecordOverseaDataRequest,
  ) async {
    medicalRecordsOverseasData.value = const AsyncData(loading: true);

    await patientRepository
        .putMedicalRecordOverseaData(id, medicalRecordOverseaDataRequest)
        .then((value) {
      // Find from list and update or add
      final index = medicalRecordsOverseasData.value.data?.indexWhere(
            (element) => element.id == id,
          ) ??
          -1;
      if (index >= 0) {
        medicalRecordsOverseasData.value.data?[index] = value;
      } else {
        medicalRecordsOverseasData.value.data?.add(value);
      }
    }).catchError((error) {
      logger.d(error);
      medicalRecordsOverseasData.value = AsyncData(error: error);
    });
  }
}
