// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'legacy_business.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LegacyBusiness _$LegacyBusinessFromJson(Map<String, dynamic> json) =>
    LegacyBusiness(
      businessId: json['businessId'] as String,
      businessName: json['businessName'] as String,
      businessType:
          $enumDecodeNullable(_$MerchantTypeEnumMap, json['businessType']),
      businessCategory: json['businessCategory'] as String?,
      businessLogoUrl: json['businessLogoUrl'] as String?,
      shops: (json['shops'] as List<dynamic>?)
          ?.map((e) => Shop.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LegacyBusinessToJson(LegacyBusiness instance) =>
    <String, dynamic>{
      'businessId': instance.businessId,
      'businessName': instance.businessName,
      'businessType': _$MerchantTypeEnumMap[instance.businessType],
      'businessCategory': instance.businessCategory,
      'businessLogoUrl': instance.businessLogoUrl,
      'shops': instance.shops,
    };

const _$MerchantTypeEnumMap = {
  MerchantType.cooporate: 'COOPORATE',
  MerchantType.retailer: 'RETAILER',
};
