// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Counter _$CounterFromJson(Map<String, dynamic> json) => Counter(
      id: json['id'] as String,
      name: json['name'] as String,
      enabled: json['enabled'] as bool,
      qrCodes: (json['qrCodes'] as List<dynamic>?)
          ?.map((e) => QrCode.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CounterToJson(Counter instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'enabled': instance.enabled,
      'qrCodes': instance.qrCodes,
    };
