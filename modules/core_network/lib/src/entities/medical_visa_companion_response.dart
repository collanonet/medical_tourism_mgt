import 'package:json_annotation/json_annotation.dart';

part 'medical_visa_companion_response.g.dart';

@JsonSerializable()
class MedicalVisaCompanionResponse {
  @JsonKey(name: '_id')
  final String id;
  final String? seatNumber;
  final String? remarks;
  final String? remarks2;

  MedicalVisaCompanionResponse({
    required this.id,
    this.seatNumber,
    this.remarks,
    this.remarks2,
  });

  factory MedicalVisaCompanionResponse.fromJson(Map<String, dynamic> json) =>
      _$MedicalVisaCompanionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MedicalVisaCompanionResponseToJson(this);
}
