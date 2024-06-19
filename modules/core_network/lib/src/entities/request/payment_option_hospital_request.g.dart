// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_option_hospital_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentOptionHospitalRequest _$PaymentOptionHospitalRequestFromJson(
        Map<String, dynamic> json) =>
    PaymentOptionHospitalRequest(
      id: json['_id'] as String?,
      hospital: json['hospital'] as String?,
      payer: json['payer'] as String,
      paymentTiming: json['paymentTiming'] as String,
      feeBack: json['feeBack'] as String,
      paymentDirectlyToTheHospital:
          json['paymentDirectlyToTheHospital'] as String,
      transfer: json['transfer'] as bool,
      electronicPayment: json['electronicPayment'] as bool,
      alipay: json['alipay'] as bool,
      unionPayPay: json['unionPayPay'] as bool,
      unionPay: json['unionPay'] as bool,
      weChatPay: json['weChatPay'] as bool,
      creditCard: json['creditCard'] as bool,
      visa: json['visa'] as bool,
      masterCard: json['masterCard'] as bool,
      americanExpress: json['americanExpress'] as bool,
      jcb: json['jcb'] as bool,
      cash: json['cash'] as bool,
      remark: json['remark'] as String,
    );

Map<String, dynamic> _$PaymentOptionHospitalRequestToJson(
        PaymentOptionHospitalRequest instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'hospital': instance.hospital,
      'payer': instance.payer,
      'paymentTiming': instance.paymentTiming,
      'feeBack': instance.feeBack,
      'paymentDirectlyToTheHospital': instance.paymentDirectlyToTheHospital,
      'transfer': instance.transfer,
      'electronicPayment': instance.electronicPayment,
      'alipay': instance.alipay,
      'unionPayPay': instance.unionPayPay,
      'unionPay': instance.unionPay,
      'weChatPay': instance.weChatPay,
      'creditCard': instance.creditCard,
      'visa': instance.visa,
      'masterCard': instance.masterCard,
      'americanExpress': instance.americanExpress,
      'jcb': instance.jcb,
      'cash': instance.cash,
      'remark': instance.remark,
    };
