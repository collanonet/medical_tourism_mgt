// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dicom_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DicomDetailResponse _$DicomDetailResponseFromJson(Map<String, dynamic> json) =>
    DicomDetailResponse(
      fileSize: (json['fileSize'] as num).toInt(),
      fileUuid: json['fileUuid'] as String,
      id: json['id'] as String,
      indexInSeries: (json['indexInSeries'] as num?)?.toInt(),
      mainDicomTags:
          MainDicomTags.fromJson(json['mainDicomTags'] as Map<String, dynamic>),
      parentSeries: json['parentSeries'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$DicomDetailResponseToJson(
        DicomDetailResponse instance) =>
    <String, dynamic>{
      'fileSize': instance.fileSize,
      'fileUuid': instance.fileUuid,
      'id': instance.id,
      'indexInSeries': instance.indexInSeries,
      'mainDicomTags': instance.mainDicomTags,
      'parentSeries': instance.parentSeries,
      'type': instance.type,
    };

MainDicomTags _$MainDicomTagsFromJson(Map<String, dynamic> json) =>
    MainDicomTags(
      instanceNumber: json['instanceNumber'] as String,
      numberOfFrames: json['numberOfFrames'] as String,
      sopInstanceUID: json['sopInstanceUID'] as String,
    );

Map<String, dynamic> _$MainDicomTagsToJson(MainDicomTags instance) =>
    <String, dynamic>{
      'instanceNumber': instance.instanceNumber,
      'numberOfFrames': instance.numberOfFrames,
      'sopInstanceUID': instance.sopInstanceUID,
    };
