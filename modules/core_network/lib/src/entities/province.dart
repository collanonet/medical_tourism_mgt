import 'package:json_annotation/json_annotation.dart';

import 'district.dart';
part 'province.g.dart';

@JsonSerializable()
class Province {
  String id;
  String name;
  String khmerName;
  List<District>? district;

  Province({
    required this.id,
    required this.name,
    required this.khmerName,
    this.district,
  });

  factory Province.fromJson(Map<String, dynamic> json) =>
      _$ProvinceFromJson(json);

  Map<String, dynamic> toJson() => _$ProvinceToJson(this);
}
