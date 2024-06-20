import 'package:json_annotation/json_annotation.dart';

part 'doctor_profile_hospital_response.g.dart';

@JsonSerializable()
class DoctorProfileHospitalResponse {
  @JsonKey(name: '_id')
  String id;
  String hospital;
  String? profile;
  String? photoRelease;
  String? name;
  String? remark;
  String? departmentName;
  String? post;
  String? specialty;
  String? nameKanji;
  String? nameKana;
  List<String>? affiliatedAcademicSociety;
  List<String>? qualifications;
  String? onlineMedicalTreatment;
  String? trainingCompletionCertificateNumber;
  List<String>? completionCertificate;
  String? telephoneNumber;
  String? faxNumber;
  String? email;
  String? remark2;

  DoctorProfileHospitalResponse({
    required this.id,
    required this.hospital,
    this.profile,
    this.photoRelease,
    this.name,
    this.remark,
    this.departmentName,
    this.post,
    this.specialty,
    this.nameKanji,
    this.nameKana,
    this.affiliatedAcademicSociety,
    this.qualifications,
    this.onlineMedicalTreatment,
    this.trainingCompletionCertificateNumber,
    this.completionCertificate,
    this.telephoneNumber,
    this.faxNumber,
    this.email,
    this.remark2,
  });

  factory DoctorProfileHospitalResponse.fromJson(Map<String, dynamic> json) =>
      _$DoctorProfileHospitalResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorProfileHospitalResponseToJson(this);
}
