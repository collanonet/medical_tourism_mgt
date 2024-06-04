import 'package:json_annotation/json_annotation.dart';
part 'application_risk_test_response.g.dart';

@JsonSerializable()
class ApplicationRiskTestResponse {
  @JsonKey(name: '_id')
  String id;
  DateTime? date1;
  DateTime? date2;
  DateTime? date3;
  bool? noDate;
  String? remark;
  int? people;
  int? age;
  bool? sex;
  String? relationship;
  bool? menu1;
  bool? menu2;
  bool? menu3;
  bool? menu4;
  bool? menu5;
  bool? menu6;
  bool? menu7;
  bool? menu8;
  bool? menu9;
  bool? menu10;
  bool? menu11;
  bool? menu12;
  bool? menu13;
  String? others;
  String? concern;
  String? introducer;
  bool? historyCancer;
  String? cancerSite;
  bool? treatmentDetail;
  String? detail;
  bool? treatmentDetail1;
  String? detail1;
  List<String>? drugName;
  bool? privetcy;
  String? ifwoman;

  ApplicationRiskTestResponse({
    required this.id,
    this.date1,
    this.date2,
    this.date3,
    this.noDate,
    this.remark,
    this.people,
    this.age,
    this.sex,
    this.relationship,
    this.menu1,
    this.menu2,
    this.menu3,
    this.menu4,
    this.menu5,
    this.menu6,
    this.menu7,
    this.menu8,
    this.menu9,
    this.menu10,
    this.menu11,
    this.menu12,
    this.menu13,
    this.others,
    this.concern,
    this.introducer,
    this.historyCancer,
    this.cancerSite,
    this.treatmentDetail,
    this.detail,
    this.treatmentDetail1,
    this.detail1,
    this.drugName,
    this.privetcy,
    this.ifwoman,
  });

  factory ApplicationRiskTestResponse.fromJson(Map<String,dynamic> json){
    return _$ApplicationRiskTestResponseFromJson(json);
  }
  Map<String,dynamic> toJson(){
    return _$ApplicationRiskTestResponseToJson(this);
  }
}
