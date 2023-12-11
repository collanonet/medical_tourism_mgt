import 'package:json_annotation/json_annotation.dart';

part 'medical_record_oversea_request.g.dart';

@JsonSerializable()
class MedicalRecordOverseaRequest {
   String? medicalRecord;
   String? note;

  MedicalRecordOverseaRequest({
     this.medicalRecord,
     this.note,
  });

  factory MedicalRecordOverseaRequest.fromJson(Map<String, dynamic> json) {
    return _$MedicalRecordOverseaRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicalRecordOverseaRequestToJson(this);
}
