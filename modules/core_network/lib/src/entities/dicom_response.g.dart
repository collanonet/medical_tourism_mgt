// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dicom_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DicomResponse _$DicomResponseFromJson(Map<String, dynamic> json) =>
    DicomResponse(
      id: json['id'] as String,
      parentPatient: json['parentPatient'] as String,
      parentSeries: json['parentSeries'] as String,
      parentStudy: json['parentStudy'] as String,
      path: json['path'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$DicomResponseToJson(DicomResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parentPatient': instance.parentPatient,
      'parentSeries': instance.parentSeries,
      'parentStudy': instance.parentStudy,
      'path': instance.path,
      'status': instance.status,
    };
