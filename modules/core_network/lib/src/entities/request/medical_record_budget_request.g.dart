// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_budget_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecordBudgetRequest _$MedicalRecordBudgetRequestFromJson(
        Map<String, dynamic> json) =>
    MedicalRecordBudgetRequest(
      budget: json['budget'] as int?,
      remarks: json['remarks'] as String?,
      medicalRecord: json['medicalRecord'] as String,
    );

Map<String, dynamic> _$MedicalRecordBudgetRequestToJson(
        MedicalRecordBudgetRequest instance) =>
    <String, dynamic>{
      'budget': instance.budget,
      'remarks': instance.remarks,
      'medicalRecord': instance.medicalRecord,
    };
