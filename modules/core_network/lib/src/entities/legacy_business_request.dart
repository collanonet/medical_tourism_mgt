import 'package:json_annotation/json_annotation.dart';

import '../../entities.dart';

part 'legacy_business_request.g.dart';

@JsonSerializable()
class LegacyBusinessRequest {
  String referenceData;
  List<LegacyBusiness> businesses;

  LegacyBusinessRequest({
    required this.referenceData,
    required this.businesses,
  });

  factory LegacyBusinessRequest.fromJson(Map<String, dynamic> json) {
    return _$LegacyBusinessRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LegacyBusinessRequestToJson(this);
}
