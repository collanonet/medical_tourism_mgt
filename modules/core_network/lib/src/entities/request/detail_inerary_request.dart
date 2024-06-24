
import 'package:json_annotation/json_annotation.dart';

import '../../../core_network.dart';
import 'detail_inerary_day.dart';
part 'detail_inerary_request.g.dart';
@JsonSerializable()
class DetailIneraryRequest{
  List<PatientName>? patientName;
  String? tourName;
  String? numberOfPeople;
  String? group;
  String? type;
  List<DayList>? listday;

  DetailIneraryRequest({
    this.patientName,
    this.tourName,
    this.numberOfPeople,
    this.group,
    this.type,
    this.listday,
  });
}