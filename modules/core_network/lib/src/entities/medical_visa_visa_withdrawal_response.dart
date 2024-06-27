import 'package:json_annotation/json_annotation.dart';

part 'medical_visa_visa_withdrawal_response.g.dart';

@JsonSerializable()
class MedicalVisaVisaWithdrawalResponse {
  @JsonKey(name: '_id')
  final String id;
  final String? subjectVisaWithdrawal;
  final DateTime? deathOrOccurrenceEventDate;
  final String? remarks;

  MedicalVisaVisaWithdrawalResponse({
    required this.id,
     this.subjectVisaWithdrawal,
     this.deathOrOccurrenceEventDate,
     this.remarks,
  });

  factory MedicalVisaVisaWithdrawalResponse.fromJson(Map<String, dynamic> json) =>
      _$MedicalVisaVisaWithdrawalResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MedicalVisaVisaWithdrawalResponseToJson(this);
}