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
    };
