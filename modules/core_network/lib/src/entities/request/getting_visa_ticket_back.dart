// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'getting_visa_ticket_back.g.dart';

@JsonSerializable()
class TicketBackRequest {
  DateTime? returnFlightTicket;
  String? returnFlightTicketFileName;

  TicketBackRequest({
    this.returnFlightTicket,
    this.returnFlightTicketFileName,
  });

  factory TicketBackRequest.fromJson(Map<String, dynamic> json) {
    return _$TicketBackRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TicketBackRequestToJson(this);
  }
}
