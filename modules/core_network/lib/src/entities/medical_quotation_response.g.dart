// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_quotation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalQuotationResponse _$MedicalQuotationResponseFromJson(
        Map<String, dynamic> json) =>
    MedicalQuotationResponse(
      id: json['_id'] as String,
      fileName: json['fileName'] as String?,
      quotationNumber: json['quotationNumber'] as String?,
      quotationDate: json['quotationDate'] == null
          ? null
          : DateTime.parse(json['quotationDate'] as String),
      registrationNumber: json['registrationNumber'] as String?,
      subject: json['subject'] as String?,
      totalAmount: (json['totalAmount'] as num?)?.toDouble(),
      validityPeriod: json['validityPeriod'] == null
          ? null
          : DateTime.parse(json['validityPeriod'] as String),
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

Map<String, dynamic> _$MedicalQuotationResponseToJson(
        MedicalQuotationResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'fileName': instance.fileName,
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
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
