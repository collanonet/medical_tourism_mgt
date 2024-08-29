// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'memo_material_hospital_request.g.dart';

@JsonSerializable()
class MemoMaterialHospitalRequest {
  String? memo;
  String hospitalRecord;

  MemoMaterialHospitalRequest({
    this.memo,
    required this.hospitalRecord,
  });

  factory MemoMaterialHospitalRequest.fromJson(Map<String, dynamic> json) =>
      _$MemoMaterialHospitalRequestFromJson(json);

  Map<String, dynamic> toJson() => _$MemoMaterialHospitalRequestToJson(this);
}
