// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_visa_companion_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalVisaCompanionResponse _$MedicalVisaCompanionResponseFromJson(
        Map<String, dynamic> json) =>
    MedicalVisaCompanionResponse(
      id: json['_id'] as String,
      seatNumber: json['seatNumber'] as String?,
      remarks: json['remarks'] as String?,
      remarks2: json['remarks2'] as String?,
    );

Map<String, dynamic> _$MedicalVisaCompanionResponseToJson(
        MedicalVisaCompanionResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'seatNumber': instance.seatNumber,
      'remarks': instance.remarks,
      'remarks2': instance.remarks2,
    };
