// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_budget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalRecordBudget _$MedicalRecordBudgetFromJson(Map<String, dynamic> json) =>
    MedicalRecordBudget(
      id: json['_id'] as String,
      budget: json['budget'] as int,
      remarks: json['remarks'] as String?,
      medicalRecord: json['medicalRecord'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$MedicalRecordBudgetToJson(
        MedicalRecordBudget instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'budget': instance.budget,
      'remarks': instance.remarks,
      'medicalRecord': instance.medicalRecord,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
