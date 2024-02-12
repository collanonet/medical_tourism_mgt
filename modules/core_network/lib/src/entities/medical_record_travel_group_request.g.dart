// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_travel_group_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecordTravelGroupRequest _$MedicalRecordTravelGroupRequestFromJson(
        Map<String, dynamic> json) =>
    MedicalRecordTravelGroupRequest(
      toGroupLeader: json['toGroupLeader'] as bool?,
      travelGroup: (json['travelGroup'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      medicalRecord: json['medicalRecord'] as String?,
    );

Map<String, dynamic> _$MedicalRecordTravelGroupRequestToJson(
        MedicalRecordTravelGroupRequest instance) =>
    <String, dynamic>{
      'toGroupLeader': instance.toGroupLeader,
      'travelGroup': instance.travelGroup,
      'medicalRecord': instance.medicalRecord,
    };
