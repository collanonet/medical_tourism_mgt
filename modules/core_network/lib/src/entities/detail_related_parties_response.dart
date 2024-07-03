import 'package:json_annotation/json_annotation.dart';
part 'detail_related_parties_response.g.dart';
@JsonSerializable()
class DetailRelatedPartiesResponse {
   @JsonKey(name: '_id')
  final String? id;
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
   bool? itineraryManagement;
  bool? guideInterpreter;
  bool? medicalInterpreter;
  bool? possibilityOfStayingTogether;

  DetailRelatedPartiesResponse({
    required this.id,
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
    this.itineraryManagement,
    this.guideInterpreter,
    this.medicalInterpreter,
    this.possibilityOfStayingTogether,
  });

  factory DetailRelatedPartiesResponse.fromJson(Map<String,dynamic> json){
    return _$DetailRelatedPartiesResponseFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$DetailRelatedPartiesResponseToJson(this);
  }

}