// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dicom_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DicomDetailResponse _$DicomDetailResponseFromJson(Map<String, dynamic> json) =>
    DicomDetailResponse(
      fileSize: (json['FileSize'] as num).toInt(),
      fileUuid: json['FileUuid'] as String,
      id: json['ID'] as String,
      indexInSeries: (json['IndexInSeries'] as num?)?.toInt(),
      mainDicomTags:
          MainDicomTags.fromJson(json['MainDicomTags'] as Map<String, dynamic>),
      parentSeries: json['ParentSeries'] as String,
      type: json['Type'] as String,
    );

Map<String, dynamic> _$DicomDetailResponseToJson(
        DicomDetailResponse instance) =>
    <String, dynamic>{
      'FileSize': instance.fileSize,
      'FileUuid': instance.fileUuid,
      'ID': instance.id,
      'IndexInSeries': instance.indexInSeries,
      'MainDicomTags': instance.mainDicomTags,
      'ParentSeries': instance.parentSeries,
      'Type': instance.type,
    };

MainDicomTags _$MainDicomTagsFromJson(Map<String, dynamic> json) =>
    MainDicomTags(
      instanceNumber: json['InstanceNumber'] as String,
      numberOfFrames: json['NumberOfFrames'] as String,
      sopInstanceUID: json['SOPInstanceUID'] as String,
    );

Map<String, dynamic> _$MainDicomTagsToJson(MainDicomTags instance) =>
    <String, dynamic>{
      'InstanceNumber': instance.instanceNumber,
      'NumberOfFrames': instance.numberOfFrames,
      'SOPInstanceUID': instance.sopInstanceUID,
    };
