import 'package:json_annotation/json_annotation.dart';
part 'getting_visa_ticket.g.dart';

@JsonSerializable()
class TicketRequest {
  DateTime? planeTicketForYourVisitToJapan;
  String? planeTicketForYourVisitToJapanFileName;

  TicketRequest({
    this.planeTicketForYourVisitToJapan,
    this.planeTicketForYourVisitToJapanFileName,
  });

  factory TicketRequest.fromJson(Map<String, dynamic> json) {
    return _$TicketRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TicketRequestToJson(this);
  }
}
