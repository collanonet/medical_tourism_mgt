import 'package:json_annotation/json_annotation.dart';

part 'medical_record_patient_response_medical_checkup.g.dart';

@JsonSerializable()
class MedicalRecordPatientResponseMedicalCheckup {
  @JsonKey(name: '_id')
  String id;
  int? numberOfPeopleRequestingMedicalCheckup;
  int? age;
  bool? sex;
  String? relationshipBetweenPerson;
  bool? isThereMedicalInstitutionToAttend;
  String? desiredAreaOrMedicalInstitutionName;
  String? reason;
  bool? petCT;
  bool? mri;
  bool? gastroscope;
  String? freeInput;
  String? currentConcerns;
  String? brokerageCompanyOrIntroducer;
  bool? historyOfCancer;
  String? cancerSite;
  bool? currentlyDiabetes;
  bool? diabetesMedication;
  int? fastingBloodSugarMgPerDl;
  int? fastingBloodSugarMmolPerL;
  bool? implant;
  int? implantYear;
  int? implantMonth;
  bool? bodyMetalOrTattoo;
  bool? hadMriAfterMetalOrTattoo;
  String? partAndItsMaterial;
  bool? claustrophobia;
  String medicalRecord;
  final DateTime createdAt;
  final DateTime updatedAt;

  MedicalRecordPatientResponseMedicalCheckup({
    required this.id,
    this.numberOfPeopleRequestingMedicalCheckup,
    this.age,
    this.sex,
    this.relationshipBetweenPerson,
    this.isThereMedicalInstitutionToAttend,
    this.desiredAreaOrMedicalInstitutionName,
    this.reason,
    this.petCT,
    this.mri,
    this.gastroscope,
    this.freeInput,
    this.currentConcerns,
    this.brokerageCompanyOrIntroducer,
    this.historyOfCancer,
    this.cancerSite,
    this.currentlyDiabetes,
    this.diabetesMedication,
    this.fastingBloodSugarMgPerDl,
    this.fastingBloodSugarMmolPerL,
    this.implant,
    this.implantYear,
    this.implantMonth,
    this.bodyMetalOrTattoo,
    this.hadMriAfterMetalOrTattoo,
    this.partAndItsMaterial,
    this.claustrophobia,
    required this.medicalRecord,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MedicalRecordPatientResponseMedicalCheckup.fromJson(Map<String, dynamic> json) {
    return _$MedicalRecordPatientResponseMedicalCheckupFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicalRecordPatientResponseMedicalCheckupToJson(this);

}
