// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'treatment_menu_tax.g.dart';

@JsonSerializable()
class TaxModel {
  @JsonKey(name: '_id')
  String? id;
  double cost;
  int tax;

  TaxModel({
    this.id,
    required this.cost,
    required this.tax,
  });

  factory TaxModel.fromJson(Map<String, dynamic> json) =>
      _$TaxModelFromJson(json);

  Map<String, dynamic> toJson() => _$TaxModelToJson(this);
}
