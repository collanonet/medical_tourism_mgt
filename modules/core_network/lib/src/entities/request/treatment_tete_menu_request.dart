import 'package:json_annotation/json_annotation.dart';
part 'treatment_tete_menu_request.g.dart';
@JsonSerializable()
class TreatmentTeleMenuRequest {
  String? project;
  num? treatingCostExcludingTax;
  num? treatingCostIncludingTax;
  String? remarks;
  String? hospitalId;

  TreatmentTeleMenuRequest({
    this.project,
    this.treatingCostExcludingTax,
    this.treatingCostIncludingTax,
    this.remarks,
    this.hospitalId,
  });
  factory TreatmentTeleMenuRequest.fromJson(Map<String,dynamic> json){
    return _$TreatmentTeleMenuRequestFromJson(json);
  }
  
  Map<String, dynamic> toJson() => _$TreatmentTeleMenuRequestToJson(this);
}