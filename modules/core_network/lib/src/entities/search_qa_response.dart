// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'search_qa_response.g.dart';
@JsonSerializable()
class SearchQAResponse {
   @JsonKey(name: '_id')
  String id;
  String? classification;
  String? enterKeyword;

  SearchQAResponse({
    required this.id,
    this.classification,
    this.enterKeyword,
  });

  factory SearchQAResponse.fromJson(Map<String, dynamic> json) => _$SearchQAResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SearchQAResponseToJson(this);
}
