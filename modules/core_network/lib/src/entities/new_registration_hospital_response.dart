import 'package:json_annotation/json_annotation.dart';

part 'new_registration_hospital_response.g.dart';

@JsonSerializable()
class NewRegistrationHospitalResponse {
  @JsonKey(name: '_id')
  final String? id;
  final DateTime? updatedDate;
  final String? updatedBy;
  final String? classification;
  final bool? shareThisQADataWithHospitals;
  final String? question;
  final String? answer;
  final String? hospital;

  NewRegistrationHospitalResponse({
    this.id,
    this.updatedDate,
    this.updatedBy,
    this.classification,
    this.shareThisQADataWithHospitals,
    this.question,
    this.answer,
    this.hospital,
  });

  factory NewRegistrationHospitalResponse.fromJson(Map<String, dynamic> json) =>
      _$NewRegistrationHospitalResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$NewRegistrationHospitalResponseToJson(this);
}
