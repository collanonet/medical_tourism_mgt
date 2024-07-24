
import 'package:json_annotation/json_annotation.dart';

import '../../../entities.dart';

part 'treatment_menu_request.g.dart';
@JsonSerializable()
class TreatmentMenuRequest {
  String? hospitalId;
  String? project;
  num? treatingCostExcludingTax;
  num? treatingCostIncludingTax;
  String? preparationForExams;
  List<TaxModel>? includeTax;

  TreatmentMenuRequest({
    this.hospitalId,
    this.project,
    this.treatingCostExcludingTax,
    this.treatingCostIncludingTax,
    this.preparationForExams,
    this.includeTax,
  });

  factory TreatmentMenuRequest.fromJson(Map<String, dynamic> json) => _$TreatmentMenuRequestFromJson(json);
  Map<String, dynamic> toJson() => _$TreatmentMenuRequestToJson(this);
}

