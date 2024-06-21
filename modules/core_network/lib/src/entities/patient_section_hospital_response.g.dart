// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_section_hospital_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientSectionHospitalResponse _$PatientSectionHospitalResponseFromJson(
        Map<String, dynamic> json) =>
    PatientSectionHospitalResponse(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      firstHope: json['firstHope'] == null
          ? null
          : DateTime.parse(json['firstHope'] as String),
      secondHope: json['secondHope'] == null
          ? null
          : DateTime.parse(json['secondHope'] as String),
      thirdHope: json['thirdHope'] == null
          ? null
          : DateTime.parse(json['thirdHope'] as String),
      noDesiredDate: json['noDesiredDate'] as bool?,
      remarks: json['remarks'] as String?,
    );

Map<String, dynamic> _$PatientSectionHospitalResponseToJson(
        PatientSectionHospitalResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'firstHope': instance.firstHope?.toIso8601String(),
      'secondHope': instance.secondHope?.toIso8601String(),
      'thirdHope': instance.thirdHope?.toIso8601String(),
      'noDesiredDate': instance.noDesiredDate,
      'remarks': instance.remarks,
    };
