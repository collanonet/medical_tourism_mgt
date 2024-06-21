import 'package:json_annotation/json_annotation.dart';

part 'medical_record_basic_info_hospital_response.g.dart';

@JsonSerializable()
class MedicalRecordBasicInfoHospitalResponse {
  @JsonKey(name: '_id')
  String? id;
  String? hospital;
  DateTime dateOfUpdate;
  String departmentName;
  String nameKanji;
  String nameKana;
  String telephoneNumber;
  String email;
  String faxNumber;

  MedicalRecordBasicInfoHospitalResponse({
    this.id,
    this.hospital,
    required this.dateOfUpdate,
    required this.departmentName,
    required this.nameKanji,
    required this.nameKana,
    required this.telephoneNumber,
    required this.email,
    required this.faxNumber,
  });

  factory MedicalRecordBasicInfoHospitalResponse.fromJson(
          Map<String, dynamic> json) =>
      _$MedicalRecordBasicInfoHospitalResponseFromJson(json);
  Map<String, dynamic> toJson() =>
      _$MedicalRecordBasicInfoHospitalResponseToJson(this);
}
