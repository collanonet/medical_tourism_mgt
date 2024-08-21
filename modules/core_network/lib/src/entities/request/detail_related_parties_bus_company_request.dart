import 'package:json_annotation/json_annotation.dart';

part 'detail_related_parties_bus_company_request.g.dart';
@JsonSerializable()
class DetailRelatedPartiesBusCompanyRequest {
  String? arrangePerson;
  String? busCompanyName;
  String? contactPerson;
  String? tour;

  DetailRelatedPartiesBusCompanyRequest({
    this.arrangePerson,
    this.busCompanyName,
    this.contactPerson,
    this.tour,
  });

  factory DetailRelatedPartiesBusCompanyRequest.fromJson(Map<String,dynamic> json){
    return _$DetailRelatedPartiesBusCompanyRequestFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$DetailRelatedPartiesBusCompanyRequestToJson(this);
  }
}