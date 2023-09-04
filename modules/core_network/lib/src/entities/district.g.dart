// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

District _$DistrictFromJson(Map<String, dynamic> json) => District(
      id: json['id'] as String,
      name: json['name'] as String,
      khmerName: json['khmerName'] as String,
      code: json['code'] as String,
      commune: (json['commune'] as List<dynamic>?)
          ?.map((e) => Commune.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DistrictToJson(District instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'khmerName': instance.khmerName,
      'code': instance.code,
      'commune': instance.commune,
    };
