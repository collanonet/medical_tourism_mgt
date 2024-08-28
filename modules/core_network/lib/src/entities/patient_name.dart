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

  PatientName({
    required this.id,
    required this.patient,
    required this.createdAt,
    required this.updatedAt,
    // New fields
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
  });

  factory PatientName.fromJson(Map<String, dynamic> json) {
    return _$PatientNameFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PatientNameToJson(this);

  static FormGroup buildFormGroup(PatientName? patientName) {
    return FormGroup({
      'id': FormControl<String>(value: patientName?.id),
      'patient': FormControl<String>(value: patientName?.patient),
      'createdAt': FormControl<DateTime>(value: patientName?.createdAt),
      'updatedAt': FormControl<DateTime>(value: patientName?.updatedAt),
      // New fields
      'familyNameRomanized': FormControl<String>(value: patientName?.familyNameRomanized),
      'middleNameRomanized': FormControl<String>(value: patientName?.middleNameRomanized),
      'firstNameRomanized': FormControl<String>(value: patientName?.firstNameRomanized),
      'familyNameChineseOrVietnamese': FormControl<String>(value: patientName?.familyNameChineseOrVietnamese),
      'middleNameChineseOrVietnamese': FormControl<String>(value: patientName?.middleNameChineseOrVietnamese),
      'firstNameChineseOrVietnamese': FormControl<String>(value: patientName?.firstNameChineseOrVietnamese),
      'familyNameJapaneseForChinese': FormControl<String>(value: patientName?.familyNameJapaneseForChinese),
      'middleNameJapaneseForChinese': FormControl<String>(value: patientName?.middleNameJapaneseForChinese),
      'firstNameJapaneseForChinese': FormControl<String>(value: patientName?.firstNameJapaneseForChinese),
      'familyNameJapaneseForNonChinese': FormControl<String>(value: patientName?.familyNameJapaneseForNonChinese),
      'middleNameJapaneseForNonChinese': FormControl<String>(value: patientName?.middleNameJapaneseForNonChinese),
      'firstNameJapaneseForNonChinese': FormControl<String>(value: patientName?.firstNameJapaneseForNonChinese),
    });
  }
}
