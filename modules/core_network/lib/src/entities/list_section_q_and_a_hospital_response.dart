// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'list_section_q_and_a_hospital_response.g.dart';

@JsonSerializable()
class ListSectionQAndAHospitalResponse {
  @JsonKey(name: '_id')
  final String? id;
  final String? classification;
  final String? enterKeyword;
  final String? about;

  ListSectionQAndAHospitalResponse({
    this.id,
    this.classification,
    this.enterKeyword,
    this.about,
  });

  factory ListSectionQAndAHospitalResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListSectionQAndAHospitalResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ListSectionQAndAHospitalResponseToJson(this);
}
