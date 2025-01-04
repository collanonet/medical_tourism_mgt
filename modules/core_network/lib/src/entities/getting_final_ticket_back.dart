// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'getting_final_ticket_back.g.dart';
@JsonSerializable()
class TicketBack {
  @JsonKey(name: '_id')
  final String id;
  DateTime? returnFlightTicket;

  TicketBack({
    required this.id,
    this.returnFlightTicket,
  });

  factory TicketBack.fromJson(Map<String, dynamic> json) {
    return _$TicketBackFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TicketBackToJson(this);
  }
}
