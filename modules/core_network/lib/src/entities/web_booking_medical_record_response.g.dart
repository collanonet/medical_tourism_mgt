// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_booking_medical_record_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebBookingMedicalRecordResponse _$WebBookingMedicalRecordResponseFromJson(
        Map<String, dynamic> json) =>
    WebBookingMedicalRecordResponse(
      id: json['_id'] as String,
      patientName: json['patientName'] as String?,
      patient: json['patient'] == null
          ? null
          : Patient.fromJson(json['patient'] as Map<String, dynamic>),
      hospital: json['hospital'] == null
          ? null
          : BasicInformationHospitalResponse.fromJson(
              json['hospital'] as Map<String, dynamic>),
      doctor: json['doctor'] == null
          ? null
          : DoctorProfileHospitalResponse.fromJson(
              json['doctor'] as Map<String, dynamic>),
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
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$WebBookingMedicalRecordResponseToJson(
        WebBookingMedicalRecordResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
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
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

ProposedDate _$ProposedDateFromJson(Map<String, dynamic> json) => ProposedDate(
      proposedDate: json['proposedDate'] == null
          ? null
          : DateTime.parse(json['proposedDate'] as String),
      selectMorningAfternoonAllDay:
          json['selectMorningAfternoonAllDay'] as String?,
      timeZoneFrom: json['timeZoneFrom'] as String?,
      timeZoneTo: json['timeZoneTo'] as String?,
      isConfirmed: json['isConfirmed'] as bool?,
    );

Map<String, dynamic> _$ProposedDateToJson(ProposedDate instance) =>
    <String, dynamic>{
      'proposedDate': instance.proposedDate?.toIso8601String(),
      'selectMorningAfternoonAllDay': instance.selectMorningAfternoonAllDay,
      'timeZoneFrom': instance.timeZoneFrom,
      'timeZoneTo': instance.timeZoneTo,
      'isConfirmed': instance.isConfirmed,
    };

MessageFrom _$MessageFromFromJson(Map<String, dynamic> json) => MessageFrom(
      message: json['message'] as String?,
      from: json['from'] as String?,
    );

Map<String, dynamic> _$MessageFromToJson(MessageFrom instance) =>
    <String, dynamic>{
      'message': instance.message,
      'from': instance.from,
    };
