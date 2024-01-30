import 'package:json_annotation/json_annotation.dart';

part 'patient_name_request.g.dart';

@JsonSerializable()
class PatientNameRequest {
  String familyNameRomanized;
  String middleNameRomanized;
  String firstNameRomanized;
  String familyNameChineseOrVietnamese;
  String middleNameChineseOrVietnamese;
  String firstNameChineseOrVietnamese;
  String familyNameJapaneseForChinese;
  String middleNameJapaneseForChinese;
  String firstNameJapaneseForChinese;
  String familyNameJapaneseForNonChinese;
  String middleNameJapaneseForNonChinese;
  String firstNameJapaneseForNonChinese;
  String? patient;

  PatientNameRequest({
    required this.familyNameRomanized,
    required this.middleNameRomanized,
    required this.firstNameRomanized,
    required this.familyNameChineseOrVietnamese,
    required this.middleNameChineseOrVietnamese,
    required this.firstNameChineseOrVietnamese,
    required this.familyNameJapaneseForChinese,
    required this.middleNameJapaneseForChinese,
    required this.firstNameJapaneseForChinese,
    required this.familyNameJapaneseForNonChinese,
    required this.middleNameJapaneseForNonChinese,
    required this.firstNameJapaneseForNonChinese,
    this.patient,
  });

  factory PatientNameRequest.fromJson(Map<String, dynamic> json) {
    return _$PatientNameRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PatientNameRequestToJson(this);
}
