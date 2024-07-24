
import 'package:json_annotation/json_annotation.dart';
part 'treatment_menu_response.g.dart';

@JsonSerializable()
class TreatmentMenuResponse {
  @JsonKey(name: '_id')
  String id;
  String? hospitalId;
  String? project;
  num? treatingCostExcludingTax;
  num? treatingCostIncludingTax;
  String? preparationForExams;
  List<TaxModel>? includeTax;

  TreatmentMenuResponse({
    required this.id,
    this.hospitalId,
    this.project,
    this.treatingCostExcludingTax,
    this.treatingCostIncludingTax,
    this.preparationForExams,
    this.includeTax,
  });

  factory TreatmentMenuResponse.fromJson(Map<String, dynamic> json) => _$TreatmentMenuResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TreatmentMenuResponseToJson(this);
}

@JsonSerializable()
class TaxModel {
  num? tax;
  num? taxRate;
  TaxModel({this.tax, this.taxRate});

  factory TaxModel.fromJson(Map<String, dynamic> json) => _$TaxModelFromJson(json);
  Map<String, dynamic> toJson() => _$TaxModelToJson(this);
}
