// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'application_beauty_response.g.dart';

@JsonSerializable()
class ApplicationBeautyResponse {
   @JsonKey(name: '_id')
  String id;
  DateTime? date1;
  DateTime? date2;
  DateTime? date3;
  bool? desiredDate;
  String? remarks;
  int? people;
  int? age;
  bool? sex;
  String? relationship;
  bool? attend;
  String? desiredArea;
  String? reason;
  bool? faceMenu1;
  bool? faceMenu2;
  bool? faceMenu3;
  bool? faceMenu4;
  bool? faceMenu5;
  bool? faceMenu6;
  bool? faceMenu7;
  bool? faceMenu8;
  bool? faceMenu9;
  String? others;
  bool? bodyMenu1;
  bool? bodyMenu2;
  bool? bodyMenu3;
  bool? bodyMenu4;
  bool? bodyMenu5;
  String? others1;
  bool? skinMenu1;
  bool? skinMenu2;
  bool? skinMenu3;
  bool? hairRemovalMeun1;
  bool? hairRemovalMeun2;
  bool? otherMenu1;
  bool? otherMenu2;
  bool? otherMenu3;
  bool? otherMenu4;
  bool? otherMenu5;
  bool? menMenu1;
  bool? menMenu2;
  bool? otherHospital;
  String? others2;
  String? concerne;
  String? brokerageCompany;
  bool? privetcy;

  ApplicationBeautyResponse({
    required this.id,
    this.date1,
    this.date2,
    this.date3,
    this.desiredDate,
    this.remarks,
    this.people,
    this.age,
    this.sex,
    this.relationship,
    this.attend,
    this.desiredArea,
    this.reason,
    this.faceMenu1,
    this.faceMenu2,
    this.faceMenu3,
    this.faceMenu4,
    this.faceMenu5,
    this.faceMenu6,
    this.faceMenu7,
    this.faceMenu8,
    this.faceMenu9,
    this.bodyMenu1,
    this.bodyMenu2,this.bodyMenu3,
    this.bodyMenu4,this.bodyMenu5,
    this.others,
    this.skinMenu1,this.skinMenu2,
    this.skinMenu3,
    this.hairRemovalMeun1,this.hairRemovalMeun2,
    this.otherMenu1,
    this.otherMenu2,
    this.otherMenu3,
    this.otherMenu4,
    this.otherMenu5,
    this.menMenu1,
    this.menMenu2,
    this.otherHospital,
    this.others1,
    this.others2,
    this.concerne,
    this.brokerageCompany,
    this.privetcy,
  });

  factory ApplicationBeautyResponse.fromJson(Map<String,dynamic> json){
    return _$ApplicationBeautyResponseFromJson(json);
  }
  Map<String,dynamic> toJson(){
    return _$ApplicationBeautyResponseToJson(this);
  }
}
