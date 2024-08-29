// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'medical_record_hospital_request.g.dart';

@JsonSerializable()
class MedicalRecordHospitalRequest {
   String? hospitalName;
   String? medicalCardNumber;
   String? medicalRecord;

  MedicalRecordHospitalRequest({
     this.hospitalName,
     this.medicalCardNumber,
     this.medicalRecord,
  });

  factory MedicalRecordHospitalRequest.fromJson(Map<String, dynamic> json) {
    return _$MedicalRecordHospitalRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicalRecordHospitalRequestToJson(this);
}
