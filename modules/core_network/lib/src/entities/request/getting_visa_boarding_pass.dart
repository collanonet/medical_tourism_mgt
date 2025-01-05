// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'getting_visa_boarding_pass.g.dart';

@JsonSerializable()
class BoardingPassRequest { 
  DateTime? boardingPassForReturnFlight;
  String? boardingPassForReturnFlightFileName;

  BoardingPassRequest({
    this.boardingPassForReturnFlight,
    this.boardingPassForReturnFlightFileName,
  });

  factory BoardingPassRequest.fromJson(Map<String, dynamic> json) {
    return _$BoardingPassRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BoardingPassRequestToJson(this);
  }
}
