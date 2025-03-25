// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'basic_information_hospital_response.g.dart';

@JsonSerializable()
class BasicInformationHospitalResponse {
  @JsonKey(name: '_id')
  String id;
  String? area;
  String? hospitalNameChinese;
  String? hospitalNameKatakana;
  String? zipCode;
  String? location;
  String? googleMap;
  String? phoneNumber;
  String? faxNumber;
  String? homepage;
  bool? supportedMenu;
  bool? healthCheckup;
  bool? treatment;
  bool? heavyIonBeam;
  bool? protonBeam;
  bool? regenerativeMedicine;
  bool? beauty;
  bool? phone;
  bool? fax;
  bool? mail;
  bool? line;
  String? note;
  bool? english;
  bool? chinese;
  bool? vietnamese;
  bool? otherLanguages;
  String? languages;
  String? onlineCheck;
  String? appointment;
  bool? cdr;
  bool? storageUrl;
  bool? viewMyPage;
  bool? mailAttachment;
  bool? loanerTablet;
  bool? jmip;
  bool? jci;
  bool? jih;
  bool? ningenDoctor;
  bool? japanHealth;
  bool? societyRorRegenerativeMedicine;
  bool? osakaPrefecturalBase;
  bool? certified;
  String? department1;
  String? department2;
  String? shift1;
  String? shift2;
  String? shift1Mon;
  String? shift1Tue;
  String? shift1Wed;
  String? shift1Thu;
  String? shift1Fri;
  String? shift1Sat;
  String? shift1Sun;
  String? shift2Mon;
  String? shift2Tue;
  String? shift2Wed;
  String? shift2Thu;
  String? shift2Fri;
  String? shift2Sat;
  String? shift2Sun;
  String? memo;
  String? supportLanguageRemark;
  final DateTime createdAt;
  final DateTime updatedAt;

  BasicInformationHospitalResponse({
    required this.id,
    this.area,
    this.hospitalNameChinese,
    this.hospitalNameKatakana,
    this.zipCode,
    this.location,
    this.googleMap,
    this.phoneNumber,
    this.faxNumber,
    this.homepage,
    this.supportedMenu,
    this.healthCheckup,
    this.treatment,
    this.heavyIonBeam,
    this.protonBeam,
    this.regenerativeMedicine,
    this.beauty,
    this.phone,
    this.fax,
    this.mail,
    this.line,
    this.note,
    this.english,
    this.chinese,
    this.vietnamese,
    this.otherLanguages,
    this.languages,
    this.onlineCheck,
    this.appointment,
    this.cdr,
    this.storageUrl,
    this.viewMyPage,
    this.mailAttachment,
    this.loanerTablet,
    this.jmip,
    this.jci,
    this.jih,
    this.ningenDoctor,
    this.japanHealth,
    this.societyRorRegenerativeMedicine,
    this.osakaPrefecturalBase,
    this.certified,
    this.department1,
    this.department2,
    this.shift1,
    this.shift2,
    this.shift1Mon,
    this.shift1Tue,
    this.shift1Wed,
    this.shift1Thu,
    this.shift1Fri,
    this.shift1Sat,
    this.shift1Sun,
    this.shift2Mon,
    this.shift2Tue,
    this.shift2Wed,
    this.shift2Thu,
    this.shift2Fri,
    this.shift2Sat,
    this.shift2Sun,
    this.memo,
    this.supportLanguageRemark,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BasicInformationHospitalResponse.fromJson(
          Map<String, dynamic> json) =>
      _$BasicInformationHospitalResponseFromJson(json);
  Map<String, dynamic> toJson() =>
      _$BasicInformationHospitalResponseToJson(this);
}
