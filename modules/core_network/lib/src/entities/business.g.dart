// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Business _$BusinessFromJson(Map<String, dynamic> json) => Business(
      id: json['id'] as String,
      name: json['name'] as String,
      status: $enumDecode(_$BusinessStatusEnumMap, json['status']),
      type: $enumDecode(_$MerchantTypeEnumMap, json['merchantType']),
      category:
          BusinessCategory.fromJson(json['category'] as Map<String, dynamic>),
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$BusinessToJson(Business instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': _$BusinessStatusEnumMap[instance.status]!,
      'merchantType': _$MerchantTypeEnumMap[instance.type]!,
      'category': instance.category,
      'imageUrl': instance.imageUrl,
    };

const _$BusinessStatusEnumMap = {
  BusinessStatus.unverified: 'UNVERIFIED',
};

const _$MerchantTypeEnumMap = {
  MerchantType.cooporate: 'COOPORATE',
  MerchantType.retailer: 'RETAILER',
};
