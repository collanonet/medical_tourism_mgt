import 'package:json_annotation/json_annotation.dart';

part 'shop_type.g.dart';

@JsonSerializable()
class ShopType {
  String id;
  String name;
  String? code;
  String? khmerName;

  ShopType({
    required this.id,
    required this.name,
    this.code,
    this.khmerName,
  });

  factory ShopType.fromJson(Map<String, dynamic> json) {
    return _$ShopTypeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ShopTypeToJson(this);
}
