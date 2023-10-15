// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_interpreter_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecordInterpreterRequest _$MedicalRecordInterpreterRequestFromJson(
        Map<String, dynamic> json) =>
    MedicalRecordInterpreterRequest(
      requiredOrUnnnecessary: json['requiredOrUnnnecessary'] as bool?,
      interpreter: json['interpreter'] as String?,
      medicalRecord: json['medicalRecord'] as String?,
    );

Map<String, dynamic> _$MedicalRecordInterpreterRequestToJson(
        MedicalRecordInterpreterRequest instance) =>
    <String, dynamic>{
      'requiredOrUnnnecessary': instance.requiredOrUnnnecessary,
      'interpreter': instance.interpreter,
      'medicalRecord': instance.medicalRecord,
    };
