// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'explanses_item.g.dart';
@JsonSerializable()
class Subitem {
  String? submit;

  Subitem({this.submit});
  factory Subitem.fromJson(Map<String, dynamic> json) => _$SubitemFromJson(json);
  Map<String, dynamic> toJson() => _$SubitemToJson(this);
}
