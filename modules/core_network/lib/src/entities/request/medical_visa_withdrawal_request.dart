import 'package:json_annotation/json_annotation.dart';
part 'medical_visa_withdrawal_request.g.dart';

@JsonSerializable()
class MedicalVisaWithdrawalRequest {
  bool? subjectVisaWithdrawal;
  DateTime? deathOrOccurrenceEventDate;
  String? remarks;

  MedicalVisaWithdrawalRequest({
    this.subjectVisaWithdrawal,
    this.deathOrOccurrenceEventDate,
    this.remarks,
  });

  factory MedicalVisaWithdrawalRequest.fromJson(Map<String, dynamic> json) => _$MedicalVisaWithdrawalRequestFromJson(json);
  Map<String, dynamic> toJson() => _$MedicalVisaWithdrawalRequestToJson(this);

}