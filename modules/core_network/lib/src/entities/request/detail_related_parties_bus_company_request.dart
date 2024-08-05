import 'package:json_annotation/json_annotation.dart';

part 'detail_related_parties_bus_company_request.g.dart';
@JsonSerializable()
class DetailRelatedPartiesBusCompanyRequest {
  String? personInChargeOfArrangements;
  String? busCompanyName;
  String? manager;

  DetailRelatedPartiesBusCompanyRequest({
    this.personInChargeOfArrangements,
    this.busCompanyName,
    this.manager,
  });

  factory DetailRelatedPartiesBusCompanyRequest.fromJson(Map<String,dynamic> json){
    return _$DetailRelatedPartiesBusCompanyRequestFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$DetailRelatedPartiesBusCompanyRequestToJson(this);
  }
}