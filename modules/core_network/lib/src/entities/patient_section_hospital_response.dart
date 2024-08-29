// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'patient_section_hospital_response.g.dart';

@JsonSerializable()
class PatientSectionHospitalResponse {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final DateTime? firstHope;
  final DateTime? secondHope;
  final DateTime? thirdHope;
  final bool? noDesiredDate;
  final String? remarks;

  PatientSectionHospitalResponse({
    this.id,
    this.name,
    this.firstHope,
    this.secondHope,
    this.thirdHope,
    this.noDesiredDate,
    this.remarks,
  });

  factory PatientSectionHospitalResponse.fromJson(Map<String, dynamic> json) =>
      _$PatientSectionHospitalResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PatientSectionHospitalResponseToJson(this);
}
