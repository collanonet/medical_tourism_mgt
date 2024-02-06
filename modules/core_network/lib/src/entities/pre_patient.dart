import 'package:json_annotation/json_annotation.dart';
import 'package:reactive_forms/reactive_forms.dart';
part 'pre_patient.g.dart';

@JsonSerializable()
class PrePatient {
  @JsonKey(name: '_id')
  final String id;
  String? agents;
  String? patient;
  DateTime? dateOfBirth;
  bool gender;
  String? nationality;
  String? classification;
  String? nameOfDisease;
  bool isDeleted;
  final DateTime createdAt;
  final DateTime updatedAt;

  PrePatient({
    required this.id,
    this.agents,
    this.patient,
    this.dateOfBirth,
    required this.gender,
    this.nationality,
    this.classification,
    this.nameOfDisease,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PrePatient.fromJson(Map<String, dynamic> json) {
    return _$PrePatientFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PrePatientToJson(this);
}
