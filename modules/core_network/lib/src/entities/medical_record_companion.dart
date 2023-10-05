import 'package:json_annotation/json_annotation.dart';

part 'medical_record_companion.g.dart';

@JsonSerializable()
class MedicalRecordCompanion {
  @JsonKey(name: '_id')
  final String id;
   String nameInRomanized;
   String nameInChineseOrKanji;
   String nameInJapaneseKanji;
   String nameInKana;
   String nationality;
   String relationship;
   DateTime dateOfBirth;
   int age;
   String gender;
   String medicalRecord;
  final DateTime createdAt;
  final DateTime updatedAt;

  MedicalRecordCompanion({
    required this.id,
    required this.nameInRomanized,
    required this.nameInChineseOrKanji,
    required this.nameInJapaneseKanji,
    required this.nameInKana,
    required this.nationality,
    required this.relationship,
    required this.dateOfBirth,
    required this.age,
    required this.gender,
    required this.medicalRecord,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MedicalRecordCompanion.fromJson(Map<String, dynamic> json) {
    return _$MedicalRecordCompanionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicalRecordCompanionToJson(this);
}
