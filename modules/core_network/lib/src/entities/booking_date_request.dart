// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'booking_date_request.g.dart';

@JsonSerializable()
class BookingDateRequest {
  DateTime? preferredDate;
  String? choice;
  String? timePeriodFrom;
  String? timePeriodTo;
  String? medicalRecord;

  BookingDateRequest({
    this.preferredDate,
    this.choice,
    this.timePeriodFrom,
    this.timePeriodTo,
    this.medicalRecord,
  });

  factory BookingDateRequest.fromJson(Map<String, dynamic> json) {
    return _$BookingDateRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BookingDateRequestToJson(this);
}
