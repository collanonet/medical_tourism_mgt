// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_update_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopUpdateRequest _$ShopUpdateRequestFromJson(Map<String, dynamic> json) =>
    ShopUpdateRequest(
      name: json['name'] as String,
      villageId: json['villageId'] as String,
      profileImageUrl: json['profileImageUrl'] as String,
      shopTypeId: json['shopTypeId'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
      addressLine1: json['addressLine1'] as String,
      timeOpen: json['timeOpen'] as String?,
      timeClose: json['timeClose'] as String?,
    );

Map<String, dynamic> _$ShopUpdateRequestToJson(ShopUpdateRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'villageId': instance.villageId,
      'profileImageUrl': instance.profileImageUrl,
      'shopTypeId': instance.shopTypeId,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'addressLine1': instance.addressLine1,
      'timeOpen': instance.timeOpen,
      'timeClose': instance.timeClose,
    };
