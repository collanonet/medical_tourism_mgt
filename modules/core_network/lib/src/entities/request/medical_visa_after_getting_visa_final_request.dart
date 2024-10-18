
import 'package:json_annotation/json_annotation.dart';

import 'getting_visa_boarding_pass.dart';
import 'getting_visa_info.dart';
import 'getting_visa_ticket.dart';
import 'getting_visa_ticket_back.dart';
part 'medical_visa_after_getting_visa_final_request.g.dart';
@JsonSerializable()
class MedicalAfterGettingVisaFinalRequest {
  List<VasaInfo>? vasaInfo;
  List<Ticket>? ticket;
  List<TicketBack>? ticketBack;
  List<BoardingPass>? boardingPass;
  DateTime? certificateOfEligibility;

  MedicalAfterGettingVisaFinalRequest({
    this.vasaInfo,
    this.ticket,
    this.ticketBack,
    this.boardingPass,
    this.certificateOfEligibility,
  });
  
}