// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceResponse _$InvoiceResponseFromJson(Map<String, dynamic> json) =>
    InvoiceResponse(
      id: json['_id'] as String,
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

Map<String, dynamic> _$InvoiceResponseToJson(InvoiceResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'documentationNumber': instance.documentationNumber,
      'address': instance.address,
      'title': instance.title,
      'dateOfIssue': instance.dateOfIssue?.toIso8601String(),
      'prospects': instance.prospects,
      'salesManagement': instance.salesManagement,
      'status': instance.status,
    };
