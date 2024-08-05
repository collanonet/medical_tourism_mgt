import 'package:json_annotation/json_annotation.dart';

part 'medical_visa_addition_response.g.dart';

@JsonSerializable()
class MedicalVisaAdditionResponse {
  @JsonKey(name: '_id')
  final String id;
  final DateTime? dateLandingPermit;
  final DateTime? dateVisaExpiration;
  final DateTime? dateEntryIntoJapan;
  final DateTime? dateEntryFromJapan;
  final String? departureEntry;
  final String? arrivalEntry;
  final String? flightNumberEntry;
  final String? departureTimeEntry;
  final String? arrivalTimeEntry;
  final String? departureDeparture;
  final String? arrivalDeparture;
  final String? flightNumberDeparture;
  final String? departureTimeDeparture;
  final String? arrivalTimeDeparture;
  final String? flightSeatNumberDeparturer;
  final String? remarks;

  MedicalVisaAdditionResponse({
    required this.id,
    this.dateLandingPermit,
    this.dateVisaExpiration,
    this.dateEntryIntoJapan,
    this.dateEntryFromJapan,
    this.departureEntry,
    this.arrivalEntry,
    this.flightNumberEntry,
    this.departureTimeEntry,
    this.arrivalTimeEntry,
    this.departureDeparture,
    this.arrivalDeparture,
    this.flightNumberDeparture,
    this.departureTimeDeparture,
    this.arrivalTimeDeparture,
    this.flightSeatNumberDeparturer,
    this.remarks,
  });

  factory MedicalVisaAdditionResponse.fromJson(Map<String, dynamic> json) =>
      _$MedicalVisaAdditionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MedicalVisaAdditionResponseToJson(this);
}
