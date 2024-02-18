import 'package:json_annotation/json_annotation.dart';

part 'booking_date_request.g.dart';

@JsonSerializable()
class BookingDate {

  DateTime? preferredDate;
  String? choice;
  String? timePeriodFrom;
  String? timePeriodTo;
  String? medicalRecord;

  BookingDate({
    this.medicalInstitutionName,
    this.doctorName,
    this.preferredDate,
    this.choice,
    this.timePeriodFrom,
    this.timePeriodTo,
    this.medicalRecord,
  });
}