// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'how_to_request_hospital_response.g.dart';

@JsonSerializable()
class HowToRequestHospitalResponse {
  @JsonKey(name: '_id')
  String id;
  String? hospital;
  DateTime? dateOfUpdate;
  String? updater;
  String? memo;
  String? updates;

  HowToRequestHospitalResponse({
    required this.id,
    this.hospital,
    this.dateOfUpdate,
    this.updater,
    this.memo,
    this.updates,
  });

  factory HowToRequestHospitalResponse.fromJson(Map<String, dynamic> json) =>
      _$HowToRequestHospitalResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HowToRequestHospitalResponseToJson(this);
}
