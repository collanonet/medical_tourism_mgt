// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_create_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopCreateRequest _$ShopCreateRequestFromJson(Map<String, dynamic> json) =>
    ShopCreateRequest(
      name: json['name'] as String,
      villageId: json['villageId'] as String,
      bankAccountNumbers: (json['bankAccountNumbers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      profileImageUrl: json['profileImageUrl'] as String,
      shopTypeId: json['shopTypeId'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
      addressLine1: json['addressLine1'] as String,
    );

Map<String, dynamic> _$ShopCreateRequestToJson(ShopCreateRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'villageId': instance.villageId,
      'bankAccountNumbers': instance.bankAccountNumbers,
      'profileImageUrl': instance.profileImageUrl,
      'shopTypeId': instance.shopTypeId,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'addressLine1': instance.addressLine1,
    };
