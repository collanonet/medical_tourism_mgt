// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_profile_hospital_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorProfileHospitalResponse _$DoctorProfileHospitalResponseFromJson(
        Map<String, dynamic> json) =>
    DoctorProfileHospitalResponse(
      id: json['_id'] as String,
      hospital: json['hospital'] as String,
      can: json['can'] as String?,
      no: json['no'] as String?,
      remark: json['remark'] as String?,
      departmentName: json['departmentName'] as String?,
      post: json['post'] as String?,
      specialty: json['specialty'] as String?,
      nameKanji: json['nameKanji'] as String?,
      nameKana: json['nameKana'] as String?,
      affiliatedAcademicSociety:
          (json['affiliatedAcademicSociety'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      qualifications: (json['qualifications'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      trainingCompletionCertificateNumber:
          json['trainingCompletionCertificateNumber'] as String?,
      telephoneNumber: json['telephoneNumber'] as String?,
      faxNumber: json['faxNumber'] as String?,
      email: json['email'] as String?,
      remark2: json['remark2'] as String?,
    );

Map<String, dynamic> _$DoctorProfileHospitalResponseToJson(
        DoctorProfileHospitalResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'hospital': instance.hospital,
      'can': instance.can,
      'no': instance.no,
      'remark': instance.remark,
      'departmentName': instance.departmentName,
      'post': instance.post,
      'specialty': instance.specialty,
      'nameKanji': instance.nameKanji,
      'nameKana': instance.nameKana,
      'affiliatedAcademicSociety': instance.affiliatedAcademicSociety,
      'qualifications': instance.qualifications,
      'trainingCompletionCertificateNumber':
          instance.trainingCompletionCertificateNumber,
      'telephoneNumber': instance.telephoneNumber,
      'faxNumber': instance.faxNumber,
      'email': instance.email,
      'remark2': instance.remark2,
    };
