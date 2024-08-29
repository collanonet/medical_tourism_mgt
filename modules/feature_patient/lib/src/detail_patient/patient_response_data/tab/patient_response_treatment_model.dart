// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_patient/data_patient.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class PatientResponseTreatmentModel {
  PatientResponseTreatmentModel({
    required this.patientRepository,
  });

  final PatientRepository patientRepository;

  ValueNotifier<AsyncData<MedicalRecordPatientResponseTreatment>>
      medicalRecordPatientResponseTreatment =
      ValueNotifier(const AsyncData<MedicalRecordPatientResponseTreatment>());


  ValueNotifier<AsyncData<MedicalRecordPatientResponseTreatment>>
  createMedicalRecordPatientResponseTreatment =
  ValueNotifier(const AsyncData<MedicalRecordPatientResponseTreatment>());



  ValueNotifier<AsyncData<MedicalRecord>> medicalRecord =
      ValueNotifier<AsyncData<MedicalRecord>>(const AsyncData());

  Future<void> init(String? patientId, FormGroup formGroup) async {
    await getMedicalRecords(patientId: patientId, formGroup: formGroup);
  }

  Future<void> getMedicalRecords(
      {String? patientId, required FormGroup formGroup}) async {
    if (patientId != null) {
      try {
        medicalRecord.value = const AsyncData(loading: true);

        var result = await patientRepository.medicalRecordsByPatient(patientId);
        logger.d('result: $result');
        if (result.isNotEmpty) {
          medicalRecord.value = AsyncData(data: result.first);
          await getMedicalRecordPatientResponseTreatment(formGroup);
        } else {
          medicalRecord.value = const AsyncData();
        }
      } catch (e) {
        logger.e(e);
        medicalRecord.value = AsyncData(error: e);
      }
    }
  }

  Future<void> getMedicalRecordPatientResponseTreatment(
      FormGroup formGroup) async {
    medicalRecordPatientResponseTreatment.value =
        const AsyncData(loading: true);
    try {
      final response =
          await patientRepository.getMedicalRecordPatientResponseTreatment(
              medicalRecord: medicalRecord.value.requireData.id);
      medicalRecordPatientResponseTreatment.value = AsyncData(data: response);
      insertMedicalRecordPatientResponseTreatment(response, formGroup);
    } catch (e) {
      medicalRecordPatientResponseTreatment.value = AsyncData(error: e);
    }
  }

  insertMedicalRecordPatientResponseTreatment(
      MedicalRecordPatientResponseTreatment? data, FormGroup formGroup) async {
    if (data != null) {
      formGroup.control('id').value = data.id;
      formGroup.control('treatment').value = data.treatment;
      formGroup.control('treatmentInJapan').value = data.treatmentInJapan;
      formGroup.control('secondOpinion').value = data.secondOpinion;
      formGroup.control('detailedExamination').value = data.detailedExamination;
      formGroup.control('medicalCheckup').value = data.medicalCheckup;
      formGroup.control('regenerativeMedicine').value =
          data.regenerativeMedicine;
      formGroup.control('stemCellTherapy').value = data.stemCellTherapy;
      formGroup.control('immuneCellTherapy').value = data.immuneCellTherapy;
      formGroup.control('regenerativeOthers').value = data.regenerativeOthers;
      formGroup.control('bloodPurificationTherapy').value =
          data.bloodPurificationTherapy;
      formGroup.control('riskInspection').value = data.riskInspection;
      formGroup.control('beauty').value = data.beauty;
      formGroup.control('others').value = data.others;
      formGroup.control('othersRemark').value = data.othersRemark;
      formGroup.control('medicalInformationFromHomeCountry').value =
          data.medicalInformationFromHomeCountry;
      formGroup.control('dicomImageData').value = data.dicomImageData;
      formGroup.control('otherTestData').value = data.otherTestData;
      formGroup.control('detail').value = data.detail;
      formGroup.control('diagnosisAtHomeCountry').value =
          data.diagnosisAtHomeCountry;
      formGroup.control('medicalConditionExplanation').value =
          data.medicalConditionExplanation;
      formGroup.control('historyOfOnset').value = data.historyOfOnset;
      formGroup.control('currentTreatment').value = data.currentTreatment;
      formGroup.control('currentHealthStatus').value = data.currentHealthStatus;
      formGroup.control('medicalHistoryDetail').value =
          data.medicalHistoryDetail;
      formGroup.control('familyHistoryDetail').value = data.familyHistoryDetail;
      formGroup.control('currentDrugAllergyDetail').value =
          data.currentDrugAllergyDetail;
      formGroup.control('drugAllergyDetail').value = data.drugAllergyDetail;
      formGroup.control('treatmentCosts').value = data.treatmentCosts;
      formGroup.control('desiredMedicalInstitution').value =
          data.desiredMedicalInstitution;
      formGroup.control('desiredAreaMedicalInstitutionName').value =
          data.desiredAreaMedicalInstitutionName;
      formGroup.control('reason').value = data.reason;
      formGroup.control('desiredDateOfConsultation').value =
          data.desiredDateOfConsultation;
      formGroup.control('scheduledPeriodOfStayInJapan').value =
          data.scheduledPeriodOfStayInJapan;
      formGroup.control('walking').value = data.walking;
      formGroup.control('walkingDetail').value = data.walkingDetail;
      formGroup.control('sitting').value = data.sitting;
      formGroup.control('sittingDetail').value = data.sittingDetail;
      formGroup.control('meal').value = data.meal;
      formGroup.control('mealDetail').value = data.mealDetail;
      formGroup.control('excretion').value = data.excretion;
      formGroup.control('excretionDetail').value = data.excretionDetail;
      formGroup.control('aboutPregnancy').value = data.aboutPregnancy;
      formGroup.control('medicalRecord').value =
          medicalRecord.value.requireData.id;
      final drugDetails = formGroup.control('drugDetails') as FormArray;
      drugDetails.clear();
      data.drugDetails?.forEach((element) {
        drugDetails.add(
          FormGroup({
            'drugName': FormControl<String>(value: element),
          }),
        );
      });

      if (data.drugDetails == null || data.drugDetails?.isEmpty == true) {
        drugDetails.add(
          FormGroup({
            'drugName': FormControl<String>(),
          }),
        );
      }
    }
  }

  createUpdateMedicalRecordPatientResponseTreatment(FormGroup formGroup) async {
    medicalRecordPatientResponseTreatment.value = const AsyncData(loading: true);
    try {
      List<String?> drugDetails = [];
      logger.d(
          'formGroup.control(\'drugDetails\').value: ${formGroup.control('drugDetails').value}');
      if (formGroup.control('drugDetails').value != null) {
        for (var i = 0;
            i <
                (formGroup.control('drugDetails').value as List<dynamic>)
                    .length;
            i++) {
          if ((formGroup.control('drugDetails').value as List<dynamic>)[i]
                      ['drugName'] !=
                  null ||
              (formGroup.control('drugDetails').value as List<dynamic>)[i]
                      ['drugName'] !=
                  '') {
            drugDetails.add((formGroup.control('drugDetails').value
                as List<dynamic>)[i]['drugName']);
          }
        }
      }

      MedicalRecordPatientResponseTreatmentRequest request =
          MedicalRecordPatientResponseTreatmentRequest(
        treatment: formGroup.control('treatment').value,
        treatmentInJapan: formGroup.control('treatmentInJapan').value,
        secondOpinion: formGroup.control('secondOpinion').value,
        detailedExamination: formGroup.control('detailedExamination').value,
        medicalCheckup: formGroup.control('medicalCheckup').value,
        regenerativeMedicine: formGroup.control('regenerativeMedicine').value,
        stemCellTherapy: formGroup.control('stemCellTherapy').value,
        immuneCellTherapy: formGroup.control('immuneCellTherapy').value,
        regenerativeOthers: formGroup.control('regenerativeOthers').value,
        bloodPurificationTherapy:
            formGroup.control('bloodPurificationTherapy').value,
        riskInspection: formGroup.control('riskInspection').value,
        beauty: formGroup.control('beauty').value,
        others: formGroup.control('others').value,
        othersRemark: formGroup.control('othersRemark').value,
        medicalInformationFromHomeCountry:
            formGroup.control('medicalInformationFromHomeCountry').value,
        dicomImageData: formGroup.control('dicomImageData').value,
        otherTestData: formGroup.control('otherTestData').value,
        detail: formGroup.control('detail').value,
        diagnosisAtHomeCountry:
            formGroup.control('diagnosisAtHomeCountry').value,
        medicalConditionExplanation:
            formGroup.control('medicalConditionExplanation').value,
        historyOfOnset: formGroup.control('historyOfOnset').value,
        currentTreatment: formGroup.control('currentTreatment').value,
        drugDetails: drugDetails,
        currentHealthStatus: formGroup.control('currentHealthStatus').value,
        medicalHistoryDetail: formGroup.control('medicalHistoryDetail').value,
        familyHistoryDetail: formGroup.control('familyHistoryDetail').value,
        currentDrugAllergyDetail:
            formGroup.control('currentDrugAllergyDetail').value,
        drugAllergyDetail: formGroup.control('drugAllergyDetail').value,
        treatmentCosts: formGroup.control('treatmentCosts').value,
        desiredMedicalInstitution:
            formGroup.control('desiredMedicalInstitution').value,
        desiredAreaMedicalInstitutionName:
            formGroup.control('desiredAreaMedicalInstitutionName').value,
        reason: formGroup.control('reason').value,
        desiredDateOfConsultation:
            formGroup.control('desiredDateOfConsultation').value,
        scheduledPeriodOfStayInJapan:
            formGroup.control('scheduledPeriodOfStayInJapan').value,
        walking: formGroup.control('walking').value,
        walkingDetail: formGroup.control('walkingDetail').value,
        sitting: formGroup.control('sitting').value,
        sittingDetail: formGroup.control('sittingDetail').value,
        meal: formGroup.control('meal').value,
        mealDetail: formGroup.control('mealDetail').value,
        excretion: formGroup.control('excretion').value,
        excretionDetail: formGroup.control('excretionDetail').value,
        aboutPregnancy: formGroup.control('aboutPregnancy').value,
        medicalRecord: medicalRecord.value.requireData.id,
      );

      final response =
          await patientRepository.postMedicalRecordPatientResponseTreatment(
              request.copyWith(drugDetails: drugDetails));
      medicalRecordPatientResponseTreatment.value =
          medicalRecordPatientResponseTreatment.value.copyWith(data: response);
      createMedicalRecordPatientResponseTreatment.value =
          createMedicalRecordPatientResponseTreatment.value.copyWith(data: response);
    } catch (e) {
      logger.e(e);
      medicalRecordPatientResponseTreatment.value =
          medicalRecordPatientResponseTreatment.value.copyWith(error: e);
      createMedicalRecordPatientResponseTreatment.value =
          createMedicalRecordPatientResponseTreatment.value.copyWith(error: e);
    } finally {
      medicalRecordPatientResponseTreatment.value =
          medicalRecordPatientResponseTreatment.value.copyWith(loading: false);
    }
  }
}
