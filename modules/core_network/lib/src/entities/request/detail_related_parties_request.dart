import 'package:json_annotation/json_annotation.dart';
part 'detail_related_parties_request.g.dart';

@JsonSerializable()
class DetailRelatedPartiesRequest {
  String? personInChargeOfArrangements;
  String? dateFrom;
  String? dateTo;
  String? guideNameKanji;
  String? guideNameKana;
  String? telephoneNumber1;
  String? qualification;
  String? report;
  String? accommodationPossible;
  String? nameOfFacility;
  String? location;
  String? telephoneNumber2;

  DetailRelatedPartiesRequest({
    this.personInChargeOfArrangements,
    this.dateFrom,
    this.dateTo,
    this.guideNameKanji,
    this.guideNameKana,
    this.telephoneNumber1,
    this.qualification,
    this.report,
    this.accommodationPossible,
    this.nameOfFacility,
    this.location,
    this.telephoneNumber2,
  });

  factory DetailRelatedPartiesRequest.fromJson(Map<String,dynamic> json){
    return _$DetailRelatedPartiesRequestFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$DetailRelatedPartiesRequestToJson(this);
  }
  
}