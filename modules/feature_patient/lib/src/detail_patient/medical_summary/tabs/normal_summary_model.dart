// Flutter imports:
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

  getMedicalRecordSummary(FormGroup formGroup) async {
    try {
      logger.d('medicalRecord: ${medicalRecord.value.requireData.id}');
      medicalRecordSummary.value = const AsyncData(loading: true);
      var result = await patientRepository.getMedicalRecordSummary(
          medicalRecord: medicalRecord.value.requireData.id);

      logger.d('result: $result');
      medicalRecordSummary.value = AsyncData(data: result);
      insertDataToForm(formGroup, result);
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
      // 'attachDocuments': result.attachDocuments
      //         ?.map((e) => FormGroup({
      //               'attachDocumentsName': FormControl<String>(value: e),
      //             }))
      //         .toList() ??
      //     [
      //       FormGroup({
      //         'attachDocumentsName': FormControl<String>(),
      //       })
      //     ],
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
    formGroup.control('namePassport').value = '${data.familyNameRomanized} ${data.middleNameRomanized} ${data.firstNameRomanized}';
    formGroup.control('nameChineseKanjiVietnamese').value =
        '${data.familyNameChineseOrVietnamese} ${data.middleNameChineseOrVietnamese} ${data.firstNameChineseOrVietnamese}';
    formGroup.control('nameKana').value = '${data.familyNameJapaneseForChinese} ${data.middleNameJapaneseForChinese} ${data.firstNameJapaneseForChinese}';
  }

  void createUpdateMedicalRecordSummary(FormGroup formGroup) async {
    try {
      medicalRecordSummary.value = const AsyncData(loading: true);

      List<String?> attachDocuments = [];
      if (formGroup.control('attachDocuments').value != null) {
        for (var i = 0;
            i <
                (formGroup.control('attachDocuments').value as List<dynamic>)
                    .length;
            i++) {
          if ((formGroup.control('attachDocuments').value as List<dynamic>)[i]
                  ['attachDocumentsName'] !=
              null) {
            attachDocuments.add((formGroup.control('attachDocuments').value
                as List<dynamic>)[i]['attachDocumentsName']);
          }
        }
      }

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
        attachDocuments: attachDocuments,
        medicalRecord: medicalRecord.value.requireData.id,
      );

      logger.d('request: ${request.toJson()}');
      var result = await patientRepository.postMedicalRecordSummary(request);
      logger.d('result: $result');
      medicalRecordSummary.value = AsyncData(data: result);
      createMedicalRecordSummary.value = AsyncData(data: result);
    } catch (e) {
      logger.e(e);
      medicalRecordSummary.value = AsyncData(error: e);
      createMedicalRecordSummary.value = AsyncData(error: e);
    }
  }
}
