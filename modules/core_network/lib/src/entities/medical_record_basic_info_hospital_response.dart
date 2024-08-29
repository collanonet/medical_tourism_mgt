// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'medical_record_basic_info_hospital_response.g.dart';

@JsonSerializable()
class MedicalRecordBasicInfoHospitalResponse {
  @JsonKey(name: '_id')
  String id;
  String hospital;
  DateTime? dateOfUpdate;
  String? departmentName;
  String? nameKanji;
  String? nameKana;
  String? telephoneNumber;
  String? email;
  String? faxNumber;

  MedicalRecordBasicInfoHospitalResponse({
    required this.id,
    required this.hospital,
    this.dateOfUpdate,
    this.departmentName,
    this.nameKanji,
    this.nameKana,
    this.telephoneNumber,
    this.email,
    this.faxNumber,
  });

  factory MedicalRecordBasicInfoHospitalResponse.fromJson(
          Map<String, dynamic> json) =>
      _$MedicalRecordBasicInfoHospitalResponseFromJson(json);
  Map<String, dynamic> toJson() =>
      _$MedicalRecordBasicInfoHospitalResponseToJson(this);
}
