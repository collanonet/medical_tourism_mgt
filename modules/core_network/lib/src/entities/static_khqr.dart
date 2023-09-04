import 'package:json_annotation/json_annotation.dart';

import 'khqr.dart';

part 'static_khqr.g.dart';

@JsonSerializable()
class StaticKhqr extends Khqr {
  const StaticKhqr({
    required super.id,
    required super.data,
  });

  factory StaticKhqr.fromJson(Map<String, dynamic> json) {
    return _$StaticKhqrFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$StaticKhqrToJson(this)..addAll({'isStatic': true});
  }
}
