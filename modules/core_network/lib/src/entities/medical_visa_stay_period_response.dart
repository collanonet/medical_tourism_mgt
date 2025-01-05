// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'medical_visa_stay_period_response.g.dart';

@JsonSerializable()
class MedicalVisaStayPeriodResponse {
  @JsonKey(name: '_id')
  final String? id;
  DateTime? stayStartingDatePersonalReference;
  DateTime? stayEndDate;

  MedicalVisaStayPeriodResponse({
    this.id,
    this.stayStartingDatePersonalReference,
    this.stayEndDate,
  });

  factory MedicalVisaStayPeriodResponse.fromJson(Map<String, dynamic> json) =>
      _$MedicalVisaStayPeriodResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MedicalVisaStayPeriodResponseToJson(this);
}
