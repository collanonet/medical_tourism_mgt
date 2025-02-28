// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'patient_name_request.g.dart';

@JsonSerializable()
class PatientNameRequest {
  String familyNameRomanized;
  String? middleNameRomanized;
  String firstNameRomanized;
  String? familyNameChineseOrVietnamese;
  String? middleNameChineseOrVietnamese;
  String? firstNameChineseOrVietnamese;
  String? familyNameJapaneseForChinese;
  String? middleNameJapaneseForChinese;
  String? firstNameJapaneseForChinese;
  String? familyNameJapaneseForNonChinese;
  String? middleNameJapaneseForNonChinese;
  String? firstNameJapaneseForNonChinese;
  String? patient;

  PatientNameRequest({
    required this.familyNameRomanized,
    this.middleNameRomanized,
    required this.firstNameRomanized,
    this.familyNameChineseOrVietnamese,
    this.middleNameChineseOrVietnamese,
    this.firstNameChineseOrVietnamese,
    this.familyNameJapaneseForChinese,
    this.middleNameJapaneseForChinese,
    this.firstNameJapaneseForChinese,
    this.familyNameJapaneseForNonChinese,
    this.middleNameJapaneseForNonChinese,
    this.firstNameJapaneseForNonChinese,
    this.patient,
  });

  factory PatientNameRequest.fromJson(Map<String, dynamic> json) {
    return _$PatientNameRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PatientNameRequestToJson(this);
}
