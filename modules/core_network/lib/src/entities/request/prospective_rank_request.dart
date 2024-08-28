// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'prospective_rank_request.g.dart';
@JsonSerializable()
class ProspectiveRankRequest {
  String? prospectiveRank;

  ProspectiveRankRequest({
    this.prospectiveRank,
  });

  factory ProspectiveRankRequest.fromJson(Map<String, dynamic> json) => _$ProspectiveRankRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ProspectiveRankRequestToJson(this);
}
