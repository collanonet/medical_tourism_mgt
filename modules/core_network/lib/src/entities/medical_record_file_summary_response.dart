// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'medical_record_file_summary_response.g.dart';

@JsonSerializable()
class MedicalRecordFileSummaryResponse {
  @JsonKey(name: '_id')
  final String id;
  final String? pathFile;
  final String? documentName;
  final DateTime? publicationDate;
  final String? share;
  final String? disclosureToAgent;
  String recordSummary;
  String medicalRecord;
  final DateTime createdAt;
  final DateTime updatedAt;

  MedicalRecordFileSummaryResponse({
    required this.id,
    this.pathFile,
    this.documentName,
    this.publicationDate,
    this.share,
    this.disclosureToAgent,
    required this.recordSummary,
    required this.medicalRecord,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MedicalRecordFileSummaryResponse.fromJson(Map<String, dynamic> json) {
    return _$MedicalRecordFileSummaryResponseFromJson(json);
  }

  Map<String, dynamic> toJson() =>
      _$MedicalRecordFileSummaryResponseToJson(this);
}
