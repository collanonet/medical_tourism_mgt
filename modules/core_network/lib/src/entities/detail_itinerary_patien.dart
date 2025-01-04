// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'detail_itinerary_patien.g.dart';
@JsonSerializable()
class PatientItinerary {
  @JsonKey(name: '_id')
  final String? id;
  DateTime? dateOfBirth;
  int? age;
  bool? gender;
  List<String>? type;
  bool? isClosed;
  String? prePatient;
  String? user;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? version; // __v
  String? familyNameChineseOrVietnamese;
  String? familyNameJapaneseForChinese;
  String? familyNameJapaneseForNonChinese;
  String? familyNameRomanized;
  String? firstNameChineseOrVietnamese;
  String? firstNameJapaneseForChinese;
  String? firstNameJapaneseForNonChinese;
  String? firstNameRomanized;
  String? middleNameChineseOrVietnamese;
  String? middleNameJapaneseForChinese;
  String? middleNameJapaneseForNonChinese;
  String? middleNameRomanized;
  String? nationality;
  DateTime? dateOfEntry;
  DateTime? medicalDay;
  String? progress;
  String? proposalNumber;
  DateTime? returnDate;
  String? companyAGENTS;
  String? nameInKanaAGENTS;
  String? nameInKanjiAGENTS;

  PatientItinerary({
   required this.id,
    this.dateOfBirth,
    this.age,
    this.gender,
    this.type,
    this.isClosed,
    this.prePatient,
    this.user,
    this.createdAt,
    this.updatedAt,
    this.version,
    this.familyNameChineseOrVietnamese,
    this.familyNameJapaneseForChinese,
    this.familyNameJapaneseForNonChinese,
    this.familyNameRomanized,
    this.firstNameChineseOrVietnamese,
    this.firstNameJapaneseForChinese,
    this.firstNameJapaneseForNonChinese,
    this.firstNameRomanized,
    this.middleNameChineseOrVietnamese,
    this.middleNameJapaneseForChinese,
    this.middleNameJapaneseForNonChinese,
    this.middleNameRomanized,
    this.nationality,
    this.dateOfEntry,
    this.medicalDay,
    this.progress,
    this.proposalNumber,
    this.returnDate,
    this.companyAGENTS,
    this.nameInKanaAGENTS,
    this.nameInKanjiAGENTS,
  });

  factory PatientItinerary.fromJson(Map<String, dynamic> json) => _$PatientItineraryFromJson(json);
  Map<String, dynamic> toJson() => _$PatientItineraryToJson(this);

}
