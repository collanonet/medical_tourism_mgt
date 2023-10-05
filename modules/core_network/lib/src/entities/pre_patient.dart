import 'package:json_annotation/json_annotation.dart';

part 'pre_patient.g.dart';

@JsonSerializable()
class PrePatient {
  @JsonKey(name: '_id')
  final String id;
   String agents;
   String patient;
   DateTime dateOfBirth;
   String gender;
   String nationality;
   String classification;
   String nameOfDisease;
  bool isDeleted;
  final DateTime createdAt;
  final DateTime updatedAt;

  PrePatient({
    required this.id,
    required this.agents,
    required this.patient,
    required this.dateOfBirth,
    required this.gender,
    required this.nationality,
    required this.classification,
    required this.nameOfDisease,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PrePatient.fromJson(Map<String, dynamic> json) {
    return _$PrePatientFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PrePatientToJson(this);
}
