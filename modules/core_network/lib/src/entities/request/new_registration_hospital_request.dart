// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'new_registration_hospital_request.g.dart';

@JsonSerializable()
class NewRegistrationHospitalRequest {
  final String hospital;
  final DateTime? updatedDate;
  final String? updatedBy;
  final String? classification;
  final bool? shareThisQADataWithHospitals;
  final String? question;
  final String? answer;

  NewRegistrationHospitalRequest({
    required this.hospital,
    this.updatedDate,
    this.updatedBy,
    this.classification,
    this.shareThisQADataWithHospitals,
    this.question,
    this.answer,
  });

  factory NewRegistrationHospitalRequest.fromJson(Map<String, dynamic> json) {
    return _$NewRegistrationHospitalRequestFromJson(json);
  }
  Map<String, dynamic> toJson() => _$NewRegistrationHospitalRequestToJson(this);
}
