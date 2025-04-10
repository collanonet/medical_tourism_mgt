// Package imports:
import 'package:json_annotation/json_annotation.dart';

import '../../../entities.dart';

// Project imports:

part 'detail_inerary_request.g.dart';

@JsonSerializable()
class DetailIneraryRequest {
  List<String>? patient;
  List<PatientTour>? patients;
  String? tourName;
  int? peopleNumber;
  int? group;
  String? classification;
  List<dynamic>? day;

  DetailIneraryRequest({
    this.patient,
    this.patients,
    this.tourName,
    this.peopleNumber,
    this.group,
    this.classification,
    this.day,
  });

  factory DetailIneraryRequest.fromJson(Map<String, dynamic> json) =>
      _$DetailIneraryRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DetailIneraryRequestToJson(this);
}
