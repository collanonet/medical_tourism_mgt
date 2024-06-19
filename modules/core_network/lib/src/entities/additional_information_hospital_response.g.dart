// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'additional_information_hospital_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdditionalInformationSectionResponse
    _$AdditionalInformationSectionResponseFromJson(Map<String, dynamic> json) =>
        AdditionalInformationSectionResponse(
          id: json['_id'] as String,
          hospital: json['hospital'] as String?,
          signed: json['signed'] as String,
          notConcluded: json['notConcluded'] as String,
          canBe: json['canBe'] as String,
          none: json['none'] as String,
          referralFee: json['referralFee'] as num,
          remark: json['remark'] as String,
          paymentSite: json['paymentSite'] as String,
          endOfNextMonth: json['endOfNextMonth'] as String,
        );

Map<String, dynamic> _$AdditionalInformationSectionResponseToJson(
        AdditionalInformationSectionResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'hospital': instance.hospital,
      'signed': instance.signed,
      'notConcluded': instance.notConcluded,
      'canBe': instance.canBe,
      'none': instance.none,
      'referralFee': instance.referralFee,
      'remark': instance.remark,
      'paymentSite': instance.paymentSite,
      'endOfNextMonth': instance.endOfNextMonth,
    };
