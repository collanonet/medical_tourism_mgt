// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_booking_medical_record_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WebBookingMedicalRecordResponseCWProxy {
  WebBookingMedicalRecordResponse id(String id);

  WebBookingMedicalRecordResponse patientName(String? patientName);

  WebBookingMedicalRecordResponse patient(Patient? patient);

  WebBookingMedicalRecordResponse hospital(
      BasicInformationHospitalResponse? hospital);

  WebBookingMedicalRecordResponse doctor(DoctorProfileHospitalResponse? doctor);

  WebBookingMedicalRecordResponse proposedDates(
      List<ProposedDate>? proposedDates);

  WebBookingMedicalRecordResponse reservationConfirmationDate(
      DateTime? reservationConfirmationDate);

  WebBookingMedicalRecordResponse timeZoneConfirmationFrom(
      String? timeZoneConfirmationFrom);

  WebBookingMedicalRecordResponse timeZoneConfirmationTo(
      String? timeZoneConfirmationTo);

  WebBookingMedicalRecordResponse messageFrom(List<MessageFrom>? messageFrom);

  WebBookingMedicalRecordResponse isClosed(bool? isClosed);

  WebBookingMedicalRecordResponse testCallDate(DateTime? testCallDate);

  WebBookingMedicalRecordResponse testCallTime(String? testCallTime);

  WebBookingMedicalRecordResponse createdAt(DateTime createdAt);

  WebBookingMedicalRecordResponse updatedAt(DateTime updatedAt);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WebBookingMedicalRecordResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WebBookingMedicalRecordResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  WebBookingMedicalRecordResponse call({
    String? id,
    String? patientName,
    Patient? patient,
    BasicInformationHospitalResponse? hospital,
    DoctorProfileHospitalResponse? doctor,
    List<ProposedDate>? proposedDates,
    DateTime? reservationConfirmationDate,
    String? timeZoneConfirmationFrom,
    String? timeZoneConfirmationTo,
    List<MessageFrom>? messageFrom,
    bool? isClosed,
    DateTime? testCallDate,
    String? testCallTime,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWebBookingMedicalRecordResponse.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWebBookingMedicalRecordResponse.copyWith.fieldName(...)`
class _$WebBookingMedicalRecordResponseCWProxyImpl
    implements _$WebBookingMedicalRecordResponseCWProxy {
  const _$WebBookingMedicalRecordResponseCWProxyImpl(this._value);

  final WebBookingMedicalRecordResponse _value;

  @override
  WebBookingMedicalRecordResponse id(String id) => this(id: id);

  @override
  WebBookingMedicalRecordResponse patientName(String? patientName) =>
      this(patientName: patientName);

  @override
  WebBookingMedicalRecordResponse patient(Patient? patient) =>
      this(patient: patient);

  @override
  WebBookingMedicalRecordResponse hospital(
          BasicInformationHospitalResponse? hospital) =>
      this(hospital: hospital);

  @override
  WebBookingMedicalRecordResponse doctor(
          DoctorProfileHospitalResponse? doctor) =>
      this(doctor: doctor);

  @override
  WebBookingMedicalRecordResponse proposedDates(
          List<ProposedDate>? proposedDates) =>
      this(proposedDates: proposedDates);

  @override
  WebBookingMedicalRecordResponse reservationConfirmationDate(
          DateTime? reservationConfirmationDate) =>
      this(reservationConfirmationDate: reservationConfirmationDate);

  @override
  WebBookingMedicalRecordResponse timeZoneConfirmationFrom(
          String? timeZoneConfirmationFrom) =>
      this(timeZoneConfirmationFrom: timeZoneConfirmationFrom);

  @override
  WebBookingMedicalRecordResponse timeZoneConfirmationTo(
          String? timeZoneConfirmationTo) =>
      this(timeZoneConfirmationTo: timeZoneConfirmationTo);

  @override
  WebBookingMedicalRecordResponse messageFrom(List<MessageFrom>? messageFrom) =>
      this(messageFrom: messageFrom);

  @override
  WebBookingMedicalRecordResponse isClosed(bool? isClosed) =>
      this(isClosed: isClosed);

  @override
  WebBookingMedicalRecordResponse testCallDate(DateTime? testCallDate) =>
      this(testCallDate: testCallDate);

  @override
  WebBookingMedicalRecordResponse testCallTime(String? testCallTime) =>
      this(testCallTime: testCallTime);

  @override
  WebBookingMedicalRecordResponse createdAt(DateTime createdAt) =>
      this(createdAt: createdAt);

  @override
  WebBookingMedicalRecordResponse updatedAt(DateTime updatedAt) =>
      this(updatedAt: updatedAt);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WebBookingMedicalRecordResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WebBookingMedicalRecordResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  WebBookingMedicalRecordResponse call({
    Object? id = const $CopyWithPlaceholder(),
    Object? patientName = const $CopyWithPlaceholder(),
    Object? patient = const $CopyWithPlaceholder(),
    Object? hospital = const $CopyWithPlaceholder(),
    Object? doctor = const $CopyWithPlaceholder(),
    Object? proposedDates = const $CopyWithPlaceholder(),
    Object? reservationConfirmationDate = const $CopyWithPlaceholder(),
    Object? timeZoneConfirmationFrom = const $CopyWithPlaceholder(),
    Object? timeZoneConfirmationTo = const $CopyWithPlaceholder(),
    Object? messageFrom = const $CopyWithPlaceholder(),
    Object? isClosed = const $CopyWithPlaceholder(),
    Object? testCallDate = const $CopyWithPlaceholder(),
    Object? testCallTime = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
  }) {
    return WebBookingMedicalRecordResponse(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      patientName: patientName == const $CopyWithPlaceholder()
          ? _value.patientName
          // ignore: cast_nullable_to_non_nullable
          : patientName as String?,
      patient: patient == const $CopyWithPlaceholder()
          ? _value.patient
          // ignore: cast_nullable_to_non_nullable
          : patient as Patient?,
      hospital: hospital == const $CopyWithPlaceholder()
          ? _value.hospital
          // ignore: cast_nullable_to_non_nullable
          : hospital as BasicInformationHospitalResponse?,
      doctor: doctor == const $CopyWithPlaceholder()
          ? _value.doctor
          // ignore: cast_nullable_to_non_nullable
          : doctor as DoctorProfileHospitalResponse?,
      proposedDates: proposedDates == const $CopyWithPlaceholder()
          ? _value.proposedDates
          // ignore: cast_nullable_to_non_nullable
          : proposedDates as List<ProposedDate>?,
      reservationConfirmationDate:
          reservationConfirmationDate == const $CopyWithPlaceholder()
              ? _value.reservationConfirmationDate
              // ignore: cast_nullable_to_non_nullable
              : reservationConfirmationDate as DateTime?,
      timeZoneConfirmationFrom:
          timeZoneConfirmationFrom == const $CopyWithPlaceholder()
              ? _value.timeZoneConfirmationFrom
              // ignore: cast_nullable_to_non_nullable
              : timeZoneConfirmationFrom as String?,
      timeZoneConfirmationTo:
          timeZoneConfirmationTo == const $CopyWithPlaceholder()
              ? _value.timeZoneConfirmationTo
              // ignore: cast_nullable_to_non_nullable
              : timeZoneConfirmationTo as String?,
      messageFrom: messageFrom == const $CopyWithPlaceholder()
          ? _value.messageFrom
          // ignore: cast_nullable_to_non_nullable
          : messageFrom as List<MessageFrom>?,
      isClosed: isClosed == const $CopyWithPlaceholder()
          ? _value.isClosed
          // ignore: cast_nullable_to_non_nullable
          : isClosed as bool?,
      testCallDate: testCallDate == const $CopyWithPlaceholder()
          ? _value.testCallDate
          // ignore: cast_nullable_to_non_nullable
          : testCallDate as DateTime?,
      testCallTime: testCallTime == const $CopyWithPlaceholder()
          ? _value.testCallTime
          // ignore: cast_nullable_to_non_nullable
          : testCallTime as String?,
      createdAt: createdAt == const $CopyWithPlaceholder() || createdAt == null
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
      updatedAt: updatedAt == const $CopyWithPlaceholder() || updatedAt == null
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as DateTime,
    );
  }
}

extension $WebBookingMedicalRecordResponseCopyWith
    on WebBookingMedicalRecordResponse {
  /// Returns a callable class that can be used as follows: `instanceOfWebBookingMedicalRecordResponse.copyWith(...)` or like so:`instanceOfWebBookingMedicalRecordResponse.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WebBookingMedicalRecordResponseCWProxy get copyWith =>
      _$WebBookingMedicalRecordResponseCWProxyImpl(this);
}

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
      testCallDate: json['testCallDate'] == null
          ? null
          : DateTime.parse(json['testCallDate'] as String),
      testCallTime: json['testCallTime'] as String?,
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
      'testCallDate': instance.testCallDate?.toIso8601String(),
      'testCallTime': instance.testCallTime,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

ProposedDate _$ProposedDateFromJson(Map<String, dynamic> json) => ProposedDate(
      id: json['_id'] as String?,
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
      '_id': instance.id,
      'proposedDate': instance.proposedDate?.toIso8601String(),
      'selectMorningAfternoonAllDay': instance.selectMorningAfternoonAllDay,
      'timeZoneFrom': instance.timeZoneFrom,
      'timeZoneTo': instance.timeZoneTo,
      'isConfirmed': instance.isConfirmed,
    };

MessageFrom _$MessageFromFromJson(Map<String, dynamic> json) => MessageFrom(
      id: json['_id'] as String?,
      message: json['message'] as String?,
      from: json['from'] as String?,
    );

Map<String, dynamic> _$MessageFromToJson(MessageFrom instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'message': instance.message,
      'from': instance.from,
    };
