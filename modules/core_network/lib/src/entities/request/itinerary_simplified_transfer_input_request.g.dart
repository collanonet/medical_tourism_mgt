// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itinerary_simplified_transfer_input_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItineraryTransferInputRequest _$ItineraryTransferInputRequestFromJson(
        Map<String, dynamic> json) =>
    ItineraryTransferInputRequest(
      transfer: json['transfer'] as String?,
      date: json['date'] as String?,
      time: json['time'] as String?,
      place: json['place'] as String?,
      driverInCharge: json['driverInCharge'] as String?,
    );

Map<String, dynamic> _$ItineraryTransferInputRequestToJson(
        ItineraryTransferInputRequest instance) =>
    <String, dynamic>{
      'transfer': instance.transfer,
      'date': instance.date,
      'time': instance.time,
      'place': instance.place,
      'driverInCharge': instance.driverInCharge,
    };
