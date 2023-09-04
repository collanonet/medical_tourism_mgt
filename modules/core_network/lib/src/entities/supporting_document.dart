import 'package:json_annotation/json_annotation.dart';

part 'supporting_document.g.dart';

@JsonSerializable()
class SupportingDocument {
  String name;
  String data;

  SupportingDocument({
    required this.name,
    required this.data,
  });

  factory SupportingDocument.fromJson(Map<String, dynamic> json) =>
      _$SupportingDocumentFromJson(json);

  Map<String, dynamic> toJson() => _$SupportingDocumentToJson(this);
}
