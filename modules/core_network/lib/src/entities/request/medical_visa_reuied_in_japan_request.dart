import 'package:json_annotation/json_annotation.dart';

import 'schedule.dart';
import 'travel_info.dart';
import 'visa_info.dart';
part 'medical_visa_reuied_in_japan_request.g.dart';

@JsonSerializable()
class RequiredInJapan {
  List<VisaInfo>? visaInfo;
  List<Schedule>? schedule;
  DateTime? statementOfReasonsDate;
  DateTime? travelCompanionListDate;
  List<TravelInfo>? travelInfo;

  RequiredInJapan({
    this.visaInfo,
    this.schedule,
    this.statementOfReasonsDate,
    this.travelCompanionListDate,
    this.travelInfo,
  });

  factory RequiredInJapan.fromJson(Map<String, dynamic> json) => _$RequiredInJapanFromJson(json);
  Map<String, dynamic> toJson() => _$RequiredInJapanToJson(this);

}
