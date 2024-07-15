// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_filter_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceFilterResponse _$InvoiceFilterResponseFromJson(
        Map<String, dynamic> json) =>
    InvoiceFilterResponse(
      id: json['_id'] as String,
      nameOfHospital: json['nameOfHospital'] as String?,
      agentName: json['agentName'] as String?,
      patientName: json['patientName'] as String?,
      issueDateFrom: json['issueDateFrom'] == null
          ? null
          : DateTime.parse(json['issueDateFrom'] as String),
      issueDateTo: json['issueDateTo'] == null
          ? null
          : DateTime.parse(json['issueDateTo'] as String),
      invoice: json['invoice'] as String?,
      prospects: json['prospects'] as String?,
    );

Map<String, dynamic> _$InvoiceFilterResponseToJson(
        InvoiceFilterResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'nameOfHospital': instance.nameOfHospital,
      'agentName': instance.agentName,
      'patientName': instance.patientName,
      'issueDateFrom': instance.issueDateFrom?.toIso8601String(),
      'issueDateTo': instance.issueDateTo?.toIso8601String(),
      'invoice': instance.invoice,
      'prospects': instance.prospects,
    };
