// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'getting_final_boarding_pass.g.dart';

@JsonSerializable()
class BoardingPass {
  @JsonKey(name: '_id')
  final String id;
  DateTime? boardingPassForReturnFlight;

  BoardingPass({
    required this.id,
    this.boardingPassForReturnFlight,
  });

  factory BoardingPass.fromJson(Map<String, dynamic> json) {
    return _$BoardingPassFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BoardingPassToJson(this);
  }
}
