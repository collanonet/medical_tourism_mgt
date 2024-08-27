import 'package:json_annotation/json_annotation.dart';

part 'doctor_profile_hospital_request.g.dart';

@JsonSerializable()
class DoctorProfileHospitalRequest {
  @JsonKey(name: '_id')
  String? id;
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
  String? fileDoctor;

  DoctorProfileHospitalRequest({
    this.id,
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
    this.fileDoctor,
  });

  factory DoctorProfileHospitalRequest.fromJson(Map<String, dynamic> json) =>
      _$DoctorProfileHospitalRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorProfileHospitalRequestToJson(this);
}

extension DoctorProfileHospitalRequestExtension
    on DoctorProfileHospitalRequest {
  DoctorProfileHospitalRequest copyWith({
    String? hospital,
    String? profile,
    String? photoRelease,
    String? name,
    String? remark,
    String? departmentName,
    String? post,
    String? specialty,
    String? nameKanji,
    String? nameKana,
    List<String>? affiliatedAcademicSociety,
    List<String>? qualifications,
    List<String>? completionCertificate,
    String? trainingCompletionCertificateNumber,
    String? onlineMedicalTreatment,
    String? telephoneNumber,
    String? faxNumber,
    String? email,
    String? remark2,
  }) {
    return DoctorProfileHospitalRequest(
      id: id,
      hospital: hospital ?? this.hospital,
      profile: profile ?? this.profile,
      photoRelease: photoRelease ?? this.photoRelease,
      name: name ?? this.name,
      remark: remark ?? this.remark,
      departmentName: departmentName ?? this.departmentName,
      post: post ?? this.post,
      specialty: specialty ?? this.specialty,
      nameKanji: nameKanji ?? this.nameKanji,
      nameKana: nameKana ?? this.nameKana,
      affiliatedAcademicSociety:
          affiliatedAcademicSociety ?? this.affiliatedAcademicSociety,
      qualifications: qualifications ?? this.qualifications,
      trainingCompletionCertificateNumber:
          trainingCompletionCertificateNumber ??
              this.trainingCompletionCertificateNumber,
      completionCertificate:
          completionCertificate ?? this.completionCertificate,
      onlineMedicalTreatment:
          onlineMedicalTreatment ?? this.onlineMedicalTreatment,
      telephoneNumber: telephoneNumber ?? this.telephoneNumber,
      faxNumber: faxNumber ?? this.faxNumber,
      email: email ?? this.email,
      remark2: remark2 ?? this.remark2,
    );
  }
}
