import 'package:json_annotation/json_annotation.dart';
part 'detail_related_parties_request.g.dart';

@JsonSerializable()
class DetailRelatedPartiesRequest {
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
  // bool? itineraryManagement;
  // bool? guideInterpreter;
  // bool? medicalInterpreter;
  // bool? possibilityOfStayingTogether;

  DetailRelatedPartiesRequest({
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
    this.tour,
    // this.itineraryManagement,
    // this.guideInterpreter ,
    // this.medicalInterpreter,
    // this.possibilityOfStayingTogether,
  });

  factory DetailRelatedPartiesRequest.fromJson(Map<String,dynamic> json){
    return _$DetailRelatedPartiesRequestFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$DetailRelatedPartiesRequestToJson(this);
  }
  
}