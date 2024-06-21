// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hospital _$HospitalFromJson(Map<String, dynamic> json) => Hospital(
      id: json['_id'] as String,
      hospitalName: json['hospitalName'] as String?,
      type: json['type'] as String?,
      area: json['area'] as String?,
      r: json['r'] as String?,
      universityHospital: json['universityHospital'] as bool?,
      nationalHospital: json['nationalHospital'] as bool?,
      privateHospital: json['privateHospital'] as bool?,
      clinic: json['clinic'] as bool?,
    );

Map<String, dynamic> _$HospitalToJson(Hospital instance) => <String, dynamic>{
      '_id': instance.id,
      'hospitalName': instance.hospitalName,
      'type': instance.type,
      'area': instance.area,
      'r': instance.r,
      'universityHospital': instance.universityHospital,
      'nationalHospital': instance.nationalHospital,
      'privateHospital': instance.privateHospital,
      'clinic': instance.clinic,
    };
