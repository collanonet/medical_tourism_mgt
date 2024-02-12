import 'package:json_annotation/json_annotation.dart';

part 'medical_record_patient_response_other.g.dart';

@JsonSerializable()
class MedicalRecordPatientResponseOther {
  @JsonKey(name: '_id')
  String id;
  bool? doYouHaveAValidVisa;
  String? visa;
  bool? requestingAPersonalGuaranteeForObtainingAMedicalVisa;
  String? remarks;
  bool? companionDoYouHaveAValidVisa;
  String? companionVisa;
  bool? companionRequestingAPersonalGuaranteeForObtainingAMedicalVisa;
  String medicalRecord;
  final DateTime createdAt;
  final DateTime updatedAt;

  MedicalRecordPatientResponseOther({
    required this.id,
    required this.doYouHaveAValidVisa,
    required this.visa,
    required this.requestingAPersonalGuaranteeForObtainingAMedicalVisa,
    required this.remarks,
    required this.companionDoYouHaveAValidVisa,
    required this.companionVisa,
    required this.companionRequestingAPersonalGuaranteeForObtainingAMedicalVisa,
    required this.medicalRecord,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MedicalRecordPatientResponseOther.fromJson(
      Map<String, dynamic> json) {
    return _$MedicalRecordPatientResponseOtherFromJson(json);
  }

  Map<String, dynamic> toJson() =>
      _$MedicalRecordPatientResponseOtherToJson(this);
}
