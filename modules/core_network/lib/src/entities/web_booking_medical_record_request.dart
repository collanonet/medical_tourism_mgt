// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import '../../core_network.dart';

part 'web_booking_medical_record_request.g.dart';

@JsonSerializable()
class WebBookingMedicalRecordRequest {
  String? patientName;
  String? patient;
  String? hospital;
  String? doctor;
  List<ProposedDate>? proposedDates;
  DateTime? reservationConfirmationDate;
  String? timeZoneConfirmationFrom;
  String? timeZoneConfirmationTo;
  List<MessageFrom>? messageFrom;
  bool? isClosed;
  DateTime? testCallDate;
  String? testCallTime;
  DateTime? desiredDate1;
  DateTime? desiredDate2;
  DateTime? desiredDate3;
  String? reason;

  WebBookingMedicalRecordRequest({
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
    this.desiredDate1,
    this.desiredDate2,
    this.desiredDate3,
    this.reason,
  });

  factory WebBookingMedicalRecordRequest.fromJson(Map<String, dynamic> json) {
    return _$WebBookingMedicalRecordRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WebBookingMedicalRecordRequestToJson(this);
}
