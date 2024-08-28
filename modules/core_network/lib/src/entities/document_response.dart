// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'document_response.g.dart';
@JsonSerializable()
class DocumentResponse{
  @JsonKey(name: '_id')
  String id;
  String? uploadFile;
 String? documentName;
  DateTime? updatedOn;
  String? translationLanguage;
  String? translator;

  DocumentResponse({
    required this.id,
    this.uploadFile,
    this.documentName,
    this.updatedOn,
    this.translationLanguage,
    this.translator,
  });

  factory DocumentResponse.fromJson(Map<String, dynamic> json) => _$DocumentResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DocumentResponseToJson(this);
}
