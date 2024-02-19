// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_date_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingDateRequest _$BookingDateRequestFromJson(Map<String, dynamic> json) =>
    BookingDateRequest(
      preferredDate: json['preferredDate'] == null
          ? null
          : DateTime.parse(json['preferredDate'] as String),
      choice: json['choice'] as String?,
      timePeriodFrom: json['timePeriodFrom'] as String?,
      timePeriodTo: json['timePeriodTo'] as String?,
      medicalRecord: json['medicalRecord'] as String?,
    );

Map<String, dynamic> _$BookingDateRequestToJson(BookingDateRequest instance) =>
    <String, dynamic>{
      'preferredDate': instance.preferredDate?.toIso8601String(),
      'choice': instance.choice,
      'timePeriodFrom': instance.timePeriodFrom,
      'timePeriodTo': instance.timePeriodTo,
      'medicalRecord': instance.medicalRecord,
    };
