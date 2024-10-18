import 'package:json_annotation/json_annotation.dart';
part 'getting_visa_info.g.dart';
@JsonSerializable()
class VasaInfo {
  DateTime? visaPage;
  DateTime? landingPermit;

  VasaInfo({this.visaPage, this.landingPermit});

  factory VasaInfo.fromJson(Map<String,dynamic> json){
    return _$VasaInfoFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$VasaInfoToJson(this);
  }
}