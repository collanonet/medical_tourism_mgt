import 'package:json_annotation/json_annotation.dart';

import 'getting_final_boarding_pass.dart';
import 'getting_final_final.dart';
import 'getting_final_ticket.dart';
import 'getting_final_ticket_back.dart';
part 'medical_visa_after_getting_visa_final_response.g.dart';

@JsonSerializable()
class MedicalVisaAfterGettingVisaResponse {
  @JsonKey(name: '_id')
  final String id;
  List<VasaInfo>? vasaInfo;
  List<Ticket>? ticket;
  List<TicketBack>? ticketBack;
  List<BoardingPass>? boardingPass;
  DateTime? certificateOfEligibility;

  MedicalVisaAfterGettingVisaResponse({
    required this.id,
    this.vasaInfo,
    this.ticket,
    this.ticketBack,
    this.boardingPass,
    this.certificateOfEligibility,
  });

  factory MedicalVisaAfterGettingVisaResponse.fromJson(Map<String, dynamic> json) {
    return _$MedicalVisaAfterGettingVisaResponseFromJson(json);
  }
  Map<String, dynamic> toJson(){
    return _$MedicalVisaAfterGettingVisaResponseToJson(this);
  }
}








