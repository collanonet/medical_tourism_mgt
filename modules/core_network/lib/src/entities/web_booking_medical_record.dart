import '../../entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'web_booking_medical_record.g.dart';

@Deprecated('Use WebBookingMedicalRecord instead')
@JsonSerializable()
class WebBookingMedicalRecord {
  @JsonKey(name: '_id')
  final String id;
  String? message;
  String? medicalInstitutionName;
  String? doctorName;
  List<BookingDateResponse> candidateDate;
  DateTime? testCallDate;
  String? testCallTime;
  String medicalRecord;
  Patient patient;
  final DateTime createdAt;
  final DateTime updatedAt;

  WebBookingMedicalRecord({
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

  factory WebBookingMedicalRecord.fromJson(Map<String, dynamic> json) {
    return _$WebBookingMedicalRecordFromJson(json);
  }

  Map<String, dynamic> toJson() =>
      _$WebBookingMedicalRecordToJson(this);
}
