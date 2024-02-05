import 'package:json_annotation/json_annotation.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'medical_record_companion.g.dart';

@JsonSerializable()
class MedicalRecordCompanion {
  @JsonKey(name: '_id')
  final String id;
  String? remarks;
  bool? leader;
  String? nameInRomanized;
  String? nameInChineseOrKanji;
  String? nameInJapaneseKanji;
  String? nameInKana;
  String? nationality;
  String? relationship;
  DateTime? dateOfBirth;
  int? age;
  bool? gender;
  String? passportNumber;
  DateTime? issueDate;
  DateTime? expirationDate;
  String? visaType;
  String medicalRecord;
  final DateTime createdAt;
  final DateTime updatedAt;

  MedicalRecordCompanion({
    required this.id,
    this.remarks,
    this.leader,
    this.nameInRomanized,
    this.nameInChineseOrKanji,
    this.nameInJapaneseKanji,
    this.nameInKana,
    this.nationality,
    this.relationship,
    this.dateOfBirth,
    this.age,
    this.gender,
    this.passportNumber,
    this.issueDate,
    this.expirationDate,
    this.visaType,
    required this.medicalRecord,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MedicalRecordCompanion.fromJson(Map<String, dynamic> json) {
    return _$MedicalRecordCompanionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicalRecordCompanionToJson(this);
}
