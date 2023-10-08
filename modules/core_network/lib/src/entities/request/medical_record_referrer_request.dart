import 'package:json_annotation/json_annotation.dart';

part 'medical_record_referrer_request.g.dart';

@JsonSerializable()
class MedicalRecordReferrerRequest {
   String? company;
   String? nameInKanji;
   String? nameInKana;
   String? medicalRecord;

  MedicalRecordReferrerRequest({
     this.company,
     this.nameInKanji,
     this.nameInKana,
     this.medicalRecord,
  });

  factory MedicalRecordReferrerRequest.fromJson(Map<String, dynamic> json) {
    return _$MedicalRecordReferrerRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicalRecordReferrerRequestToJson(this);
}
