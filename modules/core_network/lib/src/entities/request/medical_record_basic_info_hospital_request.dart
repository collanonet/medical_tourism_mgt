import 'package:json_annotation/json_annotation.dart';

part 'medical_record_basic_info_hospital_request.g.dart';

@JsonSerializable()
class MedicalRecordBasicInfoHospitalRequest {
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

  MedicalRecordBasicInfoHospitalRequest({
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

  factory MedicalRecordBasicInfoHospitalRequest.fromJson(
          Map<String, dynamic> json) =>
      _$MedicalRecordBasicInfoHospitalRequestFromJson(json);
  Map<String, dynamic> toJson() =>
      _$MedicalRecordBasicInfoHospitalRequestToJson(this);
}

extension MedicalRecordBasicInfoHospitalRequestExtension
    on MedicalRecordBasicInfoHospitalRequest {
  MedicalRecordBasicInfoHospitalRequest copyWith({
    String? hospital,
    DateTime? dateOfUpdate,
    String? departmentName,
    String? nameKanji,
    String? nameKana,
    String? telephoneNumber,
    String? email,
    String? faxNumber,
  }) {
    return MedicalRecordBasicInfoHospitalRequest(
      id: id,
      hospital: hospital ?? this.hospital,
      dateOfUpdate: dateOfUpdate ?? this.dateOfUpdate,
      departmentName: departmentName ?? this.departmentName,
      nameKanji: nameKanji ?? this.nameKanji,
      nameKana: nameKana ?? this.nameKana,
      telephoneNumber: telephoneNumber ?? this.telephoneNumber,
      email: email ?? this.email,
      faxNumber: faxNumber ?? this.faxNumber,
    );
  }
}
