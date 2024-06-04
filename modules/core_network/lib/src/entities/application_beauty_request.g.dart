// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_beauty_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationBeautyRequest _$ApplicationBeautyRequestFromJson(
        Map<String, dynamic> json) =>
    ApplicationBeautyRequest(
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
      people: (json['people'] as num?)?.toInt(),
      age: (json['age'] as num?)?.toInt(),
      sex: json['sex'] as bool?,
      relationship: json['relationship'] as String?,
      attend: json['attend'] as bool?,
      desiredArea: json['desiredArea'] as String?,
      reason: json['reason'] as String?,
      faceMenu1: json['faceMenu1'] as bool?,
      faceMenu2: json['faceMenu2'] as bool?,
      faceMenu3: json['faceMenu3'] as bool?,
      faceMenu4: json['faceMenu4'] as bool?,
      faceMenu5: json['faceMenu5'] as bool?,
      faceMenu6: json['faceMenu6'] as bool?,
      faceMenu7: json['faceMenu7'] as bool?,
      faceMenu8: json['faceMenu8'] as bool?,
      faceMenu9: json['faceMenu9'] as bool?,
      bodyMenu1: json['bodyMenu1'] as bool?,
      bodyMenu2: json['bodyMenu2'] as bool?,
      bodyMenu3: json['bodyMenu3'] as bool?,
      bodyMenu4: json['bodyMenu4'] as bool?,
      bodyMenu5: json['bodyMenu5'] as bool?,
      others: json['others'] as String?,
      skinMenu1: json['skinMenu1'] as bool?,
      skinMenu2: json['skinMenu2'] as bool?,
      skinMenu3: json['skinMenu3'] as bool?,
      hairRemovalMeun1: json['hairRemovalMeun1'] as bool?,
      hairRemovalMeun2: json['hairRemovalMeun2'] as bool?,
      otherMenu1: json['otherMenu1'] as bool?,
      otherMenu2: json['otherMenu2'] as bool?,
      otherMenu3: json['otherMenu3'] as bool?,
      otherMenu4: json['otherMenu4'] as bool?,
      otherMenu5: json['otherMenu5'] as bool?,
      menMenu1: json['menMenu1'] as bool?,
      menMenu2: json['menMenu2'] as bool?,
      otherHospital: json['otherHospital'] as bool?,
      others1: json['others1'] as String?,
      others2: json['others2'] as String?,
      concerne: json['concerne'] as String?,
      brokerageCompany: json['brokerageCompany'] as String?,
      privetcy: json['privetcy'] as bool?,
      medicalRecord: json['medicalRecord'] as String,
    );

Map<String, dynamic> _$ApplicationBeautyRequestToJson(
        ApplicationBeautyRequest instance) =>
    <String, dynamic>{
      'date1': instance.date1?.toIso8601String(),
      'date2': instance.date2?.toIso8601String(),
      'date3': instance.date3?.toIso8601String(),
      'desiredDate': instance.desiredDate,
      'remarks': instance.remarks,
      'people': instance.people,
      'age': instance.age,
      'sex': instance.sex,
      'relationship': instance.relationship,
      'attend': instance.attend,
      'desiredArea': instance.desiredArea,
      'reason': instance.reason,
      'faceMenu1': instance.faceMenu1,
      'faceMenu2': instance.faceMenu2,
      'faceMenu3': instance.faceMenu3,
      'faceMenu4': instance.faceMenu4,
      'faceMenu5': instance.faceMenu5,
      'faceMenu6': instance.faceMenu6,
      'faceMenu7': instance.faceMenu7,
      'faceMenu8': instance.faceMenu8,
      'faceMenu9': instance.faceMenu9,
      'others': instance.others,
      'bodyMenu1': instance.bodyMenu1,
      'bodyMenu2': instance.bodyMenu2,
      'bodyMenu3': instance.bodyMenu3,
      'bodyMenu4': instance.bodyMenu4,
      'bodyMenu5': instance.bodyMenu5,
      'others1': instance.others1,
      'skinMenu1': instance.skinMenu1,
      'skinMenu2': instance.skinMenu2,
      'skinMenu3': instance.skinMenu3,
      'hairRemovalMeun1': instance.hairRemovalMeun1,
      'hairRemovalMeun2': instance.hairRemovalMeun2,
      'otherMenu1': instance.otherMenu1,
      'otherMenu2': instance.otherMenu2,
      'otherMenu3': instance.otherMenu3,
      'otherMenu4': instance.otherMenu4,
      'otherMenu5': instance.otherMenu5,
      'menMenu1': instance.menMenu1,
      'menMenu2': instance.menMenu2,
      'otherHospital': instance.otherHospital,
      'others2': instance.others2,
      'concerne': instance.concerne,
      'brokerageCompany': instance.brokerageCompany,
      'privetcy': instance.privetcy,
      'medicalRecord': instance.medicalRecord,
    };
