// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'web_booking_patient_preferred_date.g.dart';

@JsonSerializable()
class WebBookingPatientPreferredDate {
  @JsonKey(name: '_id')
  final String id;
  DateTime? preferredDate1;
  DateTime? preferredDate2;
  DateTime? preferredDate3;
  bool noDesiredDate;
  String? remarks;
  String medicalRecord;
  final DateTime createdAt;
  final DateTime updatedAt;

  WebBookingPatientPreferredDate({
    required this.id,
    this.preferredDate1,
    this.preferredDate2,
    this.preferredDate3,
    required this.noDesiredDate,
    this.remarks,
    required this.medicalRecord,
    required this.createdAt,
    required this.updatedAt,
  });

  factory WebBookingPatientPreferredDate.fromJson(Map<String, dynamic> json) {
    return _$WebBookingPatientPreferredDateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WebBookingPatientPreferredDateToJson(this);
}

