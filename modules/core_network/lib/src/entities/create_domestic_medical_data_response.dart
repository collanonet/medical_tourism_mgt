import 'package:json_annotation/json_annotation.dart';
part 'create_domestic_medical_data_response.g.dart';

@JsonSerializable()
class DomesticMedicalDataResponse {
  @JsonKey(name: '_id')
  final String id;
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

  DomesticMedicalDataResponse({
    required this.id,
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

  factory DomesticMedicalDataResponse.fromJson(Map<String, dynamic> json) =>
      _$DomesticMedicalDataResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DomesticMedicalDataResponseToJson(this);
}
