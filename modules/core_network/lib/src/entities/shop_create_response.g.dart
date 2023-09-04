// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_create_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopCreateResponse _$ShopCreateResponseFromJson(Map<String, dynamic> json) =>
    ShopCreateResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      village: Village.fromJson(json['village'] as Map<String, dynamic>),
      profileImageUrl: json['profileImageUrl'] as String,
      enabledTip: json['enabledTip'] as bool,
      enabled: json['enabled'] as bool,
      type: ShopType.fromJson(json['type'] as Map<String, dynamic>),
      bankAccounts: (json['bankAccounts'] as List<dynamic>?)
          ?.map((e) => BankAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      counters: (json['counters'] as List<dynamic>?)
          ?.map((e) => Counter.fromJson(e as Map<String, dynamic>))
          .toList(),
      addressLine1: json['addressLine1'] as String,
    );

Map<String, dynamic> _$ShopCreateResponseToJson(ShopCreateResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'village': instance.village,
      'profileImageUrl': instance.profileImageUrl,
      'enabledTip': instance.enabledTip,
      'enabled': instance.enabled,
      'bankAccounts': instance.bankAccounts,
      'type': instance.type,
      'addressLine1': instance.addressLine1,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'counters': instance.counters,
    };
