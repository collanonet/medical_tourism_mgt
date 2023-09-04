import 'package:json_annotation/json_annotation.dart';

import 'entities.dart';

part 'shop_create_response.g.dart';

@JsonSerializable()
class ShopCreateResponse {
  String id;
  String name;
  Village village;
  String profileImageUrl;
  bool enabledTip;
  bool enabled;
  List<BankAccount> bankAccounts;
  ShopType type;
  String addressLine1;
  double longitude;
  double latitude;
  List<Counter> counters;

  ShopCreateResponse({
    required this.id,
    required this.name,
    required this.village,
    required this.profileImageUrl,
    required this.enabledTip,
    required this.enabled,
    required this.type,
    List<BankAccount>? bankAccounts,
    required this.latitude,
    required this.longitude,
    List<Counter>? counters,
    required this.addressLine1,
  }) : bankAccounts = bankAccounts ?? const [], counters = counters ?? const [] ;

  factory ShopCreateResponse.fromJson(Map<String, dynamic> json) {
    return _$ShopCreateResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ShopCreateResponseToJson(this);
}
