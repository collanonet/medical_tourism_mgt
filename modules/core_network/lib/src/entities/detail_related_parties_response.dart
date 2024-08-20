import 'package:json_annotation/json_annotation.dart';
part 'detail_related_parties_response.g.dart';
@JsonSerializable()
class DetailRelatedPartiesResponse {
   @JsonKey(name: '_id')
  final String? id;
  String? arrangePerson;
  DateTime? dateFrom;
  DateTime? dateTo;
  String? guideNamaKanji;
  String? guideNameKana;
  String? phoneNumber;
  List<String>? qualification;
  String? report;
  String? accommodationAvailability;
  String? accommodationName;
  String? address;
  String? phoneNumber2;
  String? tour;
  //  bool? itineraryManagement;
  // bool? guideInterpreter;
  // bool? medicalInterpreter;
  // bool? possibilityOfStayingTogether;

  DetailRelatedPartiesResponse({
    required this.id,
    this.arrangePerson,
    this.dateFrom,
    this.dateTo,
    this.guideNamaKanji,
    this.guideNameKana,
    this.phoneNumber,
    this.qualification,
    this.report,
    this.accommodationAvailability,
    this.accommodationName,
    this.address,
    this.phoneNumber2,
    // this.itineraryManagement,
    // this.guideInterpreter,
    // this.medicalInterpreter,
    // this.possibilityOfStayingTogether,
  });

  factory DetailRelatedPartiesResponse.fromJson(Map<String,dynamic> json){
    return _$DetailRelatedPartiesResponseFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$DetailRelatedPartiesResponseToJson(this);
  }

}