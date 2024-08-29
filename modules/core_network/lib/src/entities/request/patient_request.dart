// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'patient_request.g.dart';

@JsonSerializable()
class PatientRequest {
  DateTime? dateOfBirth;
  int? age;
  bool? gender;
  String? familyName;
  String? middleName;
  String? firstName;
  String? prePatient;

  PatientRequest({
    this.dateOfBirth,
    this.age,
    this.gender,
    this.familyName,
    this.middleName,
    this.firstName,
    this.prePatient,
  });

  factory PatientRequest.fromJson(Map<String, dynamic> json) {
    return _$PatientRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PatientRequestToJson(this);
}
