import 'package:json_annotation/json_annotation.dart';
part 'detail_related_parties_driver_response.g.dart';

@JsonSerializable()
class DetailRelatedPartiesDriverResponse {
  @JsonKey(name: '_id')
  final String? id;
  DateTime? dateYearFrom;
  DateTime? dateYearTo;
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


  DetailRelatedPartiesDriverResponse({
    required this.id,
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
  });

  factory DetailRelatedPartiesDriverResponse.fromJson(
      Map<String, dynamic> json) {
    return _$DetailRelatedPartiesDriverResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DetailRelatedPartiesDriverResponseToJson(this);
  }
}
