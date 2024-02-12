import 'package:json_annotation/json_annotation.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'medical_record_patient_response_treatment.g.dart';

@JsonSerializable()
class MedicalRecordPatientResponseTreatment {
  @JsonKey(name: '_id')
  String id;
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
  final DateTime createdAt;
  final DateTime updatedAt;

  MedicalRecordPatientResponseTreatment({
    required this.id,
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
    required this.createdAt,
    required this.updatedAt,
  });

  factory MedicalRecordPatientResponseTreatment.fromJson(Map<String, dynamic> json) {
    return _$MedicalRecordPatientResponseTreatmentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicalRecordPatientResponseTreatmentToJson(this);

}
