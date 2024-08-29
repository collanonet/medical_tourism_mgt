// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'booking_date_response.g.dart';

@JsonSerializable()
class BookingDateResponse {
  @JsonKey(name: '_id')
  final String id;
  DateTime? preferredDate;
  String? choice;
  String? timePeriodFrom;
  String? timePeriodTo;
  String medicalRecord;
  final DateTime createdAt;
  final DateTime updatedAt;

  BookingDateResponse({
    required this.id,
    this.preferredDate,
    this.choice,
    this.timePeriodFrom,
    this.timePeriodTo,
    required this.medicalRecord,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BookingDateResponse.fromJson(Map<String, dynamic> json) {
    return _$BookingDateResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BookingDateResponseToJson(this);
}
