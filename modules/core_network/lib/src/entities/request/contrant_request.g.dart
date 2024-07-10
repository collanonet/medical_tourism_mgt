// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contrant_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContractRequest _$ContractRequestFromJson(Map<String, dynamic> json) =>
    ContractRequest(
      uploadFile: json['uploadFile'] as String?,
      fileName: json['fileName'] as String?,
      uploadDate: json['uploadDate'] == null
          ? null
          : DateTime.parse(json['uploadDate'] as String),
    );

Map<String, dynamic> _$ContractRequestToJson(ContractRequest instance) =>
    <String, dynamic>{
      'uploadFile': instance.uploadFile,
      'fileName': instance.fileName,
      'uploadDate': instance.uploadDate?.toIso8601String(),
    };
