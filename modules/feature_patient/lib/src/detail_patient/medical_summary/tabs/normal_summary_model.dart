import 'package:core_network/core_network.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_patient/data_patient.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class NormalSummaryModel {
  NormalSummaryModel({
    required this.patientRepository,
  });

  final PatientRepository patientRepository;

  ValueNotifier<AsyncData<MedicalRecordSummary>> medicalRecordSummary =
      ValueNotifier(AsyncData());

  ValueNotifier<AsyncData<MedicalRecordSummary>> createMedicalRecordSummary =
      ValueNotifier(AsyncData());

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
          formGroup.patchValue({
            'dateOfBirth': medicalRecord.value.requireData.dateOfBirth,
            'age': medicalRecord.value.requireData.age,
            'gender': medicalRecord.value.requireData.gender,
            'medicalRecord': medicalRecord.value.requireData.id,
          });
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
      'namePassport': result.namePassport,
      'dateOfBirth': medicalRecord.value.requireData.dateOfBirth,
      'age': medicalRecord.value.requireData.age,
      'gender': medicalRecord.value.requireData.gender,
      'nameChineseKanjiVietnamese': result.nameChineseKanjiVietnamese,
      'nameKana': result.nameKana,
      'currentAddress': result.currentAddress,
      'mobileNumberPatient': result.mobileNumberPatient,
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
      'attachDocuments': result.attachDocuments
              ?.map((e) => FormGroup({
                    'attachDocumentsName': FormControl<String>(value: e),
                  }))
              .toList() ??
          [
            FormGroup({
              'attachDocumentsName': FormControl<String>(),
            })
          ],
      'medicalRecord': medicalRecord.value.requireData.id,
    });
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
        mobileNumberPatient: formGroup.control('mobileNumberPatient').value,
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
