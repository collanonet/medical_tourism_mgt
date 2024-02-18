import 'booking_date_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'web_booking_medical_record_request.g.dart';

@JsonSerializable()
class WebBookingMedicalRecordRequest {
  String? message;
  String? medicalInstitutionName;
  String? doctorName;
  List<BookingDate> candidateDate;
  String? medicalRecord;

  WebBookingMedicalRecordRequest({
    this.message,
    this.medicalInstitutionName,
    this.doctorName,
    required this.candidateDate,
    this.medicalRecord,
  });
}
