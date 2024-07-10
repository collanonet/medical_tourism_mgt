// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_checkup_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthRequest _$HealthRequestFromJson(Map<String, dynamic> json) =>
    HealthRequest(
      uploadFile: json['uploadFile'] as String?,
      fileName: json['fileName'] as String?,
      uploadDate: json['uploadDate'] == null
          ? null
          : DateTime.parse(json['uploadDate'] as String),
      hospitalRecord: json['hospitalRecord'] as String,
    );

Map<String, dynamic> _$HealthRequestToJson(HealthRequest instance) =>
    <String, dynamic>{
      'uploadFile': instance.uploadFile,
      'fileName': instance.fileName,
      'uploadDate': instance.uploadDate?.toIso8601String(),
      'hospitalRecord': instance.hospitalRecord,
    };
