import 'package:json_annotation/json_annotation.dart';

import '../../core_network.dart';
import 'default_shop.dart';

abstract class BaseShop {
  BaseShop({
    required this.id,
    this.profileImageUrl,
    required this.enabled,
    required this.enabledTip,
    required this.type,
    required this.counters,
    this.addressLine1,
    required this.latitude,
    required this.longitude,
    this.village,
    List<BankAccountCompact>? bankAccounts,
  }) : bankAccounts = bankAccounts ?? const [];

  final String id;
  String? get name;
  final String? profileImageUrl;
  final bool enabled;
  final bool enabledTip;
  final ShopType type;
  final double longitude;
  final double latitude;
  final String? addressLine1;
  final Village? village;
  final List<Counter> counters;
  final List<BankAccountCompact> bankAccounts;

  factory BaseShop.fromJson(Map<String, dynamic> json) {
    return const ShopConverter().fromJson(json);
  }

  Map<String, dynamic> toJson();
}

class ShopConverter extends JsonConverter<BaseShop, Map<String, dynamic>> {
  const ShopConverter();

  @override
  BaseShop fromJson(Map<String, dynamic> json) {
    if (json['name'] == null) {
      return DefaultShop.fromJson(json);
    }
    return Shop.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(BaseShop object) {
    return object.toJson();
  }
}
