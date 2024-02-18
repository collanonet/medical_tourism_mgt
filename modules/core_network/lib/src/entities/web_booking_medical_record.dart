import 'booking_date_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'web_booking_medical_record.g.dart';

@JsonSerializable()
class WebBookingMedicalRecordResponse {
  @JsonKey(name: '_id')
  final String id;
  String? message;
  String? medicalInstitutionName;
  String? doctorName;
  List<BookingDate> candidateDate;
  String medicalRecord;
  final DateTime createdAt;
  final DateTime updatedAt;

  WebBookingMedicalRecordResponse({
    required this.id,
    this.message,
    this.medicalInstitutionName,
    this.doctorName,
    required this.candidateDate,
    required this.medicalRecord,
    required this.createdAt,
    required this.updatedAt,
  });
}
