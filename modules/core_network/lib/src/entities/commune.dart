import 'village.dart';
import 'package:json_annotation/json_annotation.dart';

part 'commune.g.dart';

@JsonSerializable()
class Commune {
  String id;
  String name;
  String khmerName;
  String code;
  List<Village>? village;

  Commune({
    required this.id,
    required this.name,
    required this.khmerName,
    required this.code,
    this.village,
  });

  factory Commune.fromJson(Map<String, dynamic> json) =>
      _$CommuneFromJson(json);

  Map<String, dynamic> toJson() => _$CommuneToJson(this);
}
