import 'package:json_annotation/json_annotation.dart';
part 'summary_list_response.g.dart';
@JsonSerializable()
class SummaryListResponse{
   @JsonKey(name: '_id')
  String id;
  String? documentName;
  DateTime? dateOfIssue;
  String? share;
  bool? disclosureToAgent;
  SummaryListResponse({
  required this.id,
    this.documentName,
    this.dateOfIssue,
    this.share,
    this.disclosureToAgent,
  });

  factory SummaryListResponse.fromJson(Map<String, dynamic> json) => _$SummaryListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SummaryListResponseToJson(this);
}