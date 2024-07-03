import 'package:json_annotation/json_annotation.dart';
part 'detail_related_parties_driver_response.g.dart';
@JsonSerializable()
class DetailRelatedPartiesDriverResponse {
      @JsonKey(name: '_id')
  final String? id;
  String? dateFrom;
  String? dateTo;
  String? carNumber;
  String? carModel;
  String? driverNameKanji;
  String? driverNameKana;
  String? telephoneNumber1;
  String? supportedLanguage;
  String? accommodationPossible;
  String? hotelArrangement;
  String? nameOfFacility;
  String? location;
  String? telephoneNumber2;
   String? carModel2;
  bool? japanese;
  bool? chinese;
  bool? vietnamese;
  bool? english;
  bool? korean;
  bool? other;
  bool? possibilityOfStayingTogether;
  bool? hotelArrangements;

  DetailRelatedPartiesDriverResponse({
    required this.id,
    this.dateFrom,
    this.dateTo,
    this.carNumber,
    this.carModel,
    this.driverNameKanji,
    this.driverNameKana,
    this.telephoneNumber1,
    this.supportedLanguage,
    this.accommodationPossible,
    this.hotelArrangement,
    this.nameOfFacility,
    this.location,
    this.telephoneNumber2,
    this.carModel2,
    this.japanese,
    this.chinese,
    this.vietnamese,
    this.english,
    this.korean,
    this.other,
    this.possibilityOfStayingTogether,
    this.hotelArrangements,
  });

  factory DetailRelatedPartiesDriverResponse.fromJson(Map<String,dynamic> json){
    return _$DetailRelatedPartiesDriverResponseFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$DetailRelatedPartiesDriverResponseToJson(this);
  }

}