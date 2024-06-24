import 'package:json_annotation/json_annotation.dart';
part 'detail_related_parties_driver_request.g.dart';
@JsonSerializable()
class DetailRelatedPartiesDriverRequest {
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

  DetailRelatedPartiesDriverRequest({
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
  });

  factory DetailRelatedPartiesDriverRequest.fromJson(Map<String,dynamic> json){
    return _$DetailRelatedPartiesDriverRequestFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$DetailRelatedPartiesDriverRequestToJson(this);
  }
}