import 'package:json_annotation/json_annotation.dart';
part 'getting_final_ticket.g.dart';
@JsonSerializable()
class Ticket {
  @JsonKey(name: '_id')
  final String id;
  DateTime? planeTicketForYourVisitToJapan;

  Ticket({
    required this.id,
    this.planeTicketForYourVisitToJapan,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return _$TicketFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TicketToJson(this);
  }
}