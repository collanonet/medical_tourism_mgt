// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'medical_record_file_summary_request.g.dart';

@JsonSerializable()
class MedicalRecordFileSummaryRequest {
  final String? pathFile;
  final String? documentName;
  final DateTime? publicationDate;
  final String? share;
  final String? disclosureToAgent;
  String recordSummary;
  String medicalRecord;

  MedicalRecordFileSummaryRequest({
    this.pathFile,
    this.documentName,
    this.publicationDate,
    this.share,
    this.disclosureToAgent,
    required this.recordSummary,
    required this.medicalRecord,
  });

  factory MedicalRecordFileSummaryRequest.fromJson(Map<String, dynamic> json) {
    return _$MedicalRecordFileSummaryRequestFromJson(json);
  }

  Map<String, dynamic> toJson() =>
      _$MedicalRecordFileSummaryRequestToJson(this);
}
