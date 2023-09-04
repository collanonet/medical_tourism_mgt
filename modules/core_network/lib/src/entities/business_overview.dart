import 'package:json_annotation/json_annotation.dart';

part 'business_overview.g.dart';

@JsonSerializable()
class BusinessOverview {
  int totalShop;
  int totalCounter;
  int totalStaff;

  BusinessOverview({
    required this.totalShop,
    required this.totalCounter,
    required this.totalStaff,
  });

  factory BusinessOverview.fromJson(Map<String, dynamic> json) {
    return _$BusinessOverviewFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BusinessOverviewToJson(this);
  }
}
