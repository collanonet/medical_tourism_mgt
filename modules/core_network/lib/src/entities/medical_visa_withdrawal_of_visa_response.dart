import 'package:json_annotation/json_annotation.dart';

part 'medical_visa_withdrawal_of_visa_response.g.dart';

@JsonSerializable()
class MedicalVisaWithdrawalOfVisaResponse {
  @JsonKey(name: '_id')
  final String id;
  final bool? subjectToVisaWithdrawal;
  final DateTime? deathOrOccurrenceEventDate;
  final String? remarks;

  MedicalVisaWithdrawalOfVisaResponse({
    required this.id,
     this.subjectToVisaWithdrawal,
     this.deathOrOccurrenceEventDate,
     this.remarks,
  });

  factory MedicalVisaWithdrawalOfVisaResponse.fromJson(Map<String, dynamic> json) =>
      _$MedicalVisaWithdrawalOfVisaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MedicalVisaWithdrawalOfVisaResponseToJson(this);
}