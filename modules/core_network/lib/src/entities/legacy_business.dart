import 'package:json_annotation/json_annotation.dart';

import 'shop.dart';
import 'merchant_type.dart';

part 'legacy_business.g.dart';

@JsonSerializable()
class LegacyBusiness {
  String businessId;
  String businessName;
  @JsonKey()
  MerchantType? businessType;
  String? businessCategory;
  String? businessLogoUrl;
  List<Shop>? shops;

  LegacyBusiness({
    required this.businessId,
    required this.businessName,
    required this.businessType,
    this.businessCategory,
    this.businessLogoUrl,
    this.shops,
  });

  factory LegacyBusiness.fromJson(Map<String, dynamic> json) {
    return _$LegacyBusinessFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LegacyBusinessToJson(this);
}
