import 'package:json_annotation/json_annotation.dart';

import 'getting_visa_info.dart';
import 'necessary_in_japan_schedule.dart';
import 'necessary_in_japan_travel_info.dart';
part 'medical_visa_necessary_in_japan_request.g.dart';

@JsonSerializable()
class MedicalVisaNecessaryInJapanRequest {
  List<GettingVisaInfoRequest>? visaInfo;
  List<ScheduleRequest>? schedule;
  DateTime? statementOfReasonsDate;
  String? statementOfReasonsDateFileName;
  DateTime? travelCompanionListDate;
  String? travelCompanionListFileName;

  MedicalVisaNecessaryInJapanRequest({
    this.visaInfo,
    this.schedule,
    this.statementOfReasonsDate,
    this.travelCompanionListDate,
    this.statementOfReasonsDateFileName,
    this.travelCompanionListFileName,
  });

  factory MedicalVisaNecessaryInJapanRequest.fromJson(
          Map<String, dynamic> json) =>
      _$MedicalVisaNecessaryInJapanRequestFromJson(json);
  Map<String, dynamic> toJson() =>
      _$MedicalVisaNecessaryInJapanRequestToJson(this);
}
