// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estimate_invoice_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EstimateInvoiceRequest _$EstimateInvoiceRequestFromJson(
        Map<String, dynamic> json) =>
    EstimateInvoiceRequest(
      uploadFile: json['uploadFile'] as String?,
      documentName: json['documentName'] as String?,
      publisher: json['publisher'] as String?,
      dateOfIssue: json['dateOfIssue'] == null
          ? null
          : DateTime.parse(json['dateOfIssue'] as String),
      dateOfPayment: json['dateOfPayment'] == null
          ? null
          : DateTime.parse(json['dateOfPayment'] as String),
      paymentDay: json['paymentDay'] == null
          ? null
          : DateTime.parse(json['paymentDay'] as String),
      methodOfPayment: json['methodOfPayment'] as String?,
      agentRecord: json['agentRecord'] as String,
    );

Map<String, dynamic> _$EstimateInvoiceRequestToJson(
        EstimateInvoiceRequest instance) =>
    <String, dynamic>{
      'uploadFile': instance.uploadFile,
      'documentName': instance.documentName,
      'publisher': instance.publisher,
      'dateOfIssue': instance.dateOfIssue?.toIso8601String(),
      'dateOfPayment': instance.dateOfPayment?.toIso8601String(),
      'paymentDay': instance.paymentDay?.toIso8601String(),
      'methodOfPayment': instance.methodOfPayment,
      'agentRecord': instance.agentRecord,
    };
