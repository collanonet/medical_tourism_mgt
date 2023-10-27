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
  String? gender;
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

  static FormGroup buildFormGroup(
      MedicalRecordCompanion? medicalRecordCompanion) {
    return FormGroup({
      'id': FormControl<String>(value: medicalRecordCompanion?.id),
      'nameInRomanized':
          FormControl<String>(value: medicalRecordCompanion?.nameInRomanized),
      'nameInChineseOrKanji': FormControl<String>(
          value: medicalRecordCompanion?.nameInChineseOrKanji),
      'nameInJapaneseKanji': FormControl<String>(
          value: medicalRecordCompanion?.nameInJapaneseKanji),
      'nameInKana':
          FormControl<String>(value: medicalRecordCompanion?.nameInKana),
      'nationality':
          FormControl<String>(value: medicalRecordCompanion?.nationality),
      'relationship':
          FormControl<String>(value: medicalRecordCompanion?.relationship),
      'dateOfBirth':
          FormControl<DateTime>(value: medicalRecordCompanion?.dateOfBirth),
      'age': FormControl<int>(value: medicalRecordCompanion?.age),
      'gender': FormControl<String>(value: medicalRecordCompanion?.gender),
      'medicalRecord':
          FormControl<String>(value: medicalRecordCompanion?.medicalRecord),
      'createdAt':
          FormControl<DateTime>(value: medicalRecordCompanion?.createdAt),
      'updatedAt':
          FormControl<DateTime>(value: medicalRecordCompanion?.updatedAt),
    });
  }
}
