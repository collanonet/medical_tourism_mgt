// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DocumentRequest _$DocumentRequestFromJson(Map<String, dynamic> json) =>
    DocumentRequest(
      uploadFile: json['uploadFile'] as String?,
      documentName: json['documentName'] as String?,
      updatedOn: json['updatedOn'] == null
          ? null
          : DateTime.parse(json['updatedOn'] as String),
      translationLanguage: json['translationLanguage'] as String?,
      translator: json['translator'] as String?,
    );

Map<String, dynamic> _$DocumentRequestToJson(DocumentRequest instance) =>
    <String, dynamic>{
      'uploadFile': instance.uploadFile,
      'documentName': instance.documentName,
      'updatedOn': instance.updatedOn?.toIso8601String(),
      'translationLanguage': instance.translationLanguage,
      'translator': instance.translator,
    };
