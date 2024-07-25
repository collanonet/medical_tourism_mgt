import 'package:json_annotation/json_annotation.dart';
part 'treatment_tete_menu_request.g.dart';

@JsonSerializable()
class TreatmentTeleMenuRequest {
  String? project;
  num? treatmentCostExcludingTax;
  num? treatmentCostTaxIncluded;
  String? remark;
  String? hospital;

  TreatmentTeleMenuRequest({
    this.project,
    this.treatmentCostExcludingTax,
    this.treatmentCostTaxIncluded,
    this.remark,
    this.hospital,
  });
  factory TreatmentTeleMenuRequest.fromJson(Map<String, dynamic> json) {
    return _$TreatmentTeleMenuRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TreatmentTeleMenuRequestToJson(this);
}
