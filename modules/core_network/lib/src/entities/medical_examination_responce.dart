// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'medical_examination_responce.g.dart';

@JsonSerializable()
class MedicalExaminationResponse {
  @JsonKey(name: '_id')
  String id;
  DateTime? date1;
  DateTime? date2;
  DateTime? date3;
  bool? desiredDate;
  String? remarks;
  int? countpoeple;
  int? age;
  bool? sex;
  String? relationship;
  bool? attend;
  String? medicalName;
  String? reason;
  bool? petct;
  bool? mri;
  bool? gastroscope;
  String? freeinput;
  String? concern;
  String? uploadMedicalData;
  bool? privecy;

  MedicalExaminationResponse({
    required this.id,
    this.date1,
    this.date2,
    this.date3,
    this.desiredDate,
    this.remarks,
    this.countpoeple,
    this.age,
    this.sex,
    this.relationship,
    this.attend,
    this.medicalName,
    this.reason,
    this.petct,
    this.mri,
    this.gastroscope,
    this.freeinput,
    this.concern,
    this.privecy,
  });

  factory MedicalExaminationResponse.fromJson(Map<String, dynamic> json) {
    return _$MedicalExaminationResponseFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$MedicalExaminationResponseToJson(this);
  }
}
