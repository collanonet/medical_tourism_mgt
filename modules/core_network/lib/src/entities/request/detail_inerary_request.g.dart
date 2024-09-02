// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_inerary_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailIneraryRequest _$DetailIneraryRequestFromJson(
        Map<String, dynamic> json) =>
    DetailIneraryRequest(
      patient:
          (json['patient'] as List<dynamic>?)?.map((e) => e as String).toList(),
      tourName: json['tourName'] as String?,
      peopleNumber: (json['peopleNumber'] as num?)?.toInt(),
      group: (json['group'] as num?)?.toInt(),
      classification: json['classification'] as String?,
      day: (json['day'] as List<dynamic>?)
          ?.map(
              (e) => e == null ? null : Day.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DetailIneraryRequestToJson(
        DetailIneraryRequest instance) =>
    <String, dynamic>{
      'patient': instance.patient,
      'tourName': instance.tourName,
      'peopleNumber': instance.peopleNumber,
      'group': instance.group,
      'classification': instance.classification,
      'day': instance.day,
    };
