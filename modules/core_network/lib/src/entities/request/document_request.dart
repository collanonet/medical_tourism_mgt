// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'document_request.g.dart';
@JsonSerializable()
class DocumentRequest{
  String? uploadFile;
 String? documentName;
  DateTime? updatedOn;
  String? translationLanguage;
  String? translator;
  String hospitalRecord;

  DocumentRequest({
    this.uploadFile,
    this.documentName,
    this.updatedOn,
    this.translationLanguage,
    this.translator,
    required this.hospitalRecord,
  });
  factory DocumentRequest.fromJson(Map<String, dynamic> json) => _$DocumentRequestFromJson(json);
  Map<String, dynamic> toJson() => _$DocumentRequestToJson(this);
}
