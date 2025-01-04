// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import '../../entities.dart';

part 'treatment_menu_response.g.dart';

@JsonSerializable()
class TreatmentMenuResponse {
  @JsonKey(name: '_id')
  String id;
  String? hospital;
  String? project;
  double? treatmentCostExcludingTax;
  double? treatmentCostTaxIncluded;
  String? remark;
  List<TaxModel>? treatmentCostTax;

  TreatmentMenuResponse({
    required this.id,
    this.hospital,
    this.project,
    this.treatmentCostExcludingTax,
    this.treatmentCostTaxIncluded,
    this.remark,
    this.treatmentCostTax,
  });

  factory TreatmentMenuResponse.fromJson(Map<String, dynamic> json) =>
      _$TreatmentMenuResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TreatmentMenuResponseToJson(this);
}

