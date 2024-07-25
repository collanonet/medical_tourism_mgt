import 'package:json_annotation/json_annotation.dart';

import '../../../entities.dart';

part 'treatment_menu_request.g.dart';

@JsonSerializable()
class TreatmentMenuRequest {
  String? hospitalId;
  String? project;
  num? treatmentCostExcludingTax;
  num? treatmentCostIncludingTax;
  String? remark;
  List<TaxModel>? includeTax;

  TreatmentMenuRequest({
    this.hospitalId,
    this.project,
    this.treatmentCostExcludingTax,
    this.treatmentCostIncludingTax,
    this.remark,
    this.includeTax,
  });

  factory TreatmentMenuRequest.fromJson(Map<String, dynamic> json) =>
      _$TreatmentMenuRequestFromJson(json);
  Map<String, dynamic> toJson() => _$TreatmentMenuRequestToJson(this);
}
