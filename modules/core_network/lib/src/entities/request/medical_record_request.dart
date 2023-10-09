import 'package:json_annotation/json_annotation.dart';

part 'medical_record_request.g.dart';

@JsonSerializable()
class MedicalRecordRequest {
  DateTime? dateOfBirth;
  int? age;
  String? gender;
  String? arrivalDate;
  String? examinationDate;
  String? departureDate;
  String? caseNumber;
  String? receptionDate;
  String? type;
  String? progress;
  String? advancePaymentDate;
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
}
