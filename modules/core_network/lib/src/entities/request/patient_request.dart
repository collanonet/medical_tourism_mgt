import 'package:json_annotation/json_annotation.dart';

part 'patient_request.g.dart';

@JsonSerializable()
class PatientRequest {
   DateTime dateOfBirth;
   int age;
   String gender;
   String familyName;
   String? middleName;
   String firstName;
   String? prePatient;

  PatientRequest({
    required this.dateOfBirth,
    required this.age,
    required this.gender,
    required this.familyName,
    this.middleName,
    required this.firstName,
    this.prePatient,
  });

  factory PatientRequest.fromJson(Map<String, dynamic> json) {
    return _$PatientRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PatientRequestToJson(this);
}
