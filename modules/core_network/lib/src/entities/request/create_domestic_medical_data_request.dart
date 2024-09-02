// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'create_domestic_medical_data_request.g.dart';

@JsonSerializable()
class DomesticMedicalDataRequest {
  String? file;
  String? medicalInstitutionName;
  String? category;
  String? documentName;
  String? remarks;
  DateTime? dateOfIssue;
  String? url;
  bool? disclosureToPatient;
  bool? disclosureToOtherMedicalInstitutions;
  String? medicalRecord;

  DomesticMedicalDataRequest({
    this.file,
    this.medicalInstitutionName,
    this.category,
    this.documentName,
    this.remarks,
    this.dateOfIssue,
    this.url,
    this.disclosureToPatient,
    this.disclosureToOtherMedicalInstitutions,
     this.medicalRecord,
  });

  factory DomesticMedicalDataRequest.fromJson(Map<String, dynamic> json) =>
      _$DomesticMedicalDataRequestFromJson(json);
  Map<String, dynamic> toJson() => _$DomesticMedicalDataRequestToJson(this);
}
