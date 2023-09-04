// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboard_business_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnboardBusinessRequest _$OnboardBusinessRequestFromJson(
        Map<String, dynamic> json) =>
    OnboardBusinessRequest(
      referenceData: json['referenceData'] as String,
      logoUrl: json['logoUrl'] as String?,
      name: json['name'] as String,
      bankAccountNumber: json['bankAccountNumber'] as String,
      nameType: $enumDecode(_$BusinessNameTypeEnumMap, json['nameType']),
      merchantType: json['merchantType'] as String,
      categoryId: json['categoryId'] as String,
      shopTypeId: json['shopTypeId'] as String,
      addressLine1: json['addressLine1'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      villageId: json['villageId'] as String,
      supportingDocument: (json['supportingDocument'] as List<dynamic>?)
          ?.map((e) => SupportingDocument.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OnboardBusinessRequestToJson(
        OnboardBusinessRequest instance) =>
    <String, dynamic>{
      'referenceData': instance.referenceData,
      'logoUrl': instance.logoUrl,
      'name': instance.name,
      'bankAccountNumber': instance.bankAccountNumber,
      'nameType': _$BusinessNameTypeEnumMap[instance.nameType]!,
      'merchantType': instance.merchantType,
      'categoryId': instance.categoryId,
      'shopTypeId': instance.shopTypeId,
      'addressLine1': instance.addressLine1,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'villageId': instance.villageId,
      'supportingDocument': instance.supportingDocument,
    };

const _$BusinessNameTypeEnumMap = {
  BusinessNameType.officeName: 'OFFICIAL_NAME',
  BusinessNameType.preferredName: 'PREFERRED_NAME',
  BusinessNameType.settlementAccountName: 'SETTLEMENT_ACCOUNT_NAME',
};
