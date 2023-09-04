// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_overview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessOverview _$BusinessOverviewFromJson(Map<String, dynamic> json) =>
    BusinessOverview(
      totalShop: json['totalShop'] as int,
      totalCounter: json['totalCounter'] as int,
      totalStaff: json['totalStaff'] as int,
    );

Map<String, dynamic> _$BusinessOverviewToJson(BusinessOverview instance) =>
    <String, dynamic>{
      'totalShop': instance.totalShop,
      'totalCounter': instance.totalCounter,
      'totalStaff': instance.totalStaff,
    };
