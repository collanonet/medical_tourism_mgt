import 'package:json_annotation/json_annotation.dart';

part 'medical_visa_companion_other_response.g.dart';

@JsonSerializable()
class MedicalVisaCompanionOtherResponse {
  @JsonKey(name: '_id')
  final String id;
  final String? nameRomaji;
  final DateTime? dateBirth;
  final bool? sex;
  final String? addressArea;
  final String? numberPassport;
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

  MedicalVisaCompanionOtherResponse({
    required this.id,
    this.nameRomaji,
    this.dateBirth,
    this.sex,
    this.addressArea,
    this.numberPassport,
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

  factory MedicalVisaCompanionOtherResponse.fromJson(
          Map<String, dynamic> json) =>
      _$MedicalVisaCompanionOtherResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MedicalVisaCompanionOtherResponseToJson(this);
}
