import 'package:json_annotation/json_annotation.dart';

part 'medical_record.g.dart';

@JsonSerializable()
class MedicalRecord {
  @JsonKey(name: '_id')
  final String id;
   DateTime arrivalDate;
   DateTime examinationDate;
   DateTime departureDate;
   String caseNumber;
   DateTime receptionDate;
   String type;
   String progress;
   DateTime advancePaymentDate;
   String paymentMethod;
   String? memo;
   String patient;
  final DateTime createdAt;
  final DateTime updatedAt;

  MedicalRecord({
    required this.id,
    required this.arrivalDate,
    required this.examinationDate,
    required this.departureDate,
    required this.caseNumber,
    required this.receptionDate,
    required this.type,
    required this.progress,
    required this.advancePaymentDate,
    required this.paymentMethod,
    this.memo,
    required this.patient,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MedicalRecord.fromJson(Map<String, dynamic> json) {
    return _$MedicalRecordFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicalRecordToJson(this);
}
