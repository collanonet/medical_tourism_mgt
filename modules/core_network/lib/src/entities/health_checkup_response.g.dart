// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_checkup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthResponse _$HealthResponseFromJson(Map<String, dynamic> json) =>
    HealthResponse(
      id: json['_id'] as String,
      uploadFile: json['uploadFile'] as String?,
      fileName: json['fileName'] as String?,
      uploadDate: json['uploadDate'] == null
          ? null
          : DateTime.parse(json['uploadDate'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$HealthResponseToJson(HealthResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'uploadFile': instance.uploadFile,
      'fileName': instance.fileName,
      'uploadDate': instance.uploadDate?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
    };
