// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'medical_record_oversea_data.g.dart';

@JsonSerializable()
class MedicalRecordOverseaData {
  @JsonKey(name: '_id')
  final String id;
  String? file;
  String? hospitalName;
  String? category;
  String? documentName;
  String? sharedUrl;
  String? password;
  String? qrCode;
  String? commentHospital1;
  String? commentOurCompany;
  String? commentHospital2;
  DateTime? expirationDate;
  DateTime? issueDate;
  String medicalRecord;
  final DateTime createdAt;
  final DateTime updatedAt;

  MedicalRecordOverseaData({
    required this.id,
    this.file,
    this.hospitalName,
    this.category,
    this.documentName,
    this.issueDate,
    this.sharedUrl,
    this.password,
    this.qrCode,
    this.commentHospital1,
    this.commentOurCompany,
    this.commentHospital2,
    this.expirationDate,
    required this.medicalRecord,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MedicalRecordOverseaData.fromJson(Map<String, dynamic> json) {
    return _$MedicalRecordOverseaDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicalRecordOverseaDataToJson(this);
}
