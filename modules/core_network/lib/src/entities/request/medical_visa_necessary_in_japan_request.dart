import 'package:json_annotation/json_annotation.dart';

import 'necessary_in_japan_schedule.dart';
import 'necessary_in_japan_travel_info.dart';
import 'necessary_in_japan_visa_info.dart';
part 'medical_visa_necessary_in_japan_request.g.dart';
@JsonSerializable()
class MedicalVisaNecessaryInJapanRequest {
  List<VisaInfo>? visaInfo;
  List<Schedule>? schedule;
  DateTime? statementOfReasonsDate;
  DateTime? travelCompanionListDate;
  List<TravelInfo>? travelInfo;

  MedicalVisaNecessaryInJapanRequest({
    this.visaInfo,
    this.schedule,
    this.statementOfReasonsDate,
    this.travelCompanionListDate,
    this.travelInfo,
  });

  factory MedicalVisaNecessaryInJapanRequest.fromJson(Map<String, dynamic> json) => _$MedicalVisaNecessaryInJapanRequestFromJson(json);
  Map<String, dynamic> toJson() => _$MedicalVisaNecessaryInJapanRequestToJson(this);
}





