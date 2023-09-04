import 'package:json_annotation/json_annotation.dart';

import 'static_khqr.dart';

part 'khqr.g.dart';

@JsonSerializable()
class Khqr {
  const Khqr({
    required this.id,
    required this.data,
  });

  final String id;
  @JsonKey(name: 'content')
  final String data;

  factory Khqr.fromJson(Map<String, dynamic> json) {
    return const KhqrConverter().fromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$KhqrToJson(this);
  }
}

class KhqrConverter extends JsonConverter<Khqr, Map<String, dynamic>> {
  const KhqrConverter();

  @override
  Khqr fromJson(Map<String, dynamic> json) {
    return json['isStatic'] == true
        ? StaticKhqr.fromJson(json)
        : _$KhqrFromJson(json);
  }

  @override
  Map<String, dynamic> toJson(Khqr object) {
    return object.toJson();
  }
}
