// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_itinerary_simple_pick_up_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailItinerarySimplePickUpAndDropOffRequest
    _$DetailItinerarySimplePickUpAndDropOffRequestFromJson(
            Map<String, dynamic> json) =>
        DetailItinerarySimplePickUpAndDropOffRequest(
          pickUpAndDropOffCheck: json['pickUpAndDropOffCheck'] as bool?,
          pickUpDateAndTime: json['pickUpDateAndTime'] == null
              ? null
              : DateTime.parse(json['pickUpDateAndTime'] as String),
          time: json['time'] as String?,
          place: json['place'] as String?,
          type: json['type'] as bool?,
          arranger: json['arranger'] as String?,
          carNumber: json['carNumber'] as String?,
          driverNameKanli: json['driverNameKanli'] as String?,
          driverNameKana: json['driverNameKana'] as String?,
          phone: json['phone'] as String?,
        );

Map<String, dynamic> _$DetailItinerarySimplePickUpAndDropOffRequestToJson(
        DetailItinerarySimplePickUpAndDropOffRequest instance) =>
    <String, dynamic>{
      'pickUpAndDropOffCheck': instance.pickUpAndDropOffCheck,
      'pickUpDateAndTime': instance.pickUpDateAndTime?.toIso8601String(),
      'time': instance.time,
      'place': instance.place,
      'type': instance.type,
      'arranger': instance.arranger,
      'carNumber': instance.carNumber,
      'driverNameKanli': instance.driverNameKanli,
      'driverNameKana': instance.driverNameKana,
      'phone': instance.phone,
    };
