// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'additional_information_hospital_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdditionalInformationSectionResponse
    _$AdditionalInformationSectionResponseFromJson(Map<String, dynamic> json) =>
        AdditionalInformationSectionResponse(
          id: json['_id'] as String,
          hospital: json['hospital'] as String,
          outsourcingContract: json['outsourcingContract'] as String?,
          contract: (json['contract'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList(),
          msCorporation: json['msCorporation'] as String?,
          referralFee: json['referralFee'] as String?,
          treatmentCostPointCalculationPerPoint:
              json['treatmentCostPointCalculationPerPoint'] as String?,
          remark: json['remark'] as String?,
          paymentSiteTighten: json['paymentSiteTighten'] as String?,
          paymentSitePayment: json['paymentSitePayment'] as String?,
          files: (json['files'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
        );

Map<String, dynamic> _$AdditionalInformationSectionResponseToJson(
        AdditionalInformationSectionResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'hospital': instance.hospital,
      'outsourcingContract': instance.outsourcingContract,
      'contract': instance.contract,
      'msCorporation': instance.msCorporation,
      'referralFee': instance.referralFee,
      'treatmentCostPointCalculationPerPoint':
          instance.treatmentCostPointCalculationPerPoint,
      'remark': instance.remark,
      'paymentSiteTighten': instance.paymentSiteTighten,
      'paymentSitePayment': instance.paymentSitePayment,
      'files': instance.files,
    };
