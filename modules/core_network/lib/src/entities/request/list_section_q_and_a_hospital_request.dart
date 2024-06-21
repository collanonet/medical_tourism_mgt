import 'package:json_annotation/json_annotation.dart';

part 'list_section_q_and_a_hospital_request.g.dart';

@JsonSerializable()
class ListSectionQAndAHospitalRequest {
  @JsonKey(name: '_id')
  final String? id;
  final String? classification;
  final String? enterKeyword;
  final String? about;

  ListSectionQAndAHospitalRequest({
    this.id,
    this.classification,
    this.enterKeyword,
    this.about,
  });

  factory ListSectionQAndAHospitalRequest.fromJson(Map<String, dynamic> json) =>
      _$ListSectionQAndAHospitalRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ListSectionQAndAHospitalRequestToJson(this);
}
