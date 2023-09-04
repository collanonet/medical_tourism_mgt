// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'village.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Village _$VillageFromJson(Map<String, dynamic> json) => Village(
      id: json['id'] as String,
      name: json['name'] as String,
      khmerName: json['khmerName'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$VillageToJson(Village instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'khmerName': instance.khmerName,
      'code': instance.code,
    };
