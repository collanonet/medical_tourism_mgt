import 'package:json_annotation/json_annotation.dart';

part 'basic_information_hospital_request.g.dart';

@JsonSerializable()
class BasicInformationHospitalRequest {
  @JsonKey(name: '_id')
  String? id;
  DateTime dateOfUpdate;
  String updater;
  String memo;
  String updates;
  String hospitalNameChinese;
  String hospitalNameKatakana;
  String zipCode;
  String location;
  String googleMap;
  String phoneNumber;
  String faxNumber;
  String homepage;
  bool supportedMenu;
  bool healthCheckup;
  bool treatment;
  bool heavyIonBeam;
  bool protonBeam;
  bool regenerativeMedicine;
  bool beauty;
  bool phone;
  bool fax;
  bool mail;
  bool line;
  String note;
  bool english;
  bool chinese;
  bool vietnamese;
  bool otherLanguages;
  String languages;
  String onlineCheck;
  String appointment;
  bool cdr;
  bool storageUrl;
  bool viewMyPage;
  bool mailAttachment;
  bool loanerTablet;
  bool jmip;
  bool jci;
  bool jih;
  bool ningenDoctor;
  bool japanHealth;
  bool societyRorRegenerativeMedicine;
  bool osakaPrefecturalBase;
  bool certified;
  String shift1;
  String shift2;
  String shift1Mon;
  String shift1Tue;
  String shift1Wed;
  String shift1Thu;
  String shift1Fri;
  String shift1Sat;
  String shift1Sun;
  String shift2Mon;
  String shift2Tue;
  String shift2Wed;
  String shift2Thu;
  String shift2Fri;
  String shift2Sat;
  String shift2Sun;

  BasicInformationHospitalRequest({
    this.id,
    required this.dateOfUpdate,
    required this.updater,
    required this.memo,
    required this.updates,
    required this.hospitalNameChinese,
    required this.hospitalNameKatakana,
    required this.zipCode,
    required this.location,
    required this.googleMap,
    required this.phoneNumber,
    required this.faxNumber,
    required this.homepage,
    required this.supportedMenu,
    required this.healthCheckup,
    required this.treatment,
    required this.heavyIonBeam,
    required this.protonBeam,
    required this.regenerativeMedicine,
    required this.beauty,
    required this.phone,
    required this.fax,
    required this.mail,
    required this.line,
    required this.note,
    required this.english,
    required this.chinese,
    required this.vietnamese,
    required this.otherLanguages,
    required this.languages,
    required this.onlineCheck,
    required this.appointment,
    required this.cdr,
    required this.storageUrl,
    required this.viewMyPage,
    required this.mailAttachment,
    required this.loanerTablet,
    required this.jmip,
    required this.jci,
    required this.jih,
    required this.ningenDoctor,
    required this.japanHealth,
    required this.societyRorRegenerativeMedicine,
    required this.osakaPrefecturalBase,
    required this.certified,
    required this.shift1,
    required this.shift2,
    required this.shift1Mon,
    required this.shift1Tue,
    required this.shift1Wed,
    required this.shift1Thu,
    required this.shift1Fri,
    required this.shift1Sat,
    required this.shift1Sun,
    required this.shift2Mon,
    required this.shift2Tue,
    required this.shift2Wed,
    required this.shift2Thu,
    required this.shift2Fri,
    required this.shift2Sat,
    required this.shift2Sun,
  });

  factory BasicInformationHospitalRequest.fromJson(Map<String, dynamic> json) =>
      _$BasicInformationHospitalRequestFromJson(json);
  Map<String, dynamic> toJson() =>
      _$BasicInformationHospitalRequestToJson(this);
}
