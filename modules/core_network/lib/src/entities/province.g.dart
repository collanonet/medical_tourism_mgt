// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'province.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Province _$ProvinceFromJson(Map<String, dynamic> json) => Province(
      id: json['id'] as String,
      name: json['name'] as String,
      khmerName: json['khmerName'] as String,
      district: (json['district'] as List<dynamic>?)
          ?.map((e) => District.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProvinceToJson(Province instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'khmerName': instance.khmerName,
      'district': instance.district,
    };
