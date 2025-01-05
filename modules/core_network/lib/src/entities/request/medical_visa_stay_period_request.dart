// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'medical_visa_stay_period_request.g.dart';

@JsonSerializable()
class MedicalVisaStayPeriodRequest {
  DateTime? stayStartingDatePersonalReference;
  DateTime? stayEndDate;

  MedicalVisaStayPeriodRequest({
    this.stayStartingDatePersonalReference,
    this.stayEndDate,
  });

  factory MedicalVisaStayPeriodRequest.fromJson(Map<String, dynamic> json) => _$MedicalVisaStayPeriodRequestFromJson(json);
  Map<String, dynamic> toJson() => _$MedicalVisaStayPeriodRequestToJson(this);

}
