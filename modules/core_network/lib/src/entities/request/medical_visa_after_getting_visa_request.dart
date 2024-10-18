import 'package:json_annotation/json_annotation.dart';

import 'getting_visa_boarding_pass.dart';
import 'getting_visa_info.dart';
import 'getting_visa_ticket.dart';
import 'getting_visa_ticket_back.dart';
part 'medical_visa_after_getting_visa_request.g.dart';

@JsonSerializable()
class AfterGettingVisaRequest {
  List<VasaInfo>? vasaInfo;
  List<Ticket>? ticket;
  List<TicketBack>? ticketBack;
  List<BoardingPass>? boardingPass;
  DateTime? certificateOfEligibility;

  AfterGettingVisaRequest({
    this.vasaInfo,
    this.ticket,
    this.ticketBack,
    this.boardingPass,
    this.certificateOfEligibility,
  });

  factory AfterGettingVisaRequest.fromJson(Map<String,dynamic> json){
    return _$AfterGettingVisaRequestFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$AfterGettingVisaRequestToJson(this);
  }
  

}






