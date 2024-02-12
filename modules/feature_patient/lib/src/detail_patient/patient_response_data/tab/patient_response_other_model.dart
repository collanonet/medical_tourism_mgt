import 'package:core_network/core_network.dart';
import 'package:core_utils/async.dart';
import 'package:data_patient/data_patient.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class PatientResponseOtherModel {
  PatientResponseOtherModel({
    required this.patientRepository,
  });

  final PatientRepository patientRepository;

  ValueNotifier<AsyncData<MedicalRecordPatientResponseOther>> other =
      ValueNotifier(const AsyncData());

  ValueNotifier<AsyncData<MedicalRecordPatientResponseOther>> createOther =
      ValueNotifier(const AsyncData());

  ValueNotifier<AsyncData<MedicalRecord>> medicalRecord =
      ValueNotifier<AsyncData<MedicalRecord>>(const AsyncData());

  Future<void> getMedicalRecords(
      {String? patientId, required FormGroup formGroup}) async {
    if (patientId != null) {
      try {
        medicalRecord.value = const AsyncData(loading: true);

        var result = await patientRepository.medicalRecordsByPatient(patientId);
        if (result.isNotEmpty) {
          medicalRecord.value = AsyncData(data: result.first);
          await getMedicalRecordPatientResponseOther(formGroup);
        } else {
          medicalRecord.value = const AsyncData();
        }
      } catch (e) {
        medicalRecord.value = AsyncData(error: e);
      }
    }
  }

  getMedicalRecordPatientResponseOther(FormGroup formGroup) async {
    try {
      other.value = const AsyncData(loading: true);
      var result = await patientRepository.getMedicalRecordPatientResponseOther(
          medicalRecord: medicalRecord.value.requireData.id);

      other.value = AsyncData(data: result);
      insertDataToForm(formGroup, result);
    } catch (e) {
      other.value = AsyncData(error: e);
    }
  }

  void insertDataToForm(
      FormGroup formGroup, MedicalRecordPatientResponseOther result) {
    formGroup.patchValue({
      'doYouHaveAValidVisa': result.doYouHaveAValidVisa ?? false,
      'visa': result.visa,
      'requestingAPersonalGuaranteeForObtainingAMedicalVisa':
          result.requestingAPersonalGuaranteeForObtainingAMedicalVisa ?? false,
      'remarks': result.remarks,
      'companionDoYouHaveAValidVisa':
          result.companionDoYouHaveAValidVisa ?? false,
      'companionVisa': result.companionVisa,
      'companionRequestingAPersonalGuaranteeForObtainingAMedicalVisa': result
              .companionRequestingAPersonalGuaranteeForObtainingAMedicalVisa ??
          false,
    });
  }

  Future<void> createMedicalRecordPatientResponseOther(
      FormGroup formGroup) async {
    try {
      createOther.value = const AsyncData(loading: true);
      var result =
          await patientRepository.postMedicalRecordPatientResponseOther(
        MedicalRecordPatientResponseOtherRequest(
          doYouHaveAValidVisa: formGroup.control('doYouHaveAValidVisa').value,
          visa: formGroup.control('visa').value,
          requestingAPersonalGuaranteeForObtainingAMedicalVisa: formGroup
              .control('requestingAPersonalGuaranteeForObtainingAMedicalVisa')
              .value,
          remarks: formGroup.control('remarks').value,
          companionDoYouHaveAValidVisa:
              formGroup.control('companionDoYouHaveAValidVisa').value,
          companionVisa: formGroup.control('companionVisa').value,
          companionRequestingAPersonalGuaranteeForObtainingAMedicalVisa: formGroup
              .control(
                  'companionRequestingAPersonalGuaranteeForObtainingAMedicalVisa')
              .value,
          medicalRecord: medicalRecord.value.requireData.id,
        ),
      );
      createOther.value = AsyncData(data: result);
    } catch (e) {
      createOther.value = AsyncData(error: e);
    }
  }
}
