import 'package:json_annotation/json_annotation.dart';

part 'medical_record_patient_response_treatment_request.g.dart';

@JsonSerializable()
class MedicalRecordPatientResponseTreatmentRequest {
  bool? treatment;
  bool? treatmentInJapan;
  bool? secondOpinion;
  bool? detailedExamination;
  bool? medicalCheckup;
  bool? regenerativeMedicine;
  bool? stemCellTherapy;
  bool? immuneCellTherapy;
  bool? regenerativeOthers;
  bool? bloodPurificationTherapy;
  bool? riskInspection;
  bool? beauty;
  bool? others;
  String? othersRemark;
  bool? medicalInformationFromHomeCountry;
  bool? dicomImageData;
  bool? otherTestData;
  String? detail;
  String? diagnosisAtHomeCountry;
  String? medicalConditionExplanation;
  String? historyOfOnset;
  String? currentTreatment;
  List<String?>? drugDetails;
  bool? currentHealthStatus;
  String? medicalHistoryDetail;
  String? familyHistoryDetail;
  bool? currentDrugAllergyDetail;
  String? drugAllergyDetail;
  String? treatmentCosts;
  bool? desiredMedicalInstitution;
  String? desiredAreaMedicalInstitutionName;
  String? reason;
  String? desiredDateOfConsultation;
  String? scheduledPeriodOfStayInJapan;
  bool? walking;
  String? walkingDetail;
  bool? sitting;
  String? sittingDetail;
  bool? meal;
  String? mealDetail;
  bool? excretion;
  String? excretionDetail;
  String? aboutPregnancy;
  String medicalRecord;

  MedicalRecordPatientResponseTreatmentRequest({
    this.treatment,
    this.treatmentInJapan,
    this.secondOpinion,
    this.detailedExamination,
    this.medicalCheckup,
    this.regenerativeMedicine,
    this.stemCellTherapy,
    this.immuneCellTherapy,
    this.regenerativeOthers,
    this.bloodPurificationTherapy,
    this.riskInspection,
    this.beauty,
    this.others,
    this.othersRemark,
    this.medicalInformationFromHomeCountry,
    this.dicomImageData,
    this.otherTestData,
    this.detail,
    this.diagnosisAtHomeCountry,
    this.medicalConditionExplanation,
    this.historyOfOnset,
    this.currentTreatment,
    this.drugDetails,
    this.currentHealthStatus,
    this.medicalHistoryDetail,
    this.familyHistoryDetail,
    this.currentDrugAllergyDetail,
    this.drugAllergyDetail,
    this.treatmentCosts,
    this.desiredMedicalInstitution,
    this.desiredAreaMedicalInstitutionName,
    this.reason,
    this.desiredDateOfConsultation,
    this.scheduledPeriodOfStayInJapan,
    this.walking,
    this.walkingDetail,
    this.sitting,
    this.sittingDetail,
    this.meal,
    this.mealDetail,
    this.excretion,
    this.excretionDetail,
    this.aboutPregnancy,
    required this.medicalRecord,
  });
  factory MedicalRecordPatientResponseTreatmentRequest.fromJson(
      Map<String, dynamic> json) {
    return _$MedicalRecordPatientResponseTreatmentRequestFromJson(json);
  }

  Map<String, dynamic> toJson() =>
      _$MedicalRecordPatientResponseTreatmentRequestToJson(this);

  MedicalRecordPatientResponseTreatmentRequest copyWith(
      {required List<String?> drugDetails}) {
    return MedicalRecordPatientResponseTreatmentRequest(
      treatment: treatment,
      treatmentInJapan: treatmentInJapan,
      secondOpinion: secondOpinion,
      detailedExamination: detailedExamination,
      medicalCheckup: medicalCheckup,
      regenerativeMedicine: regenerativeMedicine,
      stemCellTherapy: stemCellTherapy,
      immuneCellTherapy: immuneCellTherapy,
      regenerativeOthers: regenerativeOthers,
      bloodPurificationTherapy: bloodPurificationTherapy,
      riskInspection: riskInspection,
      beauty: beauty,
      others: others,
      othersRemark: othersRemark,
      medicalInformationFromHomeCountry: medicalInformationFromHomeCountry,
      dicomImageData: dicomImageData,
      otherTestData: otherTestData,
      detail: detail,
      diagnosisAtHomeCountry: diagnosisAtHomeCountry,
      medicalConditionExplanation: medicalConditionExplanation,
      historyOfOnset: historyOfOnset,
      currentTreatment: currentTreatment,
      drugDetails: drugDetails,
      currentHealthStatus: currentHealthStatus,
      medicalHistoryDetail: medicalHistoryDetail,
      familyHistoryDetail: familyHistoryDetail,
      currentDrugAllergyDetail: currentDrugAllergyDetail,
      drugAllergyDetail: drugAllergyDetail,
      treatmentCosts: treatmentCosts,
      desiredMedicalInstitution: desiredMedicalInstitution,
      desiredAreaMedicalInstitutionName: desiredAreaMedicalInstitutionName,
      reason: reason,
      desiredDateOfConsultation: desiredDateOfConsultation,
      scheduledPeriodOfStayInJapan: scheduledPeriodOfStayInJapan,
      walking: walking,
      walkingDetail: walkingDetail,
      sitting: sitting,
      sittingDetail: sittingDetail,
      meal: meal,
      mealDetail: mealDetail,
      excretion: excretion,
      excretionDetail: excretionDetail,
      aboutPregnancy: aboutPregnancy,
      medicalRecord: medicalRecord,
    );
  }
}
