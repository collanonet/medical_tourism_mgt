// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import '../../core_network.dart';
import 'detail_itinerary_data_response.dart';

part 'detail_itinerary_response.g.dart';

@JsonSerializable()
class DetailItineraryResponse {
  @JsonKey(name: '_id')
  final String? id;
  List<Patient>? patient;
  String? tourName;
  int? peopleNumber;
  int? group;
  String? classification;
  List<Day>? day;

  DetailItineraryResponse({
    required this.id,
    this.patient,
    this.tourName,
    this.peopleNumber,
    this.classification,
    this.group,
    this.day,
  });

  factory DetailItineraryResponse.fromJson(Map<String, dynamic> json) {
    return _$DetailItineraryResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DetailItineraryResponseToJson(this);
  }
}
