// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'create_domestic_medical_data_request.g.dart';

@JsonSerializable()
class DomesticMedicalDataRequest {
  String? file;
  String? nameOfMedicalInstitution;
  String? category;
  String? documentName;
  String? remark;
  DateTime? dateOfIssue;
  String? sharedUrlIssue;
  String? disclosureToPatients;
  String? disclosureToOtherMedicalInstitutions;
  String medicalRecordId;

  DomesticMedicalDataRequest({
    this.file,
    this.nameOfMedicalInstitution,
    this.category,
    this.documentName,
    this.remark,
    this.dateOfIssue,
    this.sharedUrlIssue,
    this.disclosureToPatients,
    this.disclosureToOtherMedicalInstitutions,
    required this.medicalRecordId,
  });

  factory DomesticMedicalDataRequest.fromJson(Map<String, dynamic> json) =>
      _$DomesticMedicalDataRequestFromJson(json);
  Map<String, dynamic> toJson() => _$DomesticMedicalDataRequestToJson(this);
}
