// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessCategory _$BusinessCategoryFromJson(Map<String, dynamic> json) =>
    BusinessCategory(
      id: json['id'] as String,
      name: json['name'] as String,
      shopTypes: (json['shopTypes'] as List<dynamic>?)
          ?.map((e) => ShopType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BusinessCategoryToJson(BusinessCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'shopTypes': instance.shopTypes,
    };
