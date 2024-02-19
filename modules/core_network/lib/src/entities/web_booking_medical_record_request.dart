import 'booking_date_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'web_booking_medical_record_request.g.dart';

@JsonSerializable()
class WebBookingMedicalRecordRequest {
  String? message;
  String? medicalInstitutionName;
  String? doctorName;
  List<BookingDateRequest> candidateDate;
  String medicalRecord;
  String patient;

  WebBookingMedicalRecordRequest({
    this.message,
    this.medicalInstitutionName,
    this.doctorName,
    required this.candidateDate,
    required this.medicalRecord,
    required this.patient,
  });

  factory WebBookingMedicalRecordRequest.fromJson(Map<String, dynamic> json) {
    return _$WebBookingMedicalRecordRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WebBookingMedicalRecordRequestToJson(this);
}
