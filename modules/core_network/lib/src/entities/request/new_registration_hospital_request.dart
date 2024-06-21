import 'package:json_annotation/json_annotation.dart';

part 'new_registration_hospital_request.g.dart';

@JsonSerializable()
class NewRegistrationHospitalRequest {
  @JsonKey(name: '_id')
  String? id;
  final DateTime? updateDate;
  final String? updater;
  final String? classification;
  final bool? shareThisQADataWithHospitals;
  final String? question;
  final String? answer;

  NewRegistrationHospitalRequest({
    this.id,
    this.updateDate,
    this.updater,
    this.classification,
    this.shareThisQADataWithHospitals,
    this.question,
    this.answer,
  });

  factory NewRegistrationHospitalRequest.fromJson(Map<String, dynamic> json) {
    return _$NewRegistrationHospitalRequestFromJson(json);
  }
  Map<String, dynamic> toJson() => _$NewRegistrationHospitalRequestToJson(this);
}
