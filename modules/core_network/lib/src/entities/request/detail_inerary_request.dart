import 'package:json_annotation/json_annotation.dart';
import 'detail_inerary_day.dart';
part 'detail_inerary_request.g.dart';

@JsonSerializable()
class DetailIneraryRequest {
  List<String>? patient;
  String? tourName;
  String? peopleNumber;
  String? group;
  String? classification;
  List<Day>? day;

  DetailIneraryRequest({
    this.patient,
    this.tourName,
    this.peopleNumber,
    this.group,
    this.classification,
    this.day,
  });

  factory DetailIneraryRequest.fromJson(Map<String, dynamic> json) => _$DetailIneraryRequestFromJson(json);
  Map<String, dynamic> toJson() => _$DetailIneraryRequestToJson(this);
}
