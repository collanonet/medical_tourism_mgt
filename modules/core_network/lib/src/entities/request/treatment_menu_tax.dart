import 'package:json_annotation/json_annotation.dart';
part 'treatment_menu_tax.g.dart';
@JsonSerializable()
class TaxModel {
  num? tax;
  num? taxRate;
  TaxModel({this.tax, this.taxRate});
  
  factory TaxModel.fromJson(Map<String, dynamic> json) => _$TaxModelFromJson(json);
  Map<String, dynamic> toJson() => _$TaxModelToJson(this);
}
