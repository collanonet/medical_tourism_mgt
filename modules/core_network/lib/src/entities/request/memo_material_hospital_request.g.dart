// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memo_material_hospital_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemoMaterialHospitalRequest _$MemoMaterialHospitalRequestFromJson(
        Map<String, dynamic> json) =>
    MemoMaterialHospitalRequest(
      memo: json['memo'] as String?,
      hospitalRecord: json['hospitalRecord'] as String,
    );

Map<String, dynamic> _$MemoMaterialHospitalRequestToJson(
        MemoMaterialHospitalRequest instance) =>
    <String, dynamic>{
      'memo': instance.memo,
      'hospitalRecord': instance.hospitalRecord,
    };
