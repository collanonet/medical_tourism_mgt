// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'getting_visa_boarding_pass.dart';
import 'getting_visa_info.dart';
import 'getting_visa_ticket.dart';
import 'getting_visa_ticket_back.dart';

part 'medical_visa_after_getting_visa_request.g.dart';

@JsonSerializable()
class AfterGettingVisaRequest {
  List<GettingVisaInfoRequest>? vasaInfo;
  List<TicketRequest>? ticket;
  List<TicketBackRequest>? ticketBack;
  List<BoardingPassRequest>? boardingPass;
  DateTime? certificateOfEligibility;
  String? certificateOfEligibilityFileName;

  AfterGettingVisaRequest({
    this.vasaInfo,
    this.ticket,
    this.ticketBack,
    this.boardingPass,
    this.certificateOfEligibility,
    this.certificateOfEligibilityFileName,
  });

  factory AfterGettingVisaRequest.fromJson(Map<String,dynamic> json){
    return _$AfterGettingVisaRequestFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$AfterGettingVisaRequestToJson(this);
  }
  

}






