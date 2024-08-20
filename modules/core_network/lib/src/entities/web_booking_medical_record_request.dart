import '../../core_network.dart';
import 'package:json_annotation/json_annotation.dart';

part 'web_booking_medical_record_request.g.dart';

@JsonSerializable()
class WebBookingMedicalRecordRequest {
  String? patientName;
  String? patient;
  String? hospital;
  String? doctor;
  String? message;
  List<ProposedDate>? proposedDates;
  DateTime? reservationConfirmationDate;
  String? timeZoneConfirmationFrom;
  String? timeZoneConfirmationTo;
  List<MessageFrom>? messageFrom;
  bool? isClosed;

  WebBookingMedicalRecordRequest({
    this.patientName,
    this.patient,
    this.hospital,
    this.doctor,
    this.message,
    this.proposedDates,
    this.reservationConfirmationDate,
    this.timeZoneConfirmationFrom,
    this.timeZoneConfirmationTo,
    this.messageFrom,
    this.isClosed,
  });

  factory WebBookingMedicalRecordRequest.fromJson(Map<String, dynamic> json) {
    return _$WebBookingMedicalRecordRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WebBookingMedicalRecordRequestToJson(this);
}
