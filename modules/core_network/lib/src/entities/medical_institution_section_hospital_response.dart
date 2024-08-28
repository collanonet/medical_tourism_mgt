// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'medical_institution_section_hospital_response.g.dart';

@JsonSerializable()
class MedicalInstitutionSectionHospitalResponse {
  @JsonKey(name: '_id')
  String? id;
  String doctorName;
  bool moon;
  bool fire;
  bool water;
  bool wood;
  bool money;
  bool soil;
  bool day;

  MedicalInstitutionSectionHospitalResponse({
    this.id,
    required this.doctorName,
    this.moon = false,
    this.fire = false,
    this.water = false,
    this.wood = false,
    this.money = false,
    this.soil = false,
    this.day = false,
  });

  factory MedicalInstitutionSectionHospitalResponse.fromJson(
          Map<String, dynamic> json) =>
      _$MedicalInstitutionSectionHospitalResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MedicalInstitutionSectionHospitalResponseToJson(this);
}
