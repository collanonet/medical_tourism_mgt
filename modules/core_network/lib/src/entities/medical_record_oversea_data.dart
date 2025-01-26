// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import '../../core_network.dart';

part 'medical_record_oversea_data.g.dart';

@JsonSerializable()
class MedicalRecordOverseaData {
  @JsonKey(name: '_id')
  final String id;
  List<DicomDetailResponse>? file;
  List<CommentDicomFile>? commentDicomFile;
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
    this.commentDicomFile,
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

@JsonSerializable()
class CommentDicomFile {
  final String? role;
  final String? comment;

  CommentDicomFile({
    this.role,
    this.comment,
  });

  factory CommentDicomFile.fromJson(Map<String, dynamic> json) {
    return _$CommentDicomFileFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CommentDicomFileToJson(this);
}
