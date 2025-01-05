// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'medical_visa_hand_out_response.g.dart';

@JsonSerializable()
class MedicalVisaHandOutResponse {
    @JsonKey(name: '_id')
  final String? id;
  String? departure;
  String? arrival;
  String? flightNumber;
  String? departureTime;
  String? arrivalTime;
  String? seatNumber;

  MedicalVisaHandOutResponse({
    required this.id,
  this.flightNumber,
  this.departure,
  this.arrival,
  this.departureTime,
  this.arrivalTime,
  this.seatNumber,
  });

  factory MedicalVisaHandOutResponse.fromJson(Map<String, dynamic> json) => _$MedicalVisaHandOutResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MedicalVisaHandOutResponseToJson(this);


  }
