// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_oversea_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecordOverseaData _$MedicalRecordOverseaDataFromJson(
        Map<String, dynamic> json) =>
    MedicalRecordOverseaData(
      id: json['_id'] as String,
      medicalRecordOverseas: json['medicalRecordOverseas'] as String,
      note: json['note'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$MedicalRecordOverseaDataToJson(
        MedicalRecordOverseaData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'medicalRecordOverseas': instance.medicalRecordOverseas,
      'note': instance.note,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
