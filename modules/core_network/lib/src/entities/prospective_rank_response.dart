import 'package:json_annotation/json_annotation.dart';
part 'prospective_rank_response.g.dart';
@JsonSerializable()
class ProspectiveRankResponse {
  @JsonKey(name: '_id')
  final String id;
  String? prospectiveRank;

  ProspectiveRankResponse({
    required this.id,
    this.prospectiveRank,
  });


  factory ProspectiveRankResponse.fromJson(Map<String, dynamic> json) => _$ProspectiveRankResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProspectiveRankResponseToJson(this);
}
