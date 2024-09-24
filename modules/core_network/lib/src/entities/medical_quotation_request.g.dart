// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_quotation_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalQuotationRequest _$MedicalQuotationRequestFromJson(
        Map<String, dynamic> json) =>
    MedicalQuotationRequest(
      file: json['file'] as String,
      quotationNumber: json['quotationNumber'] as String?,
      quotationDate: json['quotationDate'] == null
          ? null
          : DateTime.parse(json['quotationDate'] as String),
      registrationNumber: json['registrationNumber'] as String?,
      subject: json['subject'] as String?,
      totalAmount: json['totalAmount'] as String?,
      validityPeriod: json['validityPeriod'] == null
          ? null
          : DateTime.parse(json['validityPeriod'] as String),
      remarks: json['remarks'] as String?,
      medicalRecord: json['medicalRecord'] as String,
      user: json['user'] as String,
      hospitalRecord: json['hospitalRecord'] as String?,
      totalPayment: (json['totalPayment'] as List<dynamic>?)
          ?.map((e) => TotalPaymentRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      item: (json['item'] as List<dynamic>?)
          ?.map((e) => ItemRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MedicalQuotationRequestToJson(
        MedicalQuotationRequest instance) =>
    <String, dynamic>{
      'file': instance.file,
      'quotationNumber': instance.quotationNumber,
      'quotationDate': instance.quotationDate?.toIso8601String(),
      'registrationNumber': instance.registrationNumber,
      'subject': instance.subject,
      'totalAmount': instance.totalAmount,
      'validityPeriod': instance.validityPeriod?.toIso8601String(),
      'remarks': instance.remarks,
      'medicalRecord': instance.medicalRecord,
      'user': instance.user,
      'hospitalRecord': instance.hospitalRecord,
      'totalPayment': instance.totalPayment,
      'item': instance.item,
    };

TotalPaymentRequest _$TotalPaymentRequestFromJson(Map<String, dynamic> json) =>
    TotalPaymentRequest(
      taxRate: json['taxRate'] as String,
      amountExcludingTaxInYen: json['amountExcludingTaxInYen'] as String,
      consumptionTaxAmountInYen: json['consumptionTaxAmountInYen'] as String,
    );

Map<String, dynamic> _$TotalPaymentRequestToJson(
        TotalPaymentRequest instance) =>
    <String, dynamic>{
      'taxRate': instance.taxRate,
      'amountExcludingTaxInYen': instance.amountExcludingTaxInYen,
      'consumptionTaxAmountInYen': instance.consumptionTaxAmountInYen,
    };

ItemRequest _$ItemRequestFromJson(Map<String, dynamic> json) => ItemRequest(
      transactionDate: DateTime.parse(json['transactionDate'] as String),
      details: json['details'] as String?,
      quantity: json['quantity'] as String,
      unit: json['unit'] as String,
      unitPrice: json['unitPrice'] as String,
      amount: json['amount'] as String,
      taxRate: json['taxRate'] as String,
    );

Map<String, dynamic> _$ItemRequestToJson(ItemRequest instance) =>
    <String, dynamic>{
      'transactionDate': instance.transactionDate.toIso8601String(),
      'details': instance.details,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'unitPrice': instance.unitPrice,
      'amount': instance.amount,
      'taxRate': instance.taxRate,
    };
