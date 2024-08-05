import 'package:json_annotation/json_annotation.dart';

import 'treatment_menu_tax.dart';
part 'treatment_menu_request.g.dart';

@JsonSerializable()
class TreatmentMenuRequest {
  String? hospital;
  String? project;
  double? treatmentCostExcludingTax;
  double? treatmentCostTaxIncluded;
  String? remark;
  List<TaxModel>? treatmentCostTax;

  TreatmentMenuRequest({
    this.hospital,
    this.project,
    this.treatmentCostExcludingTax,
    this.treatmentCostTaxIncluded,
    this.remark,
    this.treatmentCostTax,
  });

  factory TreatmentMenuRequest.fromJson(Map<String, dynamic> json) =>
      _$TreatmentMenuRequestFromJson(json);
  Map<String, dynamic> toJson() => _$TreatmentMenuRequestToJson(this);
}
