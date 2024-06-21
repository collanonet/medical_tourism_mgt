import 'package:json_annotation/json_annotation.dart';

part 'material_hospital_request.g.dart';

@JsonSerializable()
class MaterialHospitalRequest {
  @JsonKey(name: '_id')
  final String? id;
  final String? memo;

  MaterialHospitalRequest({
    this.id,
    this.memo,
  });

  factory MaterialHospitalRequest.fromJson(Map<String, dynamic> json) =>
      _$MaterialHospitalRequestFromJson(json);

  Map<String, dynamic> toJson() => _$MaterialHospitalRequestToJson(this);
}
