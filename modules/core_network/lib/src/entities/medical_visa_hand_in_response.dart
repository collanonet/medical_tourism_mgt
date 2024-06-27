import 'package:json_annotation/json_annotation.dart';

part 'medical_visa_hand_in_response.g.dart';

@JsonSerializable()
class MedicalVisaHandInResponse {
  @JsonKey(name: '_id')
  final String id;
  String? departure;
  String? arrival;
  String? flightNumber;
  String? departureTime;
  String? arrivalTime;

  MedicalVisaHandInResponse({
    required this.id,
    this.departure,
    this.arrival,
    this.flightNumber,
    this.departureTime,
    this.arrivalTime,
  });

  factory MedicalVisaHandInResponse.fromJson(Map<String, dynamic> json) =>
      _$MedicalVisaHandInResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MedicalVisaHandInResponseToJson(this);
}
