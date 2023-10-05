import 'package:json_annotation/json_annotation.dart';

part 'patient.g.dart';

@JsonSerializable()
class Patient {
  @JsonKey(name: '_id')
  final String id;
   DateTime dateOfBirth;
   int age;
   String gender;
   String familyName;
   String? middleName;
   String firstName;
  final DateTime createdAt;
  final DateTime updatedAt;

  Patient({
    required this.id,
    required this.dateOfBirth,
    required this.age,
    required this.gender,
    required this.familyName,
    this.middleName,
    required this.firstName,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return _$PatientFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PatientToJson(this);
}
