// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'memo_material_hospital_response.g.dart';

@JsonSerializable()
class MemoMaterialHospitalResponse {
  @JsonKey(name: '_id')
  final String? id;
  String? memo;

  MemoMaterialHospitalResponse({
    this.id,
    this.memo,
  });

  factory MemoMaterialHospitalResponse.fromJson(Map<String, dynamic> json) =>
      _$MemoMaterialHospitalResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MemoMaterialHospitalResponseToJson(this);
}
