// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'medical_record_patient_response_other_request.g.dart';

@JsonSerializable()
class MedicalRecordPatientResponseOtherRequest {
  bool? doYouHaveAValidVisa;
  String? visa;
  bool? requestingAPersonalGuaranteeForObtainingAMedicalVisa;
  String? remarks;
  bool? companionDoYouHaveAValidVisa;
  String? companionVisa;
  bool? companionRequestingAPersonalGuaranteeForObtainingAMedicalVisa;
  String medicalRecord;

  MedicalRecordPatientResponseOtherRequest({
    required this.doYouHaveAValidVisa,
    required this.visa,
    required this.requestingAPersonalGuaranteeForObtainingAMedicalVisa,
    required this.remarks,
    required this.companionDoYouHaveAValidVisa,
    required this.companionVisa,
    required this.companionRequestingAPersonalGuaranteeForObtainingAMedicalVisa,
    required this.medicalRecord,
  });

  factory MedicalRecordPatientResponseOtherRequest.fromJson(
      Map<String, dynamic> json) {
    return _$MedicalRecordPatientResponseOtherRequestFromJson(json);
  }

  Map<String, dynamic> toJson() =>
      _$MedicalRecordPatientResponseOtherRequestToJson(this);
}
