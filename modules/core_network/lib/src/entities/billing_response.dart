import 'package:json_annotation/json_annotation.dart';

part 'billing_response.g.dart';

@JsonSerializable()
class BillingResponse {
  double? deposit;
  double? settlementFee;
  double? balance;
  List<TreatmentCostResponse>? treatmentCost;
  String? remarks;
  String? medicalRecord;

  BillingResponse({
    this.deposit,
    this.settlementFee,
    this.balance,
    this.treatmentCost,
    this.remarks,
    this.medicalRecord,
  });

  factory BillingResponse.fromJson(Map<String, dynamic> json) =>
      _$BillingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BillingResponseToJson(this);
}

@JsonSerializable()
class TreatmentCostResponse {
  DateTime? occurrenceDate;
  String? hospitalName;
  String? treatmentDetails;
  String? amount;
  String? remainingAmount;
  String? file;

  TreatmentCostResponse({
    this.occurrenceDate,
    this.hospitalName,
    this.treatmentDetails,
    this.amount,
    this.remainingAmount,
    this.file,
  });

  factory TreatmentCostResponse.fromJson(Map<String, dynamic> json) =>
      _$TreatmentCostResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TreatmentCostResponseToJson(this);
}
