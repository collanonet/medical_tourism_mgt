import 'package:json_annotation/json_annotation.dart';

import 'base_shop.dart';
import 'shop_type.dart';
import 'counter.dart';
import 'bank_account.dart';

part 'default_shop.g.dart';

@JsonSerializable()
class DefaultShop extends BaseShop {
  DefaultShop({
    required super.id,
    required super.enabled,
    required super.enabledTip,
    required super.type,
    required super.latitude,
    required super.longitude,
    super.addressLine1,
    required super.counters,
    required super.bankAccounts,
  });

  @override
  final String? name = null;

  factory DefaultShop.fromJson(Map<String, dynamic> json) {
    return _$DefaultShopFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$DefaultShopToJson(this);
  }
}
