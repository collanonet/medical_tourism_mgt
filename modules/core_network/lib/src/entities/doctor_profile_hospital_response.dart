import 'package:json_annotation/json_annotation.dart';

part 'doctor_profile_hospital_response.g.dart';

@JsonSerializable()
class DoctorProfileHospitalResponse {
  @JsonKey(name: '_id')
  String? id;
  String? hospital;
  String can;
  String no;
  String remark;
  String departmentName;
  String post;
  String specialty;
  String nameKanji;
  String nameKana;
  List<String> affiliatedAcademicSociety;
  List<String> qualifications;
  String trainingCompletionCertificateNumber;
  String telephoneNumber;
  String faxNumber;
  String email;
  String remark2;

  DoctorProfileHospitalResponse({
    this.id,
    this.hospital,
    required this.can,
    required this.no,
    required this.remark,
    required this.departmentName,
    required this.post,
    required this.specialty,
    required this.nameKanji,
    required this.nameKana,
    required this.affiliatedAcademicSociety,
    required this.qualifications,
    required this.trainingCompletionCertificateNumber,
    required this.telephoneNumber,
    required this.faxNumber,
    required this.email,
    required this.remark2,
  });

  factory DoctorProfileHospitalResponse.fromJson(Map<String, dynamic> json) =>
      _$DoctorProfileHospitalResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorProfileHospitalResponseToJson(this);
}
