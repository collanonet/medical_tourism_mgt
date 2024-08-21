import 'package:json_annotation/json_annotation.dart';
part 'detail_related_parties_bus_company_response.g.dart';
@JsonSerializable()
class DetailRelatedPartiesBusCompanyResponse {
     @JsonKey(name: '_id')
  final String? id;
  String? arrangePerson;
  String? busCompanyName;
  String? contactPerson;
  String? tour;

  DetailRelatedPartiesBusCompanyResponse({
    required this.id,
    this.arrangePerson,
    this.busCompanyName,
    this.contactPerson,
    this.tour,
  });

  factory DetailRelatedPartiesBusCompanyResponse.fromJson(Map<String,dynamic> json){
    return _$DetailRelatedPartiesBusCompanyResponseFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$DetailRelatedPartiesBusCompanyResponseToJson(this);
  }

}