// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'medical_record_summary_request.g.dart';

@JsonSerializable()
class MedicalRecordSummaryRequest {
  final DateTime? entryDate;
  final String? namePassport;
  final DateTime? dateOfBirth;
  final int? age;
  final bool? gender;
  final String? nameChineseKanjiVietnamese;
  final String? nameKana;
  final String? currentAddress;
  final String? mobileNumberDomestic;
  final String? diseaseName;
  final String? tissueType;
  final bool? diseaseNotices;
  final String? diagnosticMedicalInstitutionName;
  final String? pastIllnessFamilyHistory;
  final String? referralMedicalInstitutionEtc;
  final String? diseaseCourseSndTestResultsEtc;
  final String? symptoms;
  final bool? notices;
  final bool? metastasis;
  final bool? radiationTreatmentOrNot;
  final bool? presenceOfAnticancerDrugTreatment;
  final bool? biopsy;
  final String? patientsWishes;
  final String? agentName;
  final String? personInChargeName;
  final String? mobileNumber;
  final String? patientsAddressStay;
  final String? emergencyContact;
  final String? remarks;
  final List<String?>? attachDocuments;
  String medicalRecord;

  MedicalRecordSummaryRequest({
    this.entryDate,
    this.namePassport,
    this.dateOfBirth,
    this.age,
    this.gender,
    this.nameChineseKanjiVietnamese,
    this.nameKana,
    this.currentAddress,
    this.mobileNumberDomestic,
    this.diseaseName,
    this.tissueType,
    this.diseaseNotices,
    this.diagnosticMedicalInstitutionName,
    this.pastIllnessFamilyHistory,
    this.referralMedicalInstitutionEtc,
    this.diseaseCourseSndTestResultsEtc,
    this.symptoms,
    this.notices,
    this.metastasis,
    this.radiationTreatmentOrNot,
    this.presenceOfAnticancerDrugTreatment,
    this.biopsy,
    this.patientsWishes,
    this.agentName,
    this.personInChargeName,
    this.mobileNumber,
    this.patientsAddressStay,
    this.emergencyContact,
    this.remarks,
    this.attachDocuments,
    required this.medicalRecord,
  });

  factory MedicalRecordSummaryRequest.fromJson(Map<String, dynamic> json) {
    return _$MedicalRecordSummaryRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicalRecordSummaryRequestToJson(this);

}
