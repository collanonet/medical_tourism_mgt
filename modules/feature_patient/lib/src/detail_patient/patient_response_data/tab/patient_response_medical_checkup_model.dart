// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_patient/data_patient.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class PatientResponseMedicalCheckupModel {
  PatientResponseMedicalCheckupModel({
    required this.patientRepository,
  });

  final PatientRepository patientRepository;

  ValueNotifier<AsyncData<MedicalRecordPatientResponseMedicalCheckup>>
      medicalCheckup = ValueNotifier(const AsyncData());
  ValueNotifier<AsyncData<MedicalRecordPatientResponseMedicalCheckup>>
      createMedicalCheckup = ValueNotifier(const AsyncData());
  ValueNotifier<AsyncData<MedicalRecord>> medicalRecord =
      ValueNotifier<AsyncData<MedicalRecord>>(const AsyncData());

  Future<void> getMedicalRecords(
      {String? patientId, required FormGroup formGroup}) async {
    if (patientId != null) {
      try {
        medicalRecord.value = const AsyncData(loading: true);

        var result = await patientRepository.medicalRecordsByPatient(patientId);
        logger.d('result: $result');
        if (result.isNotEmpty) {
          medicalRecord.value = AsyncData(data: result.first);
          await getMedicalRecordPatientResponseMedicalCheckUp(formGroup);
        } else {
          medicalRecord.value = const AsyncData();
        }
      } catch (e) {
        logger.e(e);
        medicalRecord.value = AsyncData(error: e);
      }
    }
  }

  getMedicalRecordPatientResponseMedicalCheckUp(FormGroup formGroup) async {
    try {
      medicalCheckup.value = const AsyncData(loading: true);
      var result =
          await patientRepository.getMedicalRecordPatientResponseMedicalCheckup(
              medicalRecord: medicalRecord.value.requireData.id);

      logger.d('result: $result');
      medicalCheckup.value = AsyncData(data: result);
      insertDataToForm(formGroup, result);
    } catch (e) {
      logger.e(e);
      medicalCheckup.value = AsyncData(error: e);
    }
  }

  void insertDataToForm(
      FormGroup formGroup, MedicalRecordPatientResponseMedicalCheckup result) {
    formGroup.patchValue({
      '_id': result.id,
      'date1': result.date1,
      'date2': result.date2,
      'date3': result.date3,
      'desiredDate': result.desiredDate,
      'remarks': result.remarks,
      'numberOfPeopleRequestingMedicalCheckup':
          result.numberOfPeopleRequestingMedicalCheckup ?? 0,
      'age': result.age ?? 0,
      'sex': result.sex ?? true,
      'relationshipBetweenPerson': result.relationshipBetweenPerson,
      'isThereMedicalInstitutionToAttend':
          result.isThereMedicalInstitutionToAttend,
      'desiredAreaOrMedicalInstitutionName':
          result.desiredAreaOrMedicalInstitutionName,
      'reason': result.reason,
      'petCT': result.petCT ?? true,
      'mri': result.mri ?? true,
      'gastroscope': result.gastroscope ?? true,
      'freeInput': result.freeInput,
      'currentConcerns': result.currentConcerns,
      'brokerageCompanyOrIntroducer': result.brokerageCompanyOrIntroducer,
      'historyOfCancer': result.historyOfCancer ?? true,
      'cancerSite': result.cancerSite,
      'currentlyDiabetes': result.currentlyDiabetes ?? true,
      'diabetesMedication': result.diabetesMedication ?? true,
      'fastingBloodSugarMgPerDl': result.fastingBloodSugarMgPerDl ?? 0,
      'fastingBloodSugarMmolPerL': result.fastingBloodSugarMmolPerL ?? 0,
      'implant': result.implant ?? true,
      'implantYear': result.implantYear,
      'implantMonth': result.implantMonth,
      'bodyMetalOrTattoo': result.bodyMetalOrTattoo ?? true,
      'hadMriAfterMetalOrTattoo': result.hadMriAfterMetalOrTattoo ?? true,
      'partAndItsMaterial': result.partAndItsMaterial,
      'claustrophobia': result.claustrophobia ?? true,
      'medicalRecord': medicalRecord.value.requireData.id,
    });
  }

  Future<void> postMedicalRecordPatientResponseMedicalCheckup(
      FormGroup formGroup) async {
    try {
      medicalCheckup.value = const AsyncData(loading: true);
      var data = MedicalRecordPatientResponseMedicalCheckupRequest(
        numberOfPeopleRequestingMedicalCheckup:
            formGroup.control('numberOfPeopleRequestingMedicalCheckup').value,
        date1: formGroup.control('date1').value,
        date2: formGroup.control('date2').value,
        date3: formGroup.control('date3').value,
        desiredDate: formGroup.control('desiredDate').value,
        remarks: formGroup.control('remarks').value,
        age: formGroup.control('age').value,
        sex: formGroup.control('sex').value,
        relationshipBetweenPerson:
            formGroup.control('relationshipBetweenPerson').value,
        isThereMedicalInstitutionToAttend:
            formGroup.control('isThereMedicalInstitutionToAttend').value,
        desiredAreaOrMedicalInstitutionName:
            formGroup.control('desiredAreaOrMedicalInstitutionName').value,
        reason: formGroup.control('reason').value,
        petCT: formGroup.control('petCT').value,
        mri: formGroup.control('mri').value,
        gastroscope: formGroup.control('gastroscope').value,
        freeInput: formGroup.control('freeInput').value,
        currentConcerns: formGroup.control('currentConcerns').value,
        brokerageCompanyOrIntroducer:
            formGroup.control('brokerageCompanyOrIntroducer').value,
        historyOfCancer: formGroup.control('historyOfCancer').value,
        cancerSite: formGroup.control('cancerSite').value,
        currentlyDiabetes: formGroup.control('currentlyDiabetes').value,
        diabetesMedication: formGroup.control('diabetesMedication').value,
        fastingBloodSugarMgPerDl:
            formGroup.control('fastingBloodSugarMgPerDl').value,
        fastingBloodSugarMmolPerL:
            formGroup.control('fastingBloodSugarMmolPerL').value,
        implant: formGroup.control('implant').value,
        implantYear: formGroup.control('implantYear').value,
        implantMonth: formGroup.control('implantMonth').value,
        bodyMetalOrTattoo: formGroup.control('bodyMetalOrTattoo').value,
        hadMriAfterMetalOrTattoo:
            formGroup.control('hadMriAfterMetalOrTattoo').value,
        partAndItsMaterial: formGroup.control('partAndItsMaterial').value,
        claustrophobia: formGroup.control('claustrophobia').value,
        medicalRecord: medicalRecord.value.requireData.id,
      );

      var result = await patientRepository
          .postMedicalRecordPatientResponseMedicalCheckup(data);
      logger.d('result: $result');
      medicalCheckup.value = AsyncData(data: result);
      createMedicalCheckup.value = AsyncData(data: result);
    } catch (e) {
      logger.e(e);
      medicalCheckup.value = AsyncData(error: e);
      createMedicalCheckup.value = AsyncData(error: e);
    }
  }
}
