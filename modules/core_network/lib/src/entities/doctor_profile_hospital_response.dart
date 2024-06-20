import 'package:json_annotation/json_annotation.dart';

part 'doctor_profile_hospital_response.g.dart';

@JsonSerializable()
class DoctorProfileHospitalResponse {
  @JsonKey(name: '_id')
  String id;
  String hospital;
  String? can;
  String? no;
  String? remark;
  String? departmentName;
  String? post;
  String? specialty;
  String? nameKanji;
  String? nameKana;
  List<String>? affiliatedAcademicSociety;
  List<String>? qualifications;
  String? trainingCompletionCertificateNumber;
  String? telephoneNumber;
  String? faxNumber;
  String? email;
  String? remark2;

  DoctorProfileHospitalResponse({
    required this.id,
    required this.hospital,
    this.can,
    this.no,
    this.remark,
    this.departmentName,
    this.post,
    this.specialty,
    this.nameKanji,
    this.nameKana,
    this.affiliatedAcademicSociety,
    this.qualifications,
    this.trainingCompletionCertificateNumber,
    this.telephoneNumber,
    this.faxNumber,
    this.email,
    this.remark2,
  });

  factory DoctorProfileHospitalResponse.fromJson(Map<String, dynamic> json) =>
      _$DoctorProfileHospitalResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorProfileHospitalResponseToJson(this);
}
