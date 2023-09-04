import 'package:json_annotation/json_annotation.dart';

import 'entities.dart';

part 'counter.g.dart';

@JsonSerializable()
class Counter {
  String id;
  String name;
  bool enabled;
  List<QrCode> qrCodes;

  Counter({
    required this.id,
    required this.name,
    required this.enabled,
    List<QrCode>? qrCodes,
  }) : qrCodes = qrCodes ?? const [];

  factory Counter.fromJson(Map<String, dynamic> json) =>
      _$CounterFromJson(json);

  Map<String, dynamic> toJson() => _$CounterToJson(this);
}
