import 'booking_date_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'web_booking_medical_record_response.g.dart';

@JsonSerializable()
class WebBookingMedicalRecordResponse {
  @JsonKey(name: '_id')
  final String id;
  String? message;
  String? medicalInstitutionName;
  String? doctorName;
  List<BookingDateResponse> candidateDate;
  DateTime? testCallDate;
  String? testCallTime;
  String medicalRecord;
  String patient;
  final DateTime createdAt;
  final DateTime updatedAt;

  WebBookingMedicalRecordResponse({
    required this.id,
    this.message,
    this.medicalInstitutionName,
    this.doctorName,
    required this.candidateDate,
     this.testCallDate,
     this.testCallTime,
    required this.medicalRecord,
    required this.patient,
    required this.createdAt,
    required this.updatedAt,
  });

  factory WebBookingMedicalRecordResponse.fromJson(Map<String, dynamic> json) {
    return _$WebBookingMedicalRecordResponseFromJson(json);
  }

  Map<String, dynamic> toJson() =>
      _$WebBookingMedicalRecordResponseToJson(this);
}
