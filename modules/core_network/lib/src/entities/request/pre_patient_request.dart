// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'pre_patient_request.g.dart';

@JsonSerializable()
class PrePatientRequest {
  String? agents;
  String? patient;
  DateTime? dateOfBirth;
  bool? gender;
  String? nationality;
  String? classification;
  String? nameOfDisease;
  bool? isDeleted;

  PrePatientRequest({
     this.agents,
     this.patient,
     this.dateOfBirth,
     this.gender,
     this.nationality,
     this.classification,
     this.nameOfDisease,
     this.isDeleted,
  });

  factory PrePatientRequest.fromJson(Map<String, dynamic> json) {
    return _$PrePatientRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PrePatientRequestToJson(this);
}
