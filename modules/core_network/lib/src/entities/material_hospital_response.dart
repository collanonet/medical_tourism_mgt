import 'package:json_annotation/json_annotation.dart';

part 'material_hospital_response.g.dart';

@JsonSerializable()
class MaterialHospitalResponse {
  @JsonKey(name: '_id')
  final String? id;
  final String? memo;

  MaterialHospitalResponse({
    this.id,
    this.memo,
  });

  factory MaterialHospitalResponse.fromJson(Map<String, dynamic> json) =>
      _$MaterialHospitalResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MaterialHospitalResponseToJson(this);
}
