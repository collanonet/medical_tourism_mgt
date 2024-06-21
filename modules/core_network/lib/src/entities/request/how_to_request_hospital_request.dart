import 'package:json_annotation/json_annotation.dart';

part 'how_to_request_hospital_request.g.dart';

@JsonSerializable()
class HowToRequestHospitalRequest {
  @JsonKey(name: '_id')
  String? id;
  String? hospital;
  DateTime? dateOfUpdate;
  String? updater;
  String? memo;
  String? updates;

  HowToRequestHospitalRequest({
    this.hospital,
    this.id,
    this.dateOfUpdate,
    this.updater,
    this.memo,
    this.updates,
  });

  factory HowToRequestHospitalRequest.fromJson(Map<String, dynamic> json) =>
      _$HowToRequestHospitalRequestFromJson(json);

  Map<String, dynamic> toJson() => _$HowToRequestHospitalRequestToJson(this);
}

extension HowToRequestHospitalRequestExtension on HowToRequestHospitalRequest {
  HowToRequestHospitalRequest copyWith({String? hospital}) {
    return HowToRequestHospitalRequest(
      id: id,
      hospital: hospital ?? this.hospital,
      dateOfUpdate: dateOfUpdate,
      updater: updater,
      memo: memo,
      updates: updates,
    );
  }
}
