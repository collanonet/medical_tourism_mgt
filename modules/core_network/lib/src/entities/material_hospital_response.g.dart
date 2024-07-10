// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_hospital_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaterialHospitalResponse _$MaterialHospitalResponseFromJson(
        Map<String, dynamic> json) =>
    MaterialHospitalResponse(
      id: json['_id'] as String?,
      file: json['file'] as String?,
      brochureName: json['brochureName'] as String?,
      author: json['author'] as String?,
      dateOfIssue: json['dateOfIssue'] as String?,
      share: json['share'] as String?,
    );

Map<String, dynamic> _$MaterialHospitalResponseToJson(
        MaterialHospitalResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'file': instance.file,
      'brochureName': instance.brochureName,
      'author': instance.author,
      'dateOfIssue': instance.dateOfIssue,
      'share': instance.share,
    };
