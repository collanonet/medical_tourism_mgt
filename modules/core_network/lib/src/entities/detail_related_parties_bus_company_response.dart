import 'package:json_annotation/json_annotation.dart';
part 'detail_related_parties_bus_company_response.g.dart';
@JsonSerializable()
class DetailRelatedPartiesBusCompanyResponse {
     @JsonKey(name: '_id')
  final String? id;
  String? personInChargeOfArrangements;
  String? busCompanyName;
  String? manager;

  DetailRelatedPartiesBusCompanyResponse({
    required this.id,
    this.personInChargeOfArrangements,
    this.busCompanyName,
    this.manager,
  });

  factory DetailRelatedPartiesBusCompanyResponse.fromJson(Map<String,dynamic> json){
    return _$DetailRelatedPartiesBusCompanyResponseFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$DetailRelatedPartiesBusCompanyResponseToJson(this);
  }

}