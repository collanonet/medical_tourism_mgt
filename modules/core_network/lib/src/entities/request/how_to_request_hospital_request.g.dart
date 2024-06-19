// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'how_to_request_hospital_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HowToRequestHospitalRequest _$HowToRequestHospitalRequestFromJson(
        Map<String, dynamic> json) =>
    HowToRequestHospitalRequest(
      hospital: json['hospital'] as String?,
      id: json['_id'] as String?,
      dateOfUpdate: json['dateOfUpdate'] == null
          ? null
          : DateTime.parse(json['dateOfUpdate'] as String),
      updater: json['updater'] as String?,
      memo: json['memo'] as String?,
      updates: json['updates'] as String?,
    );

Map<String, dynamic> _$HowToRequestHospitalRequestToJson(
        HowToRequestHospitalRequest instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'hospital': instance.hospital,
      'dateOfUpdate': instance.dateOfUpdate?.toIso8601String(),
      'updater': instance.updater,
      'memo': instance.memo,
      'updates': instance.updates,
    };
