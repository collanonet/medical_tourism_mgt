// Package imports:
import 'package:json_annotation/json_annotation.dart';

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
  DateTime? deletedAt;
  int? isDelete;
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
    this.deletedAt,
    required this.isDelete,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PrePatient.fromJson(Map<String, dynamic> json) {
    return _$PrePatientFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PrePatientToJson(this);
}
