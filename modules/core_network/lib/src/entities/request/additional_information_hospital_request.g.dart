// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'additional_information_hospital_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdditionalInformationSectionRequest
    _$AdditionalInformationSectionRequestFromJson(Map<String, dynamic> json) =>
        AdditionalInformationSectionRequest(
          id: json['_id'] as String?,
          hospital: json['hospital'] as String,
          outsourcingContract: json['outsourcingContract'] as String?,
          contract: (json['contract'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
          msCorporation: json['msCorporation'] as String?,
          referralFee: json['referralFee'] as String?,
          treatmentCostPointCalculationPerPoint:
              json['treatmentCostPointCalculationPerPoint'] as String?,
          remark: json['remark'] as String?,
          paymentSiteTighten: json['paymentSiteTighten'] as String?,
          paymentSitePayment: json['paymentSitePayment'] as String?,
        );

Map<String, dynamic> _$AdditionalInformationSectionRequestToJson(
        AdditionalInformationSectionRequest instance) =>
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
    };
