// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import '../../../core_network.dart';

part 'medical_record_oversea_data_request.g.dart';

@JsonSerializable()
class MedicalRecordOverseaDataRequest {
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

  MedicalRecordOverseaDataRequest({
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
  });

  factory MedicalRecordOverseaDataRequest.fromJson(Map<String, dynamic> json) {
    return _$MedicalRecordOverseaDataRequestFromJson(json);
  }

  Map<String, dynamic> toJson() =>
      _$MedicalRecordOverseaDataRequestToJson(this);
}
