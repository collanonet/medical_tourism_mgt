// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_booking_medical_record_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebBookingMedicalRecordRequest _$WebBookingMedicalRecordRequestFromJson(
        Map<String, dynamic> json) =>
    WebBookingMedicalRecordRequest(
      patientName: json['patientName'] as String?,
      patient: json['patient'] as String?,
      hospital: json['hospital'] as String?,
      doctor: json['doctor'] as String?,
      proposedDates: (json['proposedDates'] as List<dynamic>?)
          ?.map((e) => ProposedDate.fromJson(e as Map<String, dynamic>))
          .toList(),
      reservationConfirmationDate: json['reservationConfirmationDate'] == null
          ? null
          : DateTime.parse(json['reservationConfirmationDate'] as String),
      timeZoneConfirmationFrom: json['timeZoneConfirmationFrom'] as String?,
      timeZoneConfirmationTo: json['timeZoneConfirmationTo'] as String?,
      messageFrom: (json['messageFrom'] as List<dynamic>?)
          ?.map((e) => MessageFrom.fromJson(e as Map<String, dynamic>))
          .toList(),
      isClosed: json['isClosed'] as bool?,
      testCallDate: json['testCallDate'] == null
          ? null
          : DateTime.parse(json['testCallDate'] as String),
      testCallTime: json['testCallTime'] as String?,
      desiredDate1: json['desiredDate1'] == null
          ? null
          : DateTime.parse(json['desiredDate1'] as String),
      desiredDate2: json['desiredDate2'] == null
          ? null
          : DateTime.parse(json['desiredDate2'] as String),
      desiredDate3: json['desiredDate3'] == null
          ? null
          : DateTime.parse(json['desiredDate3'] as String),
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$WebBookingMedicalRecordRequestToJson(
        WebBookingMedicalRecordRequest instance) =>
    <String, dynamic>{
      'patientName': instance.patientName,
      'patient': instance.patient,
      'hospital': instance.hospital,
      'doctor': instance.doctor,
      'proposedDates': instance.proposedDates,
      'reservationConfirmationDate':
          instance.reservationConfirmationDate?.toIso8601String(),
      'timeZoneConfirmationFrom': instance.timeZoneConfirmationFrom,
      'timeZoneConfirmationTo': instance.timeZoneConfirmationTo,
      'messageFrom': instance.messageFrom,
      'isClosed': instance.isClosed,
      'testCallDate': instance.testCallDate?.toIso8601String(),
      'testCallTime': instance.testCallTime,
      'desiredDate1': instance.desiredDate1?.toIso8601String(),
      'desiredDate2': instance.desiredDate2?.toIso8601String(),
      'desiredDate3': instance.desiredDate3?.toIso8601String(),
      'reason': instance.reason,
    };
