// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_examination_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalExaminationResponse _$MedicalExaminationResponseFromJson(
        Map<String, dynamic> json) =>
    MedicalExaminationResponse(
      id: json['_id'] as String,
      date1: json['date1'] == null
          ? null
          : DateTime.parse(json['date1'] as String),
      date2: json['date2'] == null
          ? null
          : DateTime.parse(json['date2'] as String),
      date3: json['date3'] == null
          ? null
          : DateTime.parse(json['date3'] as String),
      desiredDate: json['desiredDate'] as bool?,
      remarks: json['remarks'] as String?,
      countpoeple: (json['countpoeple'] as num?)?.toInt(),
      age: (json['age'] as num?)?.toInt(),
      sex: json['sex'] as bool?,
      relationship: json['relationship'] as String?,
      attend: json['attend'] as bool?,
      medicalName: json['medicalName'] as String?,
      reason: json['reason'] as String?,
      petct: json['petct'] as bool?,
      mri: json['mri'] as bool?,
      gastroscope: json['gastroscope'] as bool?,
      freeinput: json['freeinput'] as String?,
      concern: json['concern'] as String?,
      privecy: json['privecy'] as bool?,
    )..uploadMedicalData = json['uploadMedicalData'] as String?;

Map<String, dynamic> _$MedicalExaminationResponseToJson(
        MedicalExaminationResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'date1': instance.date1?.toIso8601String(),
      'date2': instance.date2?.toIso8601String(),
      'date3': instance.date3?.toIso8601String(),
      'desiredDate': instance.desiredDate,
      'remarks': instance.remarks,
      'countpoeple': instance.countpoeple,
      'age': instance.age,
      'sex': instance.sex,
      'relationship': instance.relationship,
      'attend': instance.attend,
      'medicalName': instance.medicalName,
      'reason': instance.reason,
      'petct': instance.petct,
      'mri': instance.mri,
      'gastroscope': instance.gastroscope,
      'freeinput': instance.freeinput,
      'concern': instance.concern,
      'uploadMedicalData': instance.uploadMedicalData,
      'privecy': instance.privecy,
    };
