import 'package:json_annotation/json_annotation.dart';

import 'medical_visa_required_in_japan_response.dart';
part 'medical_visa_necessary_in_japan_response.g.dart';
@JsonSerializable()
class MedicalVisaNecessaryInJapanResponse {
  List<VisaInfo>? visaInfo;
  List<Schedule>? schedule;
  DateTime? statementOfReasonsDate;
  DateTime? travelCompanionListDate;
  List<TravelInfo>? travelInfo;

  MedicalVisaNecessaryInJapanResponse({
    this.visaInfo,
    this.schedule,
    this.statementOfReasonsDate,
    this.travelCompanionListDate,
    this.travelInfo,
  });

  factory MedicalVisaNecessaryInJapanResponse.fromJson(Map<String, dynamic> json) => _$MedicalVisaNecessaryInJapanResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MedicalVisaNecessaryInJapanResponseToJson(this);
}