// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'schedule.dart';
import 'travel_info.dart';
import 'visa_info.dart';

part 'medical_visa_reuied_in_japan_request.g.dart';

@JsonSerializable()
class RequiredInJapan {
  List<VisaInfoRequest>? visaInfo;
  List<ScheduleRequest>? schedule;
  DateTime? statementOfReasonsDate;
  String? statementOfReasonsFileSelect;
  DateTime? travelCompanionListDate;
  String? travelCompanionListFileSelect;
  List<TravelInfoRequest>? travelInfo;

  RequiredInJapan({
    this.visaInfo,
    this.schedule,
    this.statementOfReasonsDate,
    this.travelCompanionListDate,
    this.travelInfo,
    this.statementOfReasonsFileSelect,
    this.travelCompanionListFileSelect,
  });

  factory RequiredInJapan.fromJson(Map<String, dynamic> json) => _$RequiredInJapanFromJson(json);
  Map<String, dynamic> toJson() => _$RequiredInJapanToJson(this);

}
