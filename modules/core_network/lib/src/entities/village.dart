import 'package:json_annotation/json_annotation.dart';

part 'village.g.dart';

@JsonSerializable()
class Village {
  String id;
  String name;
  String khmerName;
  String code;

  Village({
    required this.id,
    required this.name,
    required this.khmerName,
    required this.code,
  });

  factory Village.fromJson(Map<String, dynamic> json) =>
      _$VillageFromJson(json);

  Map<String, dynamic> toJson() => _$VillageToJson(this);
}
