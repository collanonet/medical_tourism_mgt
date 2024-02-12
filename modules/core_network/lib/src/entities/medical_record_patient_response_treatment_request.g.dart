// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_patient_response_treatment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecordPatientResponseTreatmentRequest
    _$MedicalRecordPatientResponseTreatmentRequestFromJson(
            Map<String, dynamic> json) =>
        MedicalRecordPatientResponseTreatmentRequest(
          treatment: json['treatment'] as bool?,
          treatmentInJapan: json['treatmentInJapan'] as bool?,
          secondOpinion: json['secondOpinion'] as bool?,
          detailedExamination: json['detailedExamination'] as bool?,
          medicalCheckup: json['medicalCheckup'] as bool?,
          regenerativeMedicine: json['regenerativeMedicine'] as bool?,
          stemCellTherapy: json['stemCellTherapy'] as bool?,
          immuneCellTherapy: json['immuneCellTherapy'] as bool?,
          regenerativeOthers: json['regenerativeOthers'] as bool?,
          bloodPurificationTherapy: json['bloodPurificationTherapy'] as bool?,
          riskInspection: json['riskInspection'] as bool?,
          beauty: json['beauty'] as bool?,
          others: json['others'] as bool?,
          othersRemark: json['othersRemark'] as String?,
          medicalInformationFromHomeCountry:
              json['medicalInformationFromHomeCountry'] as bool?,
          dicomImageData: json['dicomImageData'] as bool?,
          otherTestData: json['otherTestData'] as bool?,
          detail: json['detail'] as String?,
          diagnosisAtHomeCountry: json['diagnosisAtHomeCountry'] as String?,
          medicalConditionExplanation:
              json['medicalConditionExplanation'] as String?,
          historyOfOnset: json['historyOfOnset'] as String?,
          currentTreatment: json['currentTreatment'] as String?,
          drugDetails: (json['drugDetails'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList(),
          currentHealthStatus: json['currentHealthStatus'] as bool?,
          medicalHistoryDetail: json['medicalHistoryDetail'] as String?,
          familyHistoryDetail: json['familyHistoryDetail'] as String?,
          currentDrugAllergyDetail: json['currentDrugAllergyDetail'] as bool?,
          drugAllergyDetail: json['drugAllergyDetail'] as String?,
          treatmentCosts: json['treatmentCosts'] as String?,
          desiredMedicalInstitution: json['desiredMedicalInstitution'] as bool?,
          desiredAreaMedicalInstitutionName:
              json['desiredAreaMedicalInstitutionName'] as String?,
          reason: json['reason'] as String?,
          desiredDateOfConsultation:
              json['desiredDateOfConsultation'] as String?,
          scheduledPeriodOfStayInJapan:
              json['scheduledPeriodOfStayInJapan'] as String?,
          walking: json['walking'] as bool?,
          walkingDetail: json['walkingDetail'] as String?,
          sitting: json['sitting'] as bool?,
          sittingDetail: json['sittingDetail'] as String?,
          meal: json['meal'] as bool?,
          mealDetail: json['mealDetail'] as String?,
          excretion: json['excretion'] as bool?,
          excretionDetail: json['excretionDetail'] as String?,
          aboutPregnancy: json['aboutPregnancy'] as String?,
          medicalRecord: json['medicalRecord'] as String,
        );

Map<String, dynamic> _$MedicalRecordPatientResponseTreatmentRequestToJson(
        MedicalRecordPatientResponseTreatmentRequest instance) =>
    <String, dynamic>{
      'treatment': instance.treatment,
      'treatmentInJapan': instance.treatmentInJapan,
      'secondOpinion': instance.secondOpinion,
      'detailedExamination': instance.detailedExamination,
      'medicalCheckup': instance.medicalCheckup,
      'regenerativeMedicine': instance.regenerativeMedicine,
      'stemCellTherapy': instance.stemCellTherapy,
      'immuneCellTherapy': instance.immuneCellTherapy,
      'regenerativeOthers': instance.regenerativeOthers,
      'bloodPurificationTherapy': instance.bloodPurificationTherapy,
      'riskInspection': instance.riskInspection,
      'beauty': instance.beauty,
      'others': instance.others,
      'othersRemark': instance.othersRemark,
      'medicalInformationFromHomeCountry':
          instance.medicalInformationFromHomeCountry,
      'dicomImageData': instance.dicomImageData,
      'otherTestData': instance.otherTestData,
      'detail': instance.detail,
      'diagnosisAtHomeCountry': instance.diagnosisAtHomeCountry,
      'medicalConditionExplanation': instance.medicalConditionExplanation,
      'historyOfOnset': instance.historyOfOnset,
      'currentTreatment': instance.currentTreatment,
      'drugDetails': instance.drugDetails,
      'currentHealthStatus': instance.currentHealthStatus,
      'medicalHistoryDetail': instance.medicalHistoryDetail,
      'familyHistoryDetail': instance.familyHistoryDetail,
      'currentDrugAllergyDetail': instance.currentDrugAllergyDetail,
      'drugAllergyDetail': instance.drugAllergyDetail,
      'treatmentCosts': instance.treatmentCosts,
      'desiredMedicalInstitution': instance.desiredMedicalInstitution,
      'desiredAreaMedicalInstitutionName':
          instance.desiredAreaMedicalInstitutionName,
      'reason': instance.reason,
      'desiredDateOfConsultation': instance.desiredDateOfConsultation,
      'scheduledPeriodOfStayInJapan': instance.scheduledPeriodOfStayInJapan,
      'walking': instance.walking,
      'walkingDetail': instance.walkingDetail,
      'sitting': instance.sitting,
      'sittingDetail': instance.sittingDetail,
      'meal': instance.meal,
      'mealDetail': instance.mealDetail,
      'excretion': instance.excretion,
      'excretionDetail': instance.excretionDetail,
      'aboutPregnancy': instance.aboutPregnancy,
      'medicalRecord': instance.medicalRecord,
    };
