import 'package:json_annotation/json_annotation.dart';

part 'getting_final_final.g.dart';
@JsonSerializable()
class VasaInfo {
  @JsonKey(name: '_id')
  final String id;
  DateTime? visaPage;
  DateTime? landingPermit;

  VasaInfo({
    required this.id,
    this.visaPage,
    this.landingPermit,
  });

  factory VasaInfo.fromJson(Map<String,dynamic> json){
    return _$VasaInfoFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$VasaInfoToJson(this);
  }

}