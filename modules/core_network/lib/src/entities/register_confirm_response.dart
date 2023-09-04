import 'package:json_annotation/json_annotation.dart';

import '../../entities.dart';

part 'register_confirm_response.g.dart';

@JsonSerializable()
class RegisterConfirmResponse {
  String referenceData;
  bool hasLegacy;
  List<LegacyBusiness>? businesses;

  RegisterConfirmResponse({
    required this.referenceData,
    required this.hasLegacy,
    this.businesses,
  });

  factory RegisterConfirmResponse.fromJson(Map<String, dynamic> json) {
    return _$RegisterConfirmResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RegisterConfirmResponseToJson(this);
}
