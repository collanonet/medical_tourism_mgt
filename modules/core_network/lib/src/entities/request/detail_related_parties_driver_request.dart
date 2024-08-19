import 'package:json_annotation/json_annotation.dart';
part 'detail_related_parties_driver_request.g.dart';
@JsonSerializable()
class DetailRelatedPartiesDriverRequest {
  String? dateYearFrom;
  String? dateYearTo;
  String? carNumber;
  String? vehicleType;
  String? driverNamaKanji;
  String? driverNameKana;
  String? phoneNumber;
  List<String>? language;
  String? accommodationAvailability;
  String? hotelArrangement;
  String? accommodationName;
  String? address;
  String? phoneNumber2;
  // String? carModel2;
  // bool? japanese;
  // bool? chinese;
  // bool? vietnamese;
  // bool? english;
  // bool? korean;
  // bool? other;
  // bool? possibilityOfStayingTogether;
  // bool? hotelArrangements;

  DetailRelatedPartiesDriverRequest({
    this.dateYearFrom,
    this.dateYearTo,
    this.carNumber,
    this.vehicleType,
    this.driverNamaKanji,
    this.driverNameKana,
    this.phoneNumber,
    this.language,
    this.accommodationAvailability,
    this.hotelArrangement,
    this.accommodationName,
    this.address,
    this.phoneNumber2,
    // this.carModel2,
    // this.japanese,
    // this.chinese,
    // this.vietnamese,
    // this.english,
    // this.korean,
    // this.other,
    // this.possibilityOfStayingTogether,
    // this.hotelArrangements,
  });

  factory DetailRelatedPartiesDriverRequest.fromJson(Map<String,dynamic> json){
    return _$DetailRelatedPartiesDriverRequestFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$DetailRelatedPartiesDriverRequestToJson(this);
  }
}