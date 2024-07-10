import 'package:json_annotation/json_annotation.dart';
part 'document_request.g.dart';
@JsonSerializable()
class DocumentRequest{
  String? uploadFile;
 String? documentName;
  DateTime? updatedOn;
  String? translationLanguage;
  String? translator;

  DocumentRequest({
    this.uploadFile,
    this.documentName,
    this.updatedOn,
    this.translationLanguage,
    this.translator,
  });
  factory DocumentRequest.fromJson(Map<String, dynamic> json) => _$DocumentRequestFromJson(json);
  Map<String, dynamic> toJson() => _$DocumentRequestToJson(this);
}