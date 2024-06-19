// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_institution_section_hospital_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalInstitutionSectionHospitalResponse
    _$MedicalInstitutionSectionHospitalResponseFromJson(
            Map<String, dynamic> json) =>
        MedicalInstitutionSectionHospitalResponse(
          id: json['_id'] as String?,
          doctorName: json['doctorName'] as String,
          moon: json['moon'] as bool? ?? false,
          fire: json['fire'] as bool? ?? false,
          water: json['water'] as bool? ?? false,
          wood: json['wood'] as bool? ?? false,
          money: json['money'] as bool? ?? false,
          soil: json['soil'] as bool? ?? false,
          day: json['day'] as bool? ?? false,
        );

Map<String, dynamic> _$MedicalInstitutionSectionHospitalResponseToJson(
        MedicalInstitutionSectionHospitalResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'doctorName': instance.doctorName,
      'moon': instance.moon,
      'fire': instance.fire,
      'water': instance.water,
      'wood': instance.wood,
      'money': instance.money,
      'soil': instance.soil,
      'day': instance.day,
    };
