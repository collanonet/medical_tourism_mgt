// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'medical_record_request.g.dart';

@JsonSerializable()
class MedicalRecordRequest {
  DateTime? dateOfBirth;
  int? age;
  int? height;
  int? weight;
  bool? gender;
  DateTime? arrivalDate;
  DateTime? consultationDate;
  DateTime? returnDate;
  String? proposalNumber;
  DateTime? receptionDate;
  List<String?>? type;
  String? progress;
  DateTime? advancePaymentDate;
  String? receivingMethod;

  String? memo;
  String patient;

  MedicalRecordRequest({
    this.dateOfBirth,
    this.age,
    this.height,
    this.weight,
    this.gender,
    this.arrivalDate,
    this.consultationDate,
    this.returnDate,
    this.proposalNumber,
    this.receptionDate,
    this.type,
    this.progress,
    this.advancePaymentDate,
    this.receivingMethod,
    this.memo,
    required this.patient,
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
