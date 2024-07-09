// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_hospital_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaterialHospitalRequest _$MaterialHospitalRequestFromJson(
        Map<String, dynamic> json) =>
    MaterialHospitalRequest(
      memo: json['memo'] as String?,
      file: json['file'] as String?,
      brochureName: json['brochureName'] as String?,
      author: json['author'] as String?,
      dateOfIssue: json['dateOfIssue'] as String?,
      share: json['share'] as String?,
    );

Map<String, dynamic> _$MaterialHospitalRequestToJson(
        MaterialHospitalRequest instance) =>
    <String, dynamic>{
      'memo': instance.memo,
      'file': instance.file,
      'brochureName': instance.brochureName,
      'author': instance.author,
      'dateOfIssue': instance.dateOfIssue,
      'share': instance.share,
    };
