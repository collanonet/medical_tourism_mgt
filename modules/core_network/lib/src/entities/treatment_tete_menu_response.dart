// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'treatment_tete_menu_response.g.dart';

@JsonSerializable()
class TreatmentTeleMenuResponse {
  @JsonKey(name: '_id')
  String id;
  String? project;
  num? treatmentCostExcludingTax;
  num? treatmentCostTaxIncluded;
  String? remark;
  String? hospital;

  TreatmentTeleMenuResponse({
    required this.id,
    this.project,
    this.treatmentCostExcludingTax,
    this.treatmentCostTaxIncluded,
    this.remark,
    this.hospital,
  });

  factory TreatmentTeleMenuResponse.fromJson(Map<String, dynamic> json) =>
      _$TreatmentTeleMenuResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TreatmentTeleMenuResponseToJson(this);
}
