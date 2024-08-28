// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'application_regenerative_medicine_response.g.dart';

@JsonSerializable()
class ApplicationRegenerativeMedicalResponse {
  @JsonKey(name: '_id')
  String id;
  bool? diseasePrevention;
  bool? relapsePrevention;
  bool? antiAging;
  bool? beauty;
  bool? increaseImmunity;
  DateTime? date1;
  DateTime? date2;
  DateTime? date3;
  bool? noDesiredDate;
  String? remarks;
  int? people;
  int? age;
  bool? sex;
  String? relationship;
  bool? atten;
  String? desiredArea;
  String? reason;
  bool? stemCellTherapy;
  bool? stemCellTherapy1;
  bool? stemCellTherapy2;
  String? freeInput;
  bool? fibroblastTherapy;
  bool? prpTherapy;
  String? others;
  String? currentlyConcerned;
  bool? medicine;
  bool? item1;
  bool? item2;
  bool? item3;
  bool? item4;
  bool? item5;
  String? others1;
  bool? receive1;
  bool? receive2;
  String? countryOther;
  String? brokerageCompany;
  bool? historyCancer;
  String? cancerSite;
  bool? currentHealth;
  String? detail;
  bool? currentHealth1;
  String? detail1;
  List<String>? nameDrug;
  bool? medicalInformation;
  bool? dicomImage;
  bool? otherTest;
  String? detail2;
  String? readio;
  bool? privetcy;

  ApplicationRegenerativeMedicalResponse({
    required this.id,
    this.diseasePrevention,
    this.relapsePrevention,
    this.antiAging,
    this.beauty,
    this.increaseImmunity,
    this.date1,
    this.date2,
    this.date3,
    this.noDesiredDate,
    this.remarks,
    this.people,
    this.age,
    this.sex,
    this.relationship,
    this.atten,
    this.desiredArea,
    this.reason,
    this.stemCellTherapy,
    this.stemCellTherapy1,
    this.stemCellTherapy2,
    this.freeInput,
    this.fibroblastTherapy,
    this.prpTherapy,
    this.others,
    this.currentlyConcerned,
    this.medicine,
    this.item1,
    this.item2,
    this.item3,
    this.item4,
    this.item5,
    this.others1,
    this.receive1,
    this.receive2,
    this.countryOther,
    this.brokerageCompany,
    this.historyCancer,
    this.cancerSite,
    this.currentHealth,
    this.detail,
    this.currentHealth1,
    this.detail1,
    this.nameDrug,
    this.medicalInformation,
    this.dicomImage,
    this.otherTest,
    this.detail2,
    this.readio,
    this.privetcy,
  });

  factory ApplicationRegenerativeMedicalResponse.fromJson(
      Map<String, dynamic> json) {
    return _$ApplicationRegenerativeMedicalResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ApplicationRegenerativeMedicalResponseToJson(this);
  }
}
