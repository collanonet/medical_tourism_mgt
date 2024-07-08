// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_treament_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TreamentResponce _$TreamentResponceFromJson(Map<String, dynamic> json) =>
    TreamentResponce(
      id: json['_id'] as String,
      medicalInfo: json['medicalInfo'] as bool?,
      dicom: json['dicom'] as bool?,
      bloodTests: json['bloodTests'] as bool?,
      datial: json['datial'] as String?,
      diagnosis: json['diagnosis'] as String?,
      explanation: json['explanation'] as String?,
      historyOfOnset: json['historyOfOnset'] as String?,
      currentTreatment: json['currentTreatment'] as String?,
      nameOfTheDrug: (json['nameOfTheDrug'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      healthStatus: json['healthStatus'] as bool?,
      datial1: json['datial1'] as String?,
      datial2: json['datial2'] as String?,
      healthStatus1: json['healthStatus1'] as bool?,
      healthStatus2: json['healthStatus2'] as String?,
      budget: json['budget'] as String?,
      attendition: json['attendition'] as bool?,
      medicalName: json['medicalName'] as String?,
      reason: json['reason'] as String?,
      desiredDate1: json['desiredDate1'] == null
          ? null
          : DateTime.parse(json['desiredDate1'] as String),
      desiredDate2: json['desiredDate2'] == null
          ? null
          : DateTime.parse(json['desiredDate2'] as String),
      desiredDate3: json['desiredDate3'] == null
          ? null
          : DateTime.parse(json['desiredDate3'] as String),
      scheduled: json['scheduled'] as String?,
    );

Map<String, dynamic> _$TreamentResponceToJson(TreamentResponce instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'medicalInfo': instance.medicalInfo,
      'dicom': instance.dicom,
      'bloodTests': instance.bloodTests,
      'datial': instance.datial,
      'diagnosis': instance.diagnosis,
      'explanation': instance.explanation,
      'historyOfOnset': instance.historyOfOnset,
      'currentTreatment': instance.currentTreatment,
      'nameOfTheDrug': instance.nameOfTheDrug,
      'healthStatus': instance.healthStatus,
      'datial1': instance.datial1,
      'datial2': instance.datial2,
      'healthStatus1': instance.healthStatus1,
      'healthStatus2': instance.healthStatus2,
      'budget': instance.budget,
      'attendition': instance.attendition,
      'medicalName': instance.medicalName,
      'reason': instance.reason,
      'desiredDate1': instance.desiredDate1?.toIso8601String(),
      'desiredDate2': instance.desiredDate2?.toIso8601String(),
      'desiredDate3': instance.desiredDate3?.toIso8601String(),
      'scheduled': instance.scheduled,
    };
