import 'package:json_annotation/json_annotation.dart';

import '../../core_network.dart';
import 'business_status.dart';

part 'business.g.dart';

@JsonSerializable()
class Business {
  const Business({
    required this.id,
    required this.name,
    required this.status,
    required this.type,
    required this.category,
    this.imageUrl,
  });

  final String id;
  final String name;
  final BusinessStatus status;
  @JsonKey(name: 'merchantType')
  final MerchantType type;
  final BusinessCategory category;
  final String? imageUrl;

  factory Business.fromJson(Map<String, dynamic> json) {
    return _$BusinessFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BusinessToJson(this);
  }
}
