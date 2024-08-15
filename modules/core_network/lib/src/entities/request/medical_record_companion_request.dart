import 'package:json_annotation/json_annotation.dart';

part 'medical_record_companion_request.g.dart';

@JsonSerializable()
class MedicalRecordCompanionRequest {
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
  String? chatQrImage;
  String? medicalRecord;

  MedicalRecordCompanionRequest({
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
    this.medicalRecord,
    this.chatQrImage,
  });

  factory MedicalRecordCompanionRequest.fromJson(Map<String, dynamic> json) {
    return _$MedicalRecordCompanionRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicalRecordCompanionRequestToJson(this);
}
