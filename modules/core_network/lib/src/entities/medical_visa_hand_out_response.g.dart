// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_visa_hand_out_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalVisaHandOutResponse _$MedicalVisaHandOutResponseFromJson(
        Map<String, dynamic> json) =>
    MedicalVisaHandOutResponse(
      flightNumber: json['flightNumber'] as String?,
      departure: json['departure'] as String?,
      arrival: json['arrival'] as String?,
      departureTime: json['departureTime'] as String?,
      arrivalTime: json['arrivalTime'] as String?,
      seatNumber: json['seatNumber'] as String?,
    );

Map<String, dynamic> _$MedicalVisaHandOutResponseToJson(
        MedicalVisaHandOutResponse instance) =>
    <String, dynamic>{
      'departure': instance.departure,
      'arrival': instance.arrival,
      'flightNumber': instance.flightNumber,
      'departureTime': instance.departureTime,
      'arrivalTime': instance.arrivalTime,
      'seatNumber': instance.seatNumber,
    };
