// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_process_chart_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientFilterResponse _$PatientFilterResponseFromJson(
        Map<String, dynamic> json) =>
    PatientFilterResponse(
      id: json['_id'] as String,
      patientName: json['patientName'] as String?,
      visa: json['visa'] as String?,
      report: json['report'] as String?,
      subjectsWithdrawal: json['subjectsWithdrawal'] as String?,
      refinementDate: json['refinementDate'] as String?,
      periodFrom: json['periodFrom'] == null
          ? null
          : DateTime.parse(json['periodFrom'] as String),
      periodTo: json['periodTo'] == null
          ? null
          : DateTime.parse(json['periodTo'] as String),
    );

Map<String, dynamic> _$PatientFilterResponseToJson(
        PatientFilterResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'patientName': instance.patientName,
      'visa': instance.visa,
      'report': instance.report,
      'subjectsWithdrawal': instance.subjectsWithdrawal,
      'refinementDate': instance.refinementDate,
      'periodFrom': instance.periodFrom?.toIso8601String(),
      'periodTo': instance.periodTo?.toIso8601String(),
    };
