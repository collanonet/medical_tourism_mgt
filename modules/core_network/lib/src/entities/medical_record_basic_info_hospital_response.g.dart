// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_basic_info_hospital_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecordBasicInfoHospitalResponse
    _$MedicalRecordBasicInfoHospitalResponseFromJson(
            Map<String, dynamic> json) =>
        MedicalRecordBasicInfoHospitalResponse(
          id: json['_id'] as String,
          hospital: json['hospital'] as String,
          dateOfUpdate: json['dateOfUpdate'] == null
              ? null
              : DateTime.parse(json['dateOfUpdate'] as String),
          departmentName: json['departmentName'] as String?,
          nameKanji: json['nameKanji'] as String?,
          nameKana: json['nameKana'] as String?,
          telephoneNumber: json['telephoneNumber'] as String?,
          email: json['email'] as String?,
          faxNumber: json['faxNumber'] as String?,
        );

Map<String, dynamic> _$MedicalRecordBasicInfoHospitalResponseToJson(
        MedicalRecordBasicInfoHospitalResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'hospital': instance.hospital,
      'dateOfUpdate': instance.dateOfUpdate?.toIso8601String(),
      'departmentName': instance.departmentName,
      'nameKanji': instance.nameKanji,
      'nameKana': instance.nameKana,
      'telephoneNumber': instance.telephoneNumber,
      'email': instance.email,
      'faxNumber': instance.faxNumber,
    };
