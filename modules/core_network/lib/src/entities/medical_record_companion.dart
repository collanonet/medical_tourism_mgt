import 'package:json_annotation/json_annotation.dart';
part 'medical_record_companion.g.dart';

@JsonSerializable()
class MedicalRecordCompanion {
  @JsonKey(name: '_id')
  final String id;
  bool? leader;
  String? remarks;
  String? familyNameRomanized;
  String? middleNameRomanized;
  String? firstNameRomanized;
  String? familyNameChineseOrVietnamese;
  String? middleNameChineseOrVietnamese;
  String? firstNameChineseOrVietnamese;
  String? familyNameJapaneseForChinese;
  String? middleNameJapaneseForChinese;
  String? firstNameJapaneseForChinese;
  String? familyNameJapaneseForNonChinese;
  String? middleNameJapaneseForNonChinese;
  String? firstNameJapaneseForNonChinese;
  String? nationality;
  String? relationship;
  DateTime? dateOfBirth;
  int? age;
  bool? gender;
  String? mobileNumber;
  String? email;
  List<String?>? chatToolLink;
  String? passportNumber;
  DateTime? issueDate;
  DateTime? expirationDate;
  String? visaType;
  String medicalRecord;
  final DateTime createdAt;
  final DateTime updatedAt;

  MedicalRecordCompanion({
    required this.id,
    this.leader,
    this.remarks,
    this.familyNameRomanized,
    this.middleNameRomanized,
    this.firstNameRomanized,
    this.familyNameChineseOrVietnamese,
    this.middleNameChineseOrVietnamese,
    this.firstNameChineseOrVietnamese,
    this.familyNameJapaneseForChinese,
    this.middleNameJapaneseForChinese,
    this.firstNameJapaneseForChinese,
    this.familyNameJapaneseForNonChinese,
    this.middleNameJapaneseForNonChinese,
    this.firstNameJapaneseForNonChinese,
    this.nationality,
    this.relationship,
    this.dateOfBirth,
    this.age,
    this.gender,
    this.mobileNumber,
    this.email,
    this.chatToolLink,
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
