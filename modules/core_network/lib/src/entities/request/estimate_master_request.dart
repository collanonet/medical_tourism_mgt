// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'estimate_master_request.g.dart';
@JsonSerializable()
class EstimateMasterRequest {
  String? item;
  String? sellUnitPrice;
  String? sellAmountOfMoney;
  String? costUnitPrice;
  String? costAmountOfMoney;

  EstimateMasterRequest({
    this.item,
    this.sellUnitPrice,
    this.sellAmountOfMoney,
    this.costUnitPrice,
    this.costAmountOfMoney,
  });

  factory EstimateMasterRequest.fromJson(Map<String, dynamic> json) => _$EstimateMasterRequestFromJson(json);
  Map<String, dynamic> toJson() => _$EstimateMasterRequestToJson(this);
}
