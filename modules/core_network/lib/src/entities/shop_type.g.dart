// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopType _$ShopTypeFromJson(Map<String, dynamic> json) => ShopType(
      id: json['id'] as String,
      name: json['name'] as String,
      code: json['code'] as String?,
      khmerName: json['khmerName'] as String?,
    );

Map<String, dynamic> _$ShopTypeToJson(ShopType instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'khmerName': instance.khmerName,
    };
