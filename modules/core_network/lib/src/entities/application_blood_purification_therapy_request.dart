import 'package:json_annotation/json_annotation.dart';
part 'application_blood_purification_therapy_request.g.dart';

@JsonSerializable()
class ApplicationBloodPurificationTherapyRequest {
  bool? purposeOfCommission1;
  bool? purposeOfCommission2;
  bool? purposeOfCommission3;
  bool? purposeOfCommission4;
  bool? purposeOfCommission5;
  DateTime? date1;
  DateTime? date2;
  DateTime? date3;
  bool? noDate;
  String? remarks;
  int? people;
  int? age;
  bool? sex;
  String? relationship;
  bool? attend;
  String? desiredArea;
  String? reason;
  bool? menu1;
  bool? menu2;
  bool? menu3;
  String? others;
  String? concern;
  bool? question;
  bool? item1;
  bool? item2;
  bool? item3;
  String? others1;
  bool? pleaceReceive1;
  bool? pleaceReceive2;
  String? otherCountry;
  String? introducer;
  bool? historyCancer;
  String? cancerSite;
  bool? treatmentDetail;
  String? detail;
  bool? treatmentDetail1;
  String? detail1;
  List<String>? drugName;
  bool? dicom;
  bool? otherTestData;
  String? detail2;
  bool? privetcy;
  String? ifwoman;
  String? medicalRecord;

  ApplicationBloodPurificationTherapyRequest({
    this.purposeOfCommission1,
    this.purposeOfCommission2,
    this.purposeOfCommission3,
    this.purposeOfCommission4,
    this.purposeOfCommission5,
    this.date1,
    this.date2,
    this.date3,
    this.noDate,
    this.remarks,
    this.people,
    this.age,
    this.sex,
    this.relationship,
    this.attend,
    this.desiredArea,
    this.reason,
    this.menu1,
    this.menu2,
    this.menu3,
    this.others,
    this.concern,
    this.question,
    this.item1,
    this.item2,
    this.item3,
    this.others1,
    this.pleaceReceive1,
    this.pleaceReceive2,
    this.otherCountry,
    this.introducer,
    this.historyCancer,
    this.cancerSite,
    this.treatmentDetail,
    this.detail,
    this.treatmentDetail1,
    this.detail1,
    this.drugName,
    this.dicom,
    this.otherTestData,
    this.detail2,
    this.privetcy,
    this.ifwoman,
    required this.medicalRecord,
  });

  factory ApplicationBloodPurificationTherapyRequest.fromJson(
      Map<String, dynamic> json) {
    return _$ApplicationBloodPurificationTherapyRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ApplicationBloodPurificationTherapyRequestToJson(this);
  }
}
