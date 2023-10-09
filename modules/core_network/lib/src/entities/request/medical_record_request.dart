import 'package:json_annotation/json_annotation.dart';

part 'medical_record_request.g.dart';

@JsonSerializable()
class MedicalRecordRequest {
  DateTime? dateOfBirth;
  int? age;
  String? gender;
  DateTime? arrivalDate;
  DateTime? examinationDate;
  DateTime? departureDate;
  String? caseNumber;
  DateTime? receptionDate;
  String? type;
  String? progress;
  DateTime? advancePaymentDate;
  String? paymentMethod;
  String? memo;
  String? patient;

  MedicalRecordRequest({
    this.dateOfBirth,
    this.age,
    this.gender,
    this.arrivalDate,
    this.examinationDate,
    this.departureDate,
    this.caseNumber,
    this.receptionDate,
    this.type,
    this.progress,
    this.advancePaymentDate,
    this.paymentMethod,
    this.memo,
    this.patient,
  });

  factory MedicalRecordRequest.fromJson(Map<String, dynamic> json) {
    return _$MedicalRecordRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicalRecordRequestToJson(this);

  int? get ageCal {
    if (dateOfBirth != null) {
      final now = DateTime.now();
      final age = now.year - dateOfBirth!.year;
      if (now.month < dateOfBirth!.month ||
          (now.month == dateOfBirth!.month && now.day < dateOfBirth!.day)) {
        return age - 1;
      }
      return age;
    }
    return null;
  }
}
