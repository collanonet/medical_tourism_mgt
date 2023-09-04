// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commune.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Commune _$CommuneFromJson(Map<String, dynamic> json) => Commune(
      id: json['id'] as String,
      name: json['name'] as String,
      khmerName: json['khmerName'] as String,
      code: json['code'] as String,
      village: (json['village'] as List<dynamic>?)
          ?.map((e) => Village.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CommuneToJson(Commune instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'khmerName': instance.khmerName,
      'code': instance.code,
      'village': instance.village,
    };
