// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'patient.g.dart';

@JsonSerializable()
class Patient {
  @JsonKey(name: '_id')
  final String id;
  DateTime? dateOfBirth;
  int? age;
  bool? gender;

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
  String? companyAGENTS;
  String? nameInKanjiAGENTS;
  String? nameInKanaAGENTS;
  String? progress;
  String? proposalNumber;
  List<String?>? type;
  DateTime? dateOfEntry;
  DateTime? medicalDay;
  DateTime? returnDate;
  String? nationality;
  String? diseaseName;
  String? salesStaff;
  String? businessStaff;
  String? acceptingHospital;
  String? groupSize;
  String? profile;
  bool isClosed;
  String user;

  final DateTime createdAt;
  final DateTime updatedAt;

  Patient({
    required this.id,
    this.dateOfBirth,
    this.age,
    this.gender,
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
    this.companyAGENTS,
    this.nameInKanjiAGENTS,
    this.nameInKanaAGENTS,
    this.progress,
    this.proposalNumber,
    this.type,
    this.dateOfEntry,
    this.medicalDay,
    this.returnDate,
    this.nationality,
    this.diseaseName,
    this.salesStaff,
    this.businessStaff,
    this.acceptingHospital,
    this.groupSize,
    this.profile,
    this.isClosed = false,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return _$PatientFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PatientToJson(this);
}
