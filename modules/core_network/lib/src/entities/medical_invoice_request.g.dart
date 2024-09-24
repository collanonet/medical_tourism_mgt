// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_invoice_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalInvoiceRequest _$MedicalInvoiceRequestFromJson(
        Map<String, dynamic> json) =>
    MedicalInvoiceRequest(
      file: json['file'] as String?,
      invoiceNumber: json['invoiceNumber'] as String?,
      invoiceDate: json['invoiceDate'] == null
          ? null
          : DateTime.parse(json['invoiceDate'] as String),
      registrationNumber: json['registrationNumber'] as String?,
      subject: json['subject'] as String?,
      amountBilled: (json['amountBilled'] as num?)?.toDouble(),
      paymentDeadline: json['paymentDeadline'] == null
          ? null
          : DateTime.parse(json['paymentDeadline'] as String),
      bankTransferInformation: json['bankTransferInformation'] as String?,
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

Map<String, dynamic> _$MedicalInvoiceRequestToJson(
        MedicalInvoiceRequest instance) =>
    <String, dynamic>{
      'file': instance.file,
      'invoiceNumber': instance.invoiceNumber,
      'invoiceDate': instance.invoiceDate?.toIso8601String(),
      'registrationNumber': instance.registrationNumber,
      'subject': instance.subject,
      'amountBilled': instance.amountBilled,
      'paymentDeadline': instance.paymentDeadline?.toIso8601String(),
      'bankTransferInformation': instance.bankTransferInformation,
      'remarks': instance.remarks,
      'medicalRecord': instance.medicalRecord,
      'user': instance.user,
      'hospitalRecord': instance.hospitalRecord,
      'totalPayment': instance.totalPayment,
      'item': instance.item,
    };
