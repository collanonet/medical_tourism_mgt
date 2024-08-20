import 'package:json_annotation/json_annotation.dart';
part 'detail_related_parties_emergency_contact_response.g.dart';
@JsonSerializable()
class DetailRelatedPartiesEmergencyContactResponse {
       @JsonKey(name: '_id')
  final String? id;
  DateTime? dateYearFrom;
  DateTime? dateYearTo;
  String? contactPersonNamaKanji;
  String? contactPersonNameKana;
  String? phoneNumber;
  String? tour;

  DetailRelatedPartiesEmergencyContactResponse({
    required this.id,
    this.dateYearFrom,
    this.dateYearTo,
    this.contactPersonNamaKanji,
    this.contactPersonNameKana,
    this.phoneNumber,
    this.tour,
  });

  factory DetailRelatedPartiesEmergencyContactResponse.fromJson(Map<String,dynamic> json){
    return _$DetailRelatedPartiesEmergencyContactResponseFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$DetailRelatedPartiesEmergencyContactResponseToJson(this);
  }
}
