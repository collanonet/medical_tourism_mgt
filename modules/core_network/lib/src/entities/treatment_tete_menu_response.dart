import 'package:json_annotation/json_annotation.dart';
part 'treatment_tete_menu_response.g.dart';
@JsonSerializable()
class TreatmentTeleMenuResponse {
  @JsonKey(name: '_id')
  String id;
  String? project;
  num? treatingCostExcludingTax;
  num? treatingCostIncludingTax;
  String? remarks;
  String? hospitalId;

  TreatmentTeleMenuResponse({
    required this.id,
    this.project,
    this.treatingCostExcludingTax,
    this.treatingCostIncludingTax,
    this.remarks,
    this.hospitalId,
  });
  
  factory TreatmentTeleMenuResponse.fromJson(Map<String, dynamic> json) => _$TreatmentTeleMenuResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TreatmentTeleMenuResponseToJson(this);
  
}