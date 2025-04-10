// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import '../../core_network.dart';
import 'detail_itinerary_data_response.dart';

part 'detail_itinerary_response.g.dart';

@JsonSerializable()
class PatientTour {
  final String? patientName;
  final String? patient; // Assuming ObjectId is represented as a String
  final String? tour; // Assuming ObjectId is represented as a String
  final DateTime? deletedAt;
  final int? isDelete;

  PatientTour({
    this.patientName,
    this.patient,
    this.tour,
    this.deletedAt,
    this.isDelete,
  });

  factory PatientTour.fromJson(Map<String, dynamic> json) => _$PatientTourFromJson(json);

  Map<String, dynamic> toJson() => _$PatientTourToJson(this);
}

@JsonSerializable()
class DetailItineraryResponse {
  @JsonKey(name: '_id')
  final String? id;
  List<Patient>? patient;
  List<PatientTour>? patients;
  String? tourName;
  int? peopleNumber;
  int? group;
  String? classification;
  List<Day>? day;

  DetailItineraryResponse({
    required this.id,
    this.patient,
    this.patients,
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
