// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_oversea_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecordOverseaRequest _$MedicalRecordOverseaRequestFromJson(
        Map<String, dynamic> json) =>
    MedicalRecordOverseaRequest(
      medicalRecord: json['medicalRecord'] as String?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$MedicalRecordOverseaRequestToJson(
        MedicalRecordOverseaRequest instance) =>
    <String, dynamic>{
      'medicalRecord': instance.medicalRecord,
      'note': instance.note,
    };
