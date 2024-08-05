// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itinerary_simplified_transfer_input_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItineraryTransferInputResponse _$ItineraryTransferInputResponseFromJson(
        Map<String, dynamic> json) =>
    ItineraryTransferInputResponse(
      id: json['_id'] as String,
      transfer: json['transfer'] as String?,
      date: json['date'] as String?,
      time: json['time'] as String?,
      place: json['place'] as String?,
      driverInCharge: json['driverInCharge'] as String?,
    );

Map<String, dynamic> _$ItineraryTransferInputResponseToJson(
        ItineraryTransferInputResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'transfer': instance.transfer,
      'date': instance.date,
      'time': instance.time,
      'place': instance.place,
      'driverInCharge': instance.driverInCharge,
    };
