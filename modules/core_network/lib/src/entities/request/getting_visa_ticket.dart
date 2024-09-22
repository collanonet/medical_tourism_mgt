
import 'package:json_annotation/json_annotation.dart';
part 'getting_visa_ticket.g.dart';
@JsonSerializable()
class Ticket {
  DateTime? planeTicketForYourVisitToJapan;

  Ticket({this.planeTicketForYourVisitToJapan});

  factory Ticket.fromJson(Map<String,dynamic> json){
    return _$TicketFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$TicketToJson(this);
  }
}