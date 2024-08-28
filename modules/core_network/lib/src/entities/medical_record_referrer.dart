// Package imports:
import 'package:json_annotation/json_annotation.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'medical_record_referrer.g.dart';

@JsonSerializable()
class MedicalRecordReferrer {
  @JsonKey(name: '_id')
  final String id;
   String company;
   String nameInKanji;
   String nameInKana;
   String medicalRecord;
  final DateTime createdAt;
  final DateTime updatedAt;

  MedicalRecordReferrer({
    required this.id,
    required this.company,
    required this.nameInKanji,
    required this.nameInKana,
    required this.medicalRecord,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MedicalRecordReferrer.fromJson(Map<String, dynamic> json) {
    return _$MedicalRecordReferrerFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicalRecordReferrerToJson(this);

  static FormGroup buildFormGroup(MedicalRecordReferrer? medicalRecordReferrer) {
    return FormGroup({
      'id': FormControl<String>(value: medicalRecordReferrer?.id),
      'company': FormControl<String>(value: medicalRecordReferrer?.company),
      'nameInKanji': FormControl<String>(
          value: medicalRecordReferrer?.nameInKanji),
      'nameInKana': FormControl<String>(
          value: medicalRecordReferrer?.nameInKana),
      'medicalRecord':
      FormControl<String>(value: medicalRecordReferrer?.medicalRecord),
      'createdAt': FormControl<DateTime>(value: medicalRecordReferrer?.createdAt),
      'updatedAt': FormControl<DateTime>(value: medicalRecordReferrer?.updatedAt),
    });
  }
}
