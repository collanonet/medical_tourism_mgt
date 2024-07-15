// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_filter_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceFilterRequest _$InvoiceFilterRequestFromJson(
        Map<String, dynamic> json) =>
    InvoiceFilterRequest(
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

Map<String, dynamic> _$InvoiceFilterRequestToJson(
        InvoiceFilterRequest instance) =>
    <String, dynamic>{
      'nameOfHospital': instance.nameOfHospital,
      'agentName': instance.agentName,
      'patientName': instance.patientName,
      'issueDateFrom': instance.issueDateFrom?.toIso8601String(),
      'issueDateTo': instance.issueDateTo?.toIso8601String(),
      'invoice': instance.invoice,
      'prospects': instance.prospects,
    };
