import 'package:json_annotation/json_annotation.dart';

part 'medical_record_oversea_data_request.g.dart';

@JsonSerializable()
class MedicalRecordOverseaDataRequest {
   String? medicalRecord;
   String? note;

  MedicalRecordOverseaDataRequest({
     this.medicalRecord,
     this.note,
  });

  factory MedicalRecordOverseaDataRequest.fromJson(Map<String, dynamic> json) {
    return _$MedicalRecordOverseaDataRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicalRecordOverseaDataRequestToJson(this);
}
