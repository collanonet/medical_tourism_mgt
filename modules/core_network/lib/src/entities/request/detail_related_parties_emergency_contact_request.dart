import 'package:json_annotation/json_annotation.dart';
part 'detail_related_parties_emergency_contact_request.g.dart';
@JsonSerializable()
class DetailRelatedPartiesEmergencyContactRequest {
  String? dateFrom;
  String? dateTo;
  String? personInChargeKanji;
  String? personInChargeKana;
  String? telephoneNumber;

  DetailRelatedPartiesEmergencyContactRequest({
    this.dateFrom = '',
    this.dateTo = '',
    this.personInChargeKanji = '',
    this.personInChargeKana = '',
    this.telephoneNumber = '',
  });

  factory DetailRelatedPartiesEmergencyContactRequest.fromJson(Map<String,dynamic> json){
    return _$DetailRelatedPartiesEmergencyContactRequestFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$DetailRelatedPartiesEmergencyContactRequestToJson(this);
  }

}
