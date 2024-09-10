// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'create_domestic_medical_data_response.g.dart';

@JsonSerializable()
class DomesticMedicalDataResponse {
  @JsonKey(name: '_id')
  final String id;
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

  DomesticMedicalDataResponse({
    required this.id,
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

  factory DomesticMedicalDataResponse.fromJson(Map<String, dynamic> json) =>
      _$DomesticMedicalDataResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DomesticMedicalDataResponseToJson(this);
}
