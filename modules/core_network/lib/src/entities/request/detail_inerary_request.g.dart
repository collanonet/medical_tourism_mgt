// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_inerary_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailIneraryRequest _$DetailIneraryRequestFromJson(
        Map<String, dynamic> json) =>
    DetailIneraryRequest(
      patientName: (json['patientName'] as List<dynamic>?)
          ?.map((e) => PatientName.fromJson(e as Map<String, dynamic>))
          .toList(),
      tourName: json['tourName'] as String?,
      numberOfPeople: json['numberOfPeople'] as String?,
      group: json['group'] as String?,
      type: json['type'] as String?,
      listday: (json['listday'] as List<dynamic>?)
          ?.map((e) => DayList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DetailIneraryRequestToJson(
        DetailIneraryRequest instance) =>
    <String, dynamic>{
      'patientName': instance.patientName,
      'tourName': instance.tourName,
      'numberOfPeople': instance.numberOfPeople,
      'group': instance.group,
      'type': instance.type,
      'listday': instance.listday,
    };
