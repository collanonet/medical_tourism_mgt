// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'medical_visa_withdrawal_of_visa_other_response.g.dart';

@JsonSerializable()
class MedicalVisaWithdrawalOfVisaOtherResponse {
  @JsonKey(name: '_id')
  final String id;
  final bool? subjectToVisaWithdrawal;
  final DateTime? deathOrOccurrenceEventDate;
  final String? remarks;

  MedicalVisaWithdrawalOfVisaOtherResponse({
    required this.id,
     this.subjectToVisaWithdrawal,
     this.deathOrOccurrenceEventDate,
     this.remarks,
  });

  factory MedicalVisaWithdrawalOfVisaOtherResponse.fromJson(Map<String, dynamic> json) =>
      _$MedicalVisaWithdrawalOfVisaOtherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MedicalVisaWithdrawalOfVisaOtherResponseToJson(this);
}
