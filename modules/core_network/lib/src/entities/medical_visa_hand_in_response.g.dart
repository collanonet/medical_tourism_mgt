// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_visa_hand_in_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalVisaHandInResponse _$MedicalVisaHandInResponseFromJson(
        Map<String, dynamic> json) =>
    MedicalVisaHandInResponse(
      id: json['_id'] as String,
      departure: json['departure'] as String?,
      arrival: json['arrival'] as String?,
      flightNumber: json['flightNumber'] as String?,
      departureTime: json['departureTime'] as String?,
      arrivalTime: json['arrivalTime'] as String?,
    );

Map<String, dynamic> _$MedicalVisaHandInResponseToJson(
        MedicalVisaHandInResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'departure': instance.departure,
      'arrival': instance.arrival,
      'flightNumber': instance.flightNumber,
      'departureTime': instance.departureTime,
      'arrivalTime': instance.arrivalTime,
    };
