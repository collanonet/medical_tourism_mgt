import 'package:json_annotation/json_annotation.dart';

import '../../core_network.dart';

part 'onboard_business_request.g.dart';

@JsonSerializable()
class OnboardBusinessRequest {
  String referenceData;
  String? logoUrl;
  String name;
  String bankAccountNumber;
  @JsonKey()
  BusinessNameType nameType;
  String merchantType;
  String categoryId;
  String shopTypeId;
  String addressLine1;
  double latitude;
  double longitude;
  String villageId;
  List<SupportingDocument>? supportingDocument;

  OnboardBusinessRequest({
    required this.referenceData,
    this.logoUrl,
    required this.name,
    required this.bankAccountNumber,
    required this.nameType,
    required this.merchantType,
    required this.categoryId,
    required this.shopTypeId,
    required this.addressLine1,
    required this.latitude,
    required this.longitude,
    required this.villageId,
    this.supportingDocument,
  });

  factory OnboardBusinessRequest.fromJson(Map<String, dynamic> json) {
    return _$OnboardBusinessRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OnboardBusinessRequestToJson(this);
}
