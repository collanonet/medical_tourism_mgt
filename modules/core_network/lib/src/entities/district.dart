import 'package:json_annotation/json_annotation.dart';

import 'commune.dart';

part 'district.g.dart';

@JsonSerializable()
class District {
  String id;
  String name;
  String khmerName;
  String code;
  List<Commune>? commune;

  District({
    required this.id,
    required this.name,
    required this.khmerName,
    required this.code,
    this.commune,
  });

  factory District.fromJson(Map<String, dynamic> json) =>
      _$DistrictFromJson(json);

  Map<String, dynamic> toJson() => _$DistrictToJson(this);
}
