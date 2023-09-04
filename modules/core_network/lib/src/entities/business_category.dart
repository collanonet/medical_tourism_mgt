import 'package:json_annotation/json_annotation.dart';

import '../../core_network.dart';

part 'business_category.g.dart';

@JsonSerializable()
class BusinessCategory {
  String id;
  String name;
  List<ShopType> shopTypes;

  BusinessCategory({
    required this.id,
    required this.name,
    List<ShopType>? shopTypes,
  }) : shopTypes = shopTypes ?? const [];

  factory BusinessCategory.fromJson(Map<String, dynamic> json) {
    return _$BusinessCategoryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BusinessCategoryToJson(this);
}
