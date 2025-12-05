// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itinerary_simplified_transfer_input_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItineraryTransferInputResponse _$ItineraryTransferInputResponseFromJson(
        Map<String, dynamic> json) {
  final transferData = json['transferInput'] as Map<String, dynamic>? ?? json;
  return ItineraryTransferInputResponse(
    id: json['_id'] as String,
    transfer: transferData['transfer'] as String?,
    date: transferData['date'] as String?,
    time: transferData['time'] as String?,
    place: transferData['place'] as String?,
    driverInCharge: transferData['driverInCharge'] as String?,
  );
}

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
