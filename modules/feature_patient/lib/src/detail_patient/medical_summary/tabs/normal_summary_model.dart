// Flutter imports:
import 'dart:convert';

import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_patient/data_patient.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class NormalSummaryModel {
  NormalSummaryModel({
    required this.patientRepository,
  });

  final PatientRepository patientRepository;

  ValueNotifier<AsyncData<MedicalRecordSummary>> medicalRecordSummary =
      ValueNotifier(const AsyncData());

  ValueNotifier<AsyncData<MedicalRecordSummary>> createMedicalRecordSummary =
      ValueNotifier(const AsyncData());

  ValueNotifier<AsyncData<MedicalRecord>> medicalRecord =
      ValueNotifier<AsyncData<MedicalRecord>>(const AsyncData());

  ValueNotifier<AsyncData<List<MedicalRecordFileSummaryResponse>>>
      fileSummaryListData =
      ValueNotifier(const AsyncData<List<MedicalRecordFileSummaryResponse>>());

  Future<void> getMedicalRecords(
      {String? patientId, required FormGroup formGroup}) async {
    logger.d('patientId: $patientId');
    if (patientId != null) {
      try {
        medicalRecord.value = const AsyncData(loading: true);

        var result = await patientRepository.medicalRecordsByPatient(patientId);
        logger.d('result: $result');
        if (result.isNotEmpty) {
          medicalRecord.value = AsyncData(data: result.first);
          formGroup.control('dateOfBirth').value =
              medicalRecord.value.requireData.dateOfBirth;
          formGroup.control('age').value = medicalRecord.value.requireData.age;
          formGroup.control('gender').value =
              medicalRecord.value.requireData.gender;
          formGroup.control('medicalRecord').value =
              medicalRecord.value.requireData.id;
          await getPatientNationalities(
              patientId: patientId, formGroup: formGroup);
          await getPatientNames(patientId: patientId, formGroup: formGroup);
          await getMedicalRecordSummary(formGroup);

          if (!medicalRecordSummary.value.hasData) {
            await createUpdateMedicalRecordSummary(formGroup);
          }
        } else {
          medicalRecord.value = const AsyncData();
        }
      } catch (e) {
        logger.e(e);
        medicalRecord.value = AsyncData(error: e);
      }
    }
  }

  ValueNotifier<AsyncData<PatientNationality>> patientNationalities =
      ValueNotifier<AsyncData<PatientNationality>>(const AsyncData());

  Future<void> getPatientNationalities({
    required String patientId,
    required FormGroup formGroup,
  }) async {
    patientNationalities.value = const AsyncData(loading: true);

    await patientRepository
        .patientNationalitiesByPatient(patientId)
        .then((value) {
      if (value.isNotEmpty) {
        patientNationalities.value = AsyncData(data: value.first);
        insertPATIENTNATIONALITIES(
          data: value.first,
          formGroup: formGroup,
        );
      } else {
        patientNationalities.value = const AsyncData();
      }
    }).catchError((error) {
      logger.d(error);
      patientNationalities.value = AsyncData(error: error);
    });
  }

  void insertPATIENTNATIONALITIES({
    required PatientNationality data,
    required FormGroup formGroup,
  }) {
    formGroup.control('currentAddress').value = data.currentAddress;
    formGroup.control('mobileNumberPatient').value = data.mobileNumber;
  }

  Future<void> getMedicalRecordSummary(FormGroup formGroup) async {
    try {
      medicalRecordSummary.value = const AsyncData(loading: true);
      var result = await patientRepository.getMedicalRecordSummary(
          medicalRecord: medicalRecord.value.requireData.id);
      medicalRecordSummary.value = AsyncData(data: result);
      insertDataToForm(formGroup, result);
      await fetchSummaryList(result.id);
    } catch (e) {
      logger.e(e);
      medicalRecordSummary.value = AsyncData(error: e);
    }
  }

  void insertDataToForm(FormGroup formGroup, MedicalRecordSummary result) {
    formGroup.patchValue({
      'id': result.id,
      'entryDate': result.entryDate,
      'currentAddress': result.currentAddress,
      'mobileNumberDomestic': result.mobileNumberDomestic,
      'diseaseName': result.diseaseName,
      'tissueType': result.tissueType,
      'diseaseNotices': result.diseaseNotices,
      'diagnosticMedicalInstitutionName':
          result.diagnosticMedicalInstitutionName,
      'pastIllnessFamilyHistory': result.pastIllnessFamilyHistory,
      'referralMedicalInstitutionEtc': result.referralMedicalInstitutionEtc,
      'diseaseCourseSndTestResultsEtc': result.diseaseCourseSndTestResultsEtc,
      'symptoms': result.symptoms,
      'notices': result.notices,
      'metastasis': result.metastasis,
      'radiationTreatmentOrNot': result.radiationTreatmentOrNot,
      'presenceOfAnticancerDrugTreatment':
          result.presenceOfAnticancerDrugTreatment,
      'biopsy': result.biopsy,
      'patientsWishes': result.patientsWishes,
      'agentName': result.agentName,
      'personInChargeName': result.personInChargeName,
      'mobileNumber': result.mobileNumber,
      'patientsAddressStay': result.patientsAddressStay,
      'emergencyContact': result.emergencyContact,
      'remarks': result.remarks,
      'medicalRecord': medicalRecord.value.requireData.id,
    });
  }

  ValueNotifier<AsyncData<PatientName>> patientNames = ValueNotifier(
    const AsyncData(),
  );

  Future<void> getPatientNames({
    required String patientId,
    required FormGroup formGroup,
  }) async {
    patientNames.value = const AsyncData(loading: true);

    await patientRepository.patientNamesByPatient(patientId).then((value) {
      if (value.isNotEmpty) {
        patientNames.value = AsyncData(data: value.firstOrNull);
        insertPatientName(
          data: value.first,
          formGroup: formGroup,
        );
      } else {
        patientNames.value = const AsyncData();
      }
    }).catchError((error) {
      logger.d(error);
      patientNames.value = AsyncData(error: error);
    });
  }

  void insertPatientName({
    required PatientName data,
    required FormGroup formGroup,
  }) {
    formGroup.control('namePassport').value =
        '${data.familyNameRomanized} ${data.middleNameRomanized} ${data.firstNameRomanized}';
    formGroup.control('nameChineseKanjiVietnamese').value =
        '${data.familyNameChineseOrVietnamese} ${data.middleNameChineseOrVietnamese} ${data.firstNameChineseOrVietnamese}';
    formGroup.control('nameKana').value =
        '${data.familyNameJapaneseForChinese} ${data.middleNameJapaneseForChinese} ${data.firstNameJapaneseForChinese}';
  }

  Future<void> fetchSummaryList(String summaryId) async {
    try {
      fileSummaryListData.value = const AsyncData(loading: true);
      final response =
          await patientRepository.getFileSummaryBySummaryId(summaryId);
      fileSummaryListData.value = AsyncData(data: response);
    } catch (e) {
      logger.e(e);
      fileSummaryListData.value = AsyncData(error: e.toString());
    }
  }

  ValueNotifier<AsyncData<bool>> submitData = ValueNotifier(const AsyncData());

  // submit page
  Future<void> submitSummary(FormGroup formGroup) async {
    try {
      submitData.value = const AsyncData(loading: true);
      await createUpdateMedicalRecordSummary(formGroup);
      submitData.value = const AsyncData(data: true);
    } catch (e) {
      logger.e(e);
      submitData.value = AsyncData(error: e);
    }
  }

  Future<void> createUpdateMedicalRecordSummary(FormGroup formGroup) async {
    try {
      medicalRecordSummary.value = const AsyncData(loading: true);
      var request = MedicalRecordSummaryRequest(
        entryDate: formGroup.control('entryDate').value,
        namePassport: formGroup.control('namePassport').value,
        dateOfBirth: formGroup.control('dateOfBirth').value,
        age: formGroup.control('age').value,
        gender: formGroup.control('gender').value,
        nameChineseKanjiVietnamese:
            formGroup.control('nameChineseKanjiVietnamese').value,
        nameKana: formGroup.control('nameKana').value,
        currentAddress: formGroup.control('currentAddress').value,
        mobileNumberDomestic: formGroup.control('mobileNumberDomestic').value,
        diseaseName: formGroup.control('diseaseName').value,
        tissueType: formGroup.control('tissueType').value,
        diseaseNotices: formGroup.control('diseaseNotices').value,
        diagnosticMedicalInstitutionName:
            formGroup.control('diagnosticMedicalInstitutionName').value,
        pastIllnessFamilyHistory:
            formGroup.control('pastIllnessFamilyHistory').value,
        referralMedicalInstitutionEtc:
            formGroup.control('referralMedicalInstitutionEtc').value,
        diseaseCourseSndTestResultsEtc:
            formGroup.control('diseaseCourseSndTestResultsEtc').value,
        symptoms: formGroup.control('symptoms').value,
        notices: formGroup.control('notices').value,
        metastasis: formGroup.control('metastasis').value,
        radiationTreatmentOrNot:
            formGroup.control('radiationTreatmentOrNot').value,
        presenceOfAnticancerDrugTreatment:
            formGroup.control('presenceOfAnticancerDrugTreatment').value,
        biopsy: formGroup.control('biopsy').value,
        patientsWishes: formGroup.control('patientsWishes').value,
        agentName: formGroup.control('agentName').value,
        personInChargeName: formGroup.control('personInChargeName').value,
        mobileNumber: formGroup.control('mobileNumber').value,
        patientsAddressStay: formGroup.control('patientsAddressStay').value,
        emergencyContact: formGroup.control('emergencyContact').value,
        remarks: formGroup.control('remarks').value,
        medicalRecord: medicalRecord.value.requireData.id,
      );
      var result = await patientRepository.postMedicalRecordSummary(request);
      medicalRecordSummary.value = AsyncData(data: result);
      createMedicalRecordSummary.value = AsyncData(data: result);
    } catch (e) {
      logger.e(e);
      medicalRecordSummary.value = AsyncData(error: e);
      createMedicalRecordSummary.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<bool>> submitFile = ValueNotifier(const AsyncData());

  Future<void> uploadFileSummary(FormGroup formGroup) async {
    try {
      submitFile.value = const AsyncData(loading: true);
      FileSelect fileUpdate = formGroup.control('file').value;
      String? pathFile;
      if (fileUpdate.file != null) {
        try {
          String base64Image = base64Encode(fileUpdate.file!);
          var filUpload = await patientRepository.uploadFileBase64(
              base64Image, fileUpdate.filename ?? '');
          pathFile = filUpload.filename;
        } catch (e) {
          logger.e(e);
          pathFile = null;
        }
      }

      if (pathFile != null) {
        var fileRequest = MedicalRecordFileSummaryRequest(
          pathFile: pathFile,
          documentName: formGroup.control('documentName').value,
          publicationDate: formGroup.control('publicationDate').value,
          share: formGroup.control('share').value,
          disclosureToAgent: formGroup.control('disclosureToAgent').value,
          recordSummary: medicalRecordSummary.value.requireData.id,
          medicalRecord: medicalRecord.value.requireData.id,
        );

        var result = await patientRepository.postFileSummary(fileRequest);
        fileSummaryListData.value = AsyncData(data: [
          ...fileSummaryListData.value.data ?? [],
          result,
        ]);
      }
      submitFile.value = const AsyncData(data: true);
    } catch (e) {
      logger.e(e);
      submitFile.value = AsyncData(error: e);
    }
  }
}
