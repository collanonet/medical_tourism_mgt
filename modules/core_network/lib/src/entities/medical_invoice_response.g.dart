// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_invoice_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalInvoiceResponse _$MedicalInvoiceResponseFromJson(
        Map<String, dynamic> json) =>
    MedicalInvoiceResponse(
      id: json['_id'] as String,
      fileName: json['fileName'] as String?,
      invoiceNumber: json['invoiceNumber'] as String?,
      invoiceDate: json['invoiceDate'] == null
          ? null
          : DateTime.parse(json['invoiceDate'] as String),
      contact: json['contact'] as String?,
      registrationNumber: json['registrationNumber'] as String?,
      subject: json['subject'] as String?,
      amountBilled: (json['amountBilled'] as num?)?.toDouble(),
      paymentDeadline: json['paymentDeadline'] == null
          ? null
          : DateTime.parse(json['paymentDeadline'] as String),
      bankTransferInformation: json['bankTransferInformation'] as String?,
      remarks: json['remarks'] as String?,
      medicalRecord:
          MedicalRecord.fromJson(json['medicalRecord'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : Patient.fromJson(json['user'] as Map<String, dynamic>),
      hospitalRecord: json['hospitalRecord'] == null
          ? null
          : BasicInformationHospitalResponse.fromJson(
              json['hospitalRecord'] as Map<String, dynamic>),
      totalPayment: (json['totalPayment'] as List<dynamic>?)
          ?.map((e) => TotalPaymentResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      item: (json['item'] as List<dynamic>?)
          ?.map((e) => ItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$MedicalInvoiceResponseToJson(
        MedicalInvoiceResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'fileName': instance.fileName,
      'invoiceNumber': instance.invoiceNumber,
      'invoiceDate': instance.invoiceDate?.toIso8601String(),
      'contact': instance.contact,
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
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

TotalPaymentResponse _$TotalPaymentResponseFromJson(
        Map<String, dynamic> json) =>
    TotalPaymentResponse(
      id: json['_id'] as String,
      taxRate: (json['taxRate'] as num?)?.toDouble(),
      amountExcludingTaxInYen:
          (json['amountExcludingTaxInYen'] as num?)?.toDouble(),
      consumptionTaxAmountInYen:
          (json['consumptionTaxAmountInYen'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TotalPaymentResponseToJson(
        TotalPaymentResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'taxRate': instance.taxRate,
      'amountExcludingTaxInYen': instance.amountExcludingTaxInYen,
      'consumptionTaxAmountInYen': instance.consumptionTaxAmountInYen,
    };

ItemResponse _$ItemResponseFromJson(Map<String, dynamic> json) => ItemResponse(
      id: json['_id'] as String,
      transactionDate: json['transactionDate'] == null
          ? null
          : DateTime.parse(json['transactionDate'] as String),
      details: json['details'] as String?,
      quantity: (json['quantity'] as num?)?.toDouble(),
      unit: json['unit'] as String?,
      unitPrice: (json['unitPrice'] as num?)?.toDouble(),
      amount: (json['amount'] as num?)?.toDouble(),
      taxRate: (json['taxRate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ItemResponseToJson(ItemResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'transactionDate': instance.transactionDate?.toIso8601String(),
      'details': instance.details,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'unitPrice': instance.unitPrice,
      'amount': instance.amount,
      'taxRate': instance.taxRate,
    };
