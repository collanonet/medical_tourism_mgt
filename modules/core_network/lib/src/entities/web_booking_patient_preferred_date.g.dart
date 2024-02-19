// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_booking_patient_preferred_date.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebBookingPatientPreferredDate _$WebBookingPatientPreferredDateFromJson(
        Map<String, dynamic> json) =>
    WebBookingPatientPreferredDate(
      id: json['_id'] as String,
      preferredDate1: json['preferredDate1'] == null
          ? null
          : DateTime.parse(json['preferredDate1'] as String),
      preferredDate2: json['preferredDate2'] == null
          ? null
          : DateTime.parse(json['preferredDate2'] as String),
      preferredDate3: json['preferredDate3'] == null
          ? null
          : DateTime.parse(json['preferredDate3'] as String),
      noDesiredDate: json['noDesiredDate'] as bool,
      remarks: json['remarks'] as String?,
      medicalRecord: json['medicalRecord'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$WebBookingPatientPreferredDateToJson(
        WebBookingPatientPreferredDate instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'preferredDate1': instance.preferredDate1?.toIso8601String(),
      'preferredDate2': instance.preferredDate2?.toIso8601String(),
      'preferredDate3': instance.preferredDate3?.toIso8601String(),
      'noDesiredDate': instance.noDesiredDate,
      'remarks': instance.remarks,
      'medicalRecord': instance.medicalRecord,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
