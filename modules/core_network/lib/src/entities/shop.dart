import 'package:json_annotation/json_annotation.dart';

import 'bank_account.dart';
import 'base_shop.dart';
import 'counter.dart';
import 'shop_type.dart';

part 'shop.g.dart';

@JsonSerializable()
class Shop extends BaseShop {
  Shop({
    required super.id,
    required this.name,
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
  final String name;

  factory Shop.fromJson(Map<String, dynamic> json) {
    return _$ShopFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$ShopToJson(this);
}
