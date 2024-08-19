import 'package:json_annotation/json_annotation.dart';
part 'detail_related_parties_emergency_contact_request.g.dart';
@JsonSerializable()
class DetailRelatedPartiesEmergencyContactRequest {
  String? dateYearFrom;
  String? dateYearTo;
  String? contactPersonNamaKanji;
  String? contactPersonNameKana;
  String? phoneNumber;
  String? tour;

  DetailRelatedPartiesEmergencyContactRequest({
    this.dateYearFrom = '',
    this.dateYearTo = '',
    this.contactPersonNamaKanji = '',
    this.contactPersonNameKana = '',
    this.phoneNumber = '',
    this.tour = '',
  });

  factory DetailRelatedPartiesEmergencyContactRequest.fromJson(Map<String,dynamic> json){
    return _$DetailRelatedPartiesEmergencyContactRequestFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$DetailRelatedPartiesEmergencyContactRequestToJson(this);
  }

}
