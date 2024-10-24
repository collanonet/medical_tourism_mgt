import 'package:json_annotation/json_annotation.dart';

import 'getting_visa_boarding_pass.dart';
import 'getting_visa_info.dart';
import 'getting_visa_ticket.dart';
import 'getting_visa_ticket_back.dart';
import 'travel_info.dart';

part 'medical_visa_travel_companion_request.g.dart';
@JsonSerializable()
class MedicalVisaTravelCompanionRequest {
  String? nameRomaji;
  DateTime? dateBirth;
  int? age;
  String? sex;
  String? addressArea;
  String? numberPassport;
  List<TravelInfoRequest>? travelInfo;
  String? travelRemarks;
  bool? subjectVisaWithdrawal;
  DateTime? deathOrOccurrenceEventDate;
  String? remarks;
  List<GettingVisaInfoRequest>? vasaInfo;
  List<TicketRequest>? ticket;
  List<TicketBackRequest>? ticketBack;
  List<BoardingPassRequest>? boardingPass;
  DateTime? certificateOfEligibility;

  MedicalVisaTravelCompanionRequest({
    this.nameRomaji,
    this.dateBirth,
    this.age,
    this.sex,
    this.addressArea,
    this.numberPassport,
    this.travelInfo,
    this.travelRemarks,
    this.subjectVisaWithdrawal,
    this.deathOrOccurrenceEventDate,
    this.remarks,
    this.vasaInfo,
    this.ticket,
    this.ticketBack,
    this.boardingPass,
    this.certificateOfEligibility,
  });

  factory MedicalVisaTravelCompanionRequest.fromJson(Map<String,dynamic> json){
    return _$MedicalVisaTravelCompanionRequestFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$MedicalVisaTravelCompanionRequestToJson(this);
  }
}


