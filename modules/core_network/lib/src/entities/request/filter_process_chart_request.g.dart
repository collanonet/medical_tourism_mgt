// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_process_chart_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientFilterRequst _$PatientFilterRequstFromJson(Map<String, dynamic> json) =>
    PatientFilterRequst(
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

Map<String, dynamic> _$PatientFilterRequstToJson(
        PatientFilterRequst instance) =>
    <String, dynamic>{
      'patientName': instance.patientName,
      'visa': instance.visa,
      'report': instance.report,
      'subjectsWithdrawal': instance.subjectsWithdrawal,
      'refinementDate': instance.refinementDate,
      'periodFrom': instance.periodFrom?.toIso8601String(),
      'periodTo': instance.periodTo?.toIso8601String(),
    };
