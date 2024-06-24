import 'package:json_annotation/json_annotation.dart';
part 'detail_related_parties_emergency_contact_response.g.dart';
@JsonSerializable()
class DetailRelatedPartiesEmergencyContactResponse {
       @JsonKey(name: '_id')
  final String? id;
  String? dateFrom;
  String? dateTo;
  String? personInChargeKanji;
  String? personInChargeKana;
  String? telephoneNumber;

  DetailRelatedPartiesEmergencyContactResponse({
    required this.id,
    this.dateFrom = '',
    this.dateTo = '',
    this.personInChargeKanji = '',
    this.personInChargeKana = '',
    this.telephoneNumber = '',
  });

  factory DetailRelatedPartiesEmergencyContactResponse.fromJson(Map<String,dynamic> json){
    return _$DetailRelatedPartiesEmergencyContactResponseFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$DetailRelatedPartiesEmergencyContactResponseToJson(this);
  }
}
