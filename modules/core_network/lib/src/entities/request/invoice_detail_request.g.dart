// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_detail_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceRequest _$InvoiceRequestFromJson(Map<String, dynamic> json) =>
    InvoiceRequest(
      documentationNumber: json['documentationNumber'] as String?,
      address: json['address'] as String?,
      title: json['title'] as String?,
      dateOfIssue: json['dateOfIssue'] == null
          ? null
          : DateTime.parse(json['dateOfIssue'] as String),
      prospects: json['prospects'] as String?,
      salesManagement: json['salesManagement'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$InvoiceRequestToJson(InvoiceRequest instance) =>
    <String, dynamic>{
      'documentationNumber': instance.documentationNumber,
      'address': instance.address,
      'title': instance.title,
      'dateOfIssue': instance.dateOfIssue?.toIso8601String(),
      'prospects': instance.prospects,
      'salesManagement': instance.salesManagement,
      'status': instance.status,
    };
