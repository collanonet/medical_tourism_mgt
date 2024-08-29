// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'search_qa_request.g.dart';
@JsonSerializable()
class SearchQARequest {
  String? classification;
  String? enterKeyword;

  SearchQARequest({
    this.classification,
    this.enterKeyword,
  });


  factory SearchQARequest.fromJson(Map<String, dynamic> json) => _$SearchQARequestFromJson(json);
  Map<String, dynamic> toJson() => _$SearchQARequestToJson(this);
}
