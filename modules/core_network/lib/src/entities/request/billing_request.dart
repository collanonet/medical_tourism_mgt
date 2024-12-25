import 'package:json_annotation/json_annotation.dart';
part 'billing_request.g.dart';

@JsonSerializable()
class BillingRequest {
  double? deposit;
  double? settlementFee;
  double? balance;
  List<TreatmentCostRequest>? treatmentCost;
  String? remarks;
  String? medicalRecord;

  BillingRequest({
    this.deposit,
    this.settlementFee,
    this.balance,
    this.treatmentCost,
    this.remarks,
    this.medicalRecord,
  });

  factory BillingRequest.fromJson(Map<String, dynamic> json) => _$BillingRequestFromJson(json);
  Map<String, dynamic> toJson() => _$BillingRequestToJson(this);

}

@JsonSerializable()
class TreatmentCostRequest {
  DateTime? occurrenceDate;
  String? hospitalName;
  String? treatmentDetails;
  String? amount;
  String? remainingAmount;
  String? file;

  TreatmentCostRequest({
    this.occurrenceDate,
    this.hospitalName,
    this.treatmentDetails,
    this.amount,
    this.remainingAmount,
    this.file,
  });

  factory TreatmentCostRequest.fromJson(Map<String, dynamic> json) => _$TreatmentCostRequestFromJson(json);
  Map<String, dynamic> toJson() => _$TreatmentCostRequestToJson(this);
}