// Package imports:
import 'package:json_annotation/json_annotation.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'patient_name.g.dart';

@JsonSerializable()
class PatientName {
  @JsonKey(name: '_id')
  final String id;
  String patient;
  final DateTime createdAt;
  final DateTime updatedAt;

  // New fields
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

  PatientName({
    required this.id,
    required this.patient,
    required this.createdAt,
    required this.updatedAt,
    // New fields
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
  });

  factory PatientName.fromJson(Map<String, dynamic> json) {
    return _$PatientNameFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PatientNameToJson(this);
}
