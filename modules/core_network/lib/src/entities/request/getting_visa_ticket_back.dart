import 'package:json_annotation/json_annotation.dart';
part 'getting_visa_ticket_back.g.dart';
@JsonSerializable()
class TicketBack {
  DateTime? returnFlightTicket;

  TicketBack({this.returnFlightTicket});

  factory TicketBack.fromJson(Map<String,dynamic> json){
    return _$TicketBackFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$TicketBackToJson(this);
  }
}
