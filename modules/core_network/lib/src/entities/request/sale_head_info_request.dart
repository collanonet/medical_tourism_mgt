// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'sale_head_info_request.g.dart';
@JsonSerializable()
class HeadInfoRequest {
  int? medicalExpenseDeposit;
  DateTime? paymentDay;
  int? actualCost;
  DateTime? settlementDay;
  String? actualCostBreakdown;
  int? refundAmount;

  HeadInfoRequest({
     this.medicalExpenseDeposit,
     this.paymentDay,
     this.actualCost,
     this.settlementDay,
     this.actualCostBreakdown,
     this.refundAmount,
  });

  factory HeadInfoRequest.fromJson(Map<String, dynamic> json) => _$HeadInfoRequestFromJson(json);

  Map<String, dynamic> toJson() => _$HeadInfoRequestToJson(this);

}
