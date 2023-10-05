import 'package:json_annotation/json_annotation.dart';

part 'patient_name.g.dart';

@JsonSerializable()
class PatientName {
  @JsonKey(name: '_id')
  final String id;
   String familyName;
   String middleName;
   String firstName;
   String nameType;
   String patient;
  final DateTime createdAt;
  final DateTime updatedAt;

  PatientName({
    required this.id,
    required this.familyName,
    required this.middleName,
    required this.firstName,
    required this.nameType,
    required this.patient,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PatientName.fromJson(Map<String, dynamic> json) {
    return _$PatientNameFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PatientNameToJson(this);
}