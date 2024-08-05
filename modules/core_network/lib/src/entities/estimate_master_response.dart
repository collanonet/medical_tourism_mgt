import 'package:json_annotation/json_annotation.dart';
part 'estimate_master_response.g.dart';
@JsonSerializable()
class EstimateMasterResponse {
  @JsonKey(name: '_id')
  String id;
  String? item;
  String? sellUnitPrice;
  String? sellAmountOfMoney;
  String? costUnitPrice;
  String? costAmountOfMoney;

  EstimateMasterResponse({
    required this.id,
    this.item,
    this.sellUnitPrice,
    this.sellAmountOfMoney,
    this.costUnitPrice,
    this.costAmountOfMoney,
  });

  factory EstimateMasterResponse.fromJson(Map<String, dynamic> json) => _$EstimateMasterResponseFromJson(json);
  Map<String, dynamic> toJson() => _$EstimateMasterResponseToJson(this);
}