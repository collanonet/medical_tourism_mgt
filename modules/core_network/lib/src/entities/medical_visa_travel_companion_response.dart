import 'package:json_annotation/json_annotation.dart';

import 'medical_visa_after_getting_visa_response.dart';
import 'medical_visa_required_in_japan_response.dart';
part 'medical_visa_travel_companion_response.g.dart';

@JsonSerializable()
class MedicalVisaTravelCompanionResponse {
  @JsonKey(name: '_id')
  final String? id;
  String? nameRomaji;
  DateTime? dateBirth;
  int? age;
  String? sex;
  String? addressArea;
  String? numberPassport;
  List<TravelInfo>? travelInfo;
  String? travelRemarks;
  bool? visaWithdrawalTarget;
 // DateTime? deathOrOccurrenceEventDate;
  String? remarks;
  String? reason;
  List<VasaInfo>? vasaInfo;
  List<Ticket>? ticket;
  List<TicketBack>? ticketBack;
  List<BoardingPass>? boardingPass;
  DateTime? certificateOfEligibility;
  String? certificateOfEligibilityFileName;

  MedicalVisaTravelCompanionResponse({
    required this.id,
    this.nameRomaji,
    this.dateBirth,
    this.age,
    this.sex,
    this.addressArea,
    this.numberPassport,
    this.travelInfo,
    this.travelRemarks,
    this.visaWithdrawalTarget,
    this.reason,
    this.remarks,
    this.vasaInfo,
    this.ticket,
    this.ticketBack,
    this.boardingPass,
    this.certificateOfEligibility,
    this.certificateOfEligibilityFileName,
  });

  factory MedicalVisaTravelCompanionResponse.fromJson(Map<String, dynamic> json) => _$MedicalVisaTravelCompanionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MedicalVisaTravelCompanionResponseToJson(this);
}

