import 'package:json_annotation/json_annotation.dart';

part 'medical_record_companion_request.g.dart';

@JsonSerializable()
class MedicalRecordCompanionRequest {
   String? nameInRomanized;
   String? nameInChineseOrKanji;
   String? nameInJapaneseKanji;
   String? nameInKana;
   String? nationality;
   String? relationship;
   DateTime? dateOfBirth;
   int? age;
   String? gender;
   String? medicalRecord;

  MedicalRecordCompanionRequest({
     this.nameInRomanized,
     this.nameInChineseOrKanji,
     this.nameInJapaneseKanji,
     this.nameInKana,
     this.nationality,
     this.relationship,
     this.dateOfBirth,
     this.age,
     this.gender,
     this.medicalRecord,
  });

  factory MedicalRecordCompanionRequest.fromJson(Map<String, dynamic> json) {
    return _$MedicalRecordCompanionRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicalRecordCompanionRequestToJson(this);
}
