// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dicom_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DicomResponse _$DicomResponseFromJson(Map<String, dynamic> json) =>
    DicomResponse(
      id: json['ID'] as String,
      parentPatient: json['ParentPatient'] as String,
      parentSeries: json['ParentSeries'] as String,
      parentStudy: json['ParentStudy'] as String,
      path: json['Path'] as String,
      status: json['Status'] as String,
    );

Map<String, dynamic> _$DicomResponseToJson(DicomResponse instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'ParentPatient': instance.parentPatient,
      'ParentSeries': instance.parentSeries,
      'ParentStudy': instance.parentStudy,
      'Path': instance.path,
      'Status': instance.status,
    };
