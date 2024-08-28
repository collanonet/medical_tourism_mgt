// Package imports:
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import '../../core_network.dart';

part 'web_booking_medical_record_response.g.dart';

@JsonSerializable()
@CopyWith()
class WebBookingMedicalRecordResponse {
  @JsonKey(name: '_id')
  final String id;
  String? patientName;
  Patient? patient;
  BasicInformationHospitalResponse? hospital;
  DoctorProfileHospitalResponse? doctor;
  List<ProposedDate>? proposedDates;
  DateTime? reservationConfirmationDate;
  String? timeZoneConfirmationFrom;
  String? timeZoneConfirmationTo;
  List<MessageFrom>? messageFrom;
  bool? isClosed;
  DateTime? testCallDate;
  String? testCallTime;
  final DateTime createdAt;
  final DateTime updatedAt;

  WebBookingMedicalRecordResponse({
    required this.id,
    this.patientName,
    this.patient,
    this.hospital,
    this.doctor,
    this.proposedDates,
    this.reservationConfirmationDate,
    this.timeZoneConfirmationFrom,
    this.timeZoneConfirmationTo,
    this.messageFrom,
    this.isClosed,
    this.testCallDate,
    this.testCallTime,
    required this.createdAt,
    required this.updatedAt,
  });

  factory WebBookingMedicalRecordResponse.fromJson(Map<String, dynamic> json) {
    return _$WebBookingMedicalRecordResponseFromJson(json);
  }

  Map<String, dynamic> toJson() =>
      _$WebBookingMedicalRecordResponseToJson(this);
}

@JsonSerializable()
class ProposedDate {
  @JsonKey(name: '_id')
  String? id;
  DateTime? proposedDate;
  String? selectMorningAfternoonAllDay;
  String? timeZoneFrom;
  String? timeZoneTo;
  bool? isConfirmed;

  ProposedDate({
    this.id,
    this.proposedDate,
    this.selectMorningAfternoonAllDay,
    this.timeZoneFrom,
    this.timeZoneTo,
    this.isConfirmed,
  });

  factory ProposedDate.fromJson(Map<String, dynamic> json) {
    return _$ProposedDateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProposedDateToJson(this);
}

@JsonSerializable()
class MessageFrom {
  @JsonKey(name: '_id')
  String? id;
  String? message;
  String? from;

  MessageFrom({
    this.id,
    this.message,
    this.from,
  });

  factory MessageFrom.fromJson(Map<String, dynamic> json) {
    return _$MessageFromFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MessageFromToJson(this);
}
