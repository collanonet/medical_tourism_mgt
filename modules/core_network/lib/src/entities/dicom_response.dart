// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'dicom_response.g.dart';

@JsonSerializable()
class DicomResponse {
  @JsonKey(name: 'ID')
  final String id;
  @JsonKey(name: 'ParentPatient')
  final String parentPatient;
  @JsonKey(name: 'ParentSeries')
  final String parentSeries;
  @JsonKey(name: 'ParentStudy')
  final String parentStudy;
  @JsonKey(name: 'Path')
  final String path;
  @JsonKey(name: 'Status')
  final String status;

  DicomResponse({
    required this.id,
    required this.parentPatient,
    required this.parentSeries,
    required this.parentStudy,
    required this.path,
    required this.status,
  });

  factory DicomResponse.fromJson(Map<String, dynamic> json) =>
      _$DicomResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DicomResponseToJson(this);
}
