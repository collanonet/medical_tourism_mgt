import 'package:json_annotation/json_annotation.dart';
part 'sale_head_info_response.g.dart';
@JsonSerializable()
class HeadInfoResponse {
  @JsonKey(name: '_id')
  String id;
  int? medicalExpenseDeposit;
  DateTime? paymentDay;
  int? actualCost;
  DateTime? settlementDay;
  String? actualCostBreakdown;
  int? refundAmount;

  HeadInfoResponse({
    required this.id,
     this.medicalExpenseDeposit,
     this.paymentDay,
     this.actualCost,
     this.settlementDay,
     this.actualCostBreakdown,
     this.refundAmount,
  });

  factory HeadInfoResponse.fromJson(Map<String, dynamic> json) => _$HeadInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HeadInfoResponseToJson(this);

}