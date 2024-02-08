// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_travel_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecordTravelGroup _$MedicalRecordTravelGroupFromJson(
        Map<String, dynamic> json) =>
    MedicalRecordTravelGroup(
      id: json['_id'] as String,
      toGroupLeader: json['toGroupLeader'] as bool?,
      travelGroup: (json['travelGroup'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      medicalRecord: json['medicalRecord'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$MedicalRecordTravelGroupToJson(
        MedicalRecordTravelGroup instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'toGroupLeader': instance.toGroupLeader,
      'travelGroup': instance.travelGroup,
      'medicalRecord': instance.medicalRecord,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
