import 'package:json_annotation/json_annotation.dart';
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

@JsonSerializable()
class TaxModel {
  // cost
  @JsonKey(name: 'cost')
  double? tax;
  // tax
  @JsonKey(name: 'tax')
  int? taxRate;
  TaxModel({this.tax, this.taxRate});

  factory TaxModel.fromJson(Map<String, dynamic> json) =>
      _$TaxModelFromJson(json);
  Map<String, dynamic> toJson() => _$TaxModelToJson(this);
}
