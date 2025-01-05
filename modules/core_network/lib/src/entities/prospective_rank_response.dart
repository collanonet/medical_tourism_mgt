// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'prospective_rank_response.g.dart';
@JsonSerializable()
class ProspectiveRankResponse {
  @JsonKey(name: '_id')
  final String id;
  String? prospectRank;
  bool? shouldItBeIncludedInSalesManagementEstimates;

  ProspectiveRankResponse({
    required this.id,
    this.prospectRank,
    this.shouldItBeIncludedInSalesManagementEstimates,
  });


  factory ProspectiveRankResponse.fromJson(Map<String, dynamic> json) => _$ProspectiveRankResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProspectiveRankResponseToJson(this);
}
