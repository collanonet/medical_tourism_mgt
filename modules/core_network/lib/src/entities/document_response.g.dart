// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DocumentResponse _$DocumentResponseFromJson(Map<String, dynamic> json) =>
    DocumentResponse(
      id: json['_id'] as String,
      uploadFile: json['uploadFile'] as String?,
      documentName: json['documentName'] as String?,
      updatedOn: json['updatedOn'] == null
          ? null
          : DateTime.parse(json['updatedOn'] as String),
      translationLanguage: json['translationLanguage'] as String?,
      translator: json['translator'] as String?,
    );

Map<String, dynamic> _$DocumentResponseToJson(DocumentResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'uploadFile': instance.uploadFile,
      'documentName': instance.documentName,
      'updatedOn': instance.updatedOn?.toIso8601String(),
      'translationLanguage': instance.translationLanguage,
      'translator': instance.translator,
    };
