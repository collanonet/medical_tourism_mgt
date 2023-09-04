// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shop _$ShopFromJson(Map<String, dynamic> json) => Shop(
      id: json['id'] as String,
      name: json['name'] as String,
      enabled: json['enabled'] as bool,
      enabledTip: json['enabledTip'] as bool,
      type: ShopType.fromJson(json['type'] as Map<String, dynamic>),
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      addressLine1: json['addressLine1'] as String?,
      counters: (json['counters'] as List<dynamic>)
          .map((e) => Counter.fromJson(e as Map<String, dynamic>))
          .toList(),
      bankAccounts: (json['bankAccounts'] as List<dynamic>?)
          ?.map((e) => BankAccountCompact.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShopToJson(Shop instance) => <String, dynamic>{
      'id': instance.id,
      'enabled': instance.enabled,
      'enabledTip': instance.enabledTip,
      'type': instance.type,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'addressLine1': instance.addressLine1,
      'counters': instance.counters,
      'bankAccounts': instance.bankAccounts,
      'name': instance.name,
    };
