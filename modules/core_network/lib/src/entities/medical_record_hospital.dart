// Package imports:
import 'package:json_annotation/json_annotation.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'medical_record_hospital.g.dart';

@JsonSerializable()
class MedicalRecordHospital {
  @JsonKey(name: '_id')
  final String id;
  String? hospitalName;
  String? hospitalId;
  String? medicalCardNumber;
  String? medicalRecord;
  final DateTime createdAt;
  final DateTime updatedAt;

  MedicalRecordHospital({
    required this.id,
    this.hospitalName,
    this.hospitalId,
    this.medicalCardNumber,
    this.medicalRecord,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MedicalRecordHospital.fromJson(Map<String, dynamic> json) {
    return _$MedicalRecordHospitalFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicalRecordHospitalToJson(this);
}
