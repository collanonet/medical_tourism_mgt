// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_date_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingDateResponse _$BookingDateResponseFromJson(Map<String, dynamic> json) =>
    BookingDateResponse(
      id: json['_id'] as String,
      preferredDate: json['preferredDate'] == null
          ? null
          : DateTime.parse(json['preferredDate'] as String),
      choice: json['choice'] as String?,
      timePeriodFrom: json['timePeriodFrom'] as String?,
      timePeriodTo: json['timePeriodTo'] as String?,
      medicalRecord: json['medicalRecord'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$BookingDateResponseToJson(
        BookingDateResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'preferredDate': instance.preferredDate?.toIso8601String(),
      'choice': instance.choice,
      'timePeriodFrom': instance.timePeriodFrom,
      'timePeriodTo': instance.timePeriodTo,
      'medicalRecord': instance.medicalRecord,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
