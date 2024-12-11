import 'package:json_annotation/json_annotation.dart';
part 'medical_visa_after_getting_visa_response.g.dart';

@JsonSerializable()
class AfterGettingVisaResponse {
  @JsonKey(name: '_id')
  final String? id;
  List<VasaInfo>? vasaInfo;
  List<Ticket>? ticket;
  List<TicketBack>? ticketBack;
  List<BoardingPass>? boardingPass;
  DateTime? certificateOfEligibility;

  AfterGettingVisaResponse({
    this.id,
    this.vasaInfo,
    this.ticket,
    this.ticketBack,
    this.boardingPass,
    this.certificateOfEligibility,
  });

  factory AfterGettingVisaResponse.fromJson(Map<String, dynamic> json) {
    return _$AfterGettingVisaResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AfterGettingVisaResponseToJson(this);
  }
}

@JsonSerializable()
class VasaInfo {
  @JsonKey(name: '_id')
  final String id;
  DateTime? visaPage;
  DateTime? landingPermit;
  String? visaPageFileName;
  String? landingPermitFileName;

  VasaInfo({
    required this.id,
    this.visaPage,
    this.landingPermit,
    this.visaPageFileName,
    this.landingPermitFileName,
  });

  factory VasaInfo.fromJson(Map<String, dynamic> json) {
    return _$VasaInfoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$VasaInfoToJson(this);
  }
}

@JsonSerializable()
class Ticket {
  @JsonKey(name: '_id')
  final String id;
  DateTime? planeTicketForYourVisitToJapan;
  String? planeTicketForYourVisitToJapanFileName;

  Ticket({
    required this.id,
    this.planeTicketForYourVisitToJapan,
    this.planeTicketForYourVisitToJapanFileName,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return _$TicketFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TicketToJson(this);
  }
}

@JsonSerializable()
class TicketBack {
  @JsonKey(name: '_id')
  final String id;
  DateTime? returnFlightTicket;

  TicketBack({
    required this.id,
    this.returnFlightTicket,
  });

  factory TicketBack.fromJson(Map<String, dynamic> json) {
    return _$TicketBackFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TicketBackToJson(this);
  }
}

@JsonSerializable()
class BoardingPass {
  @JsonKey(name: '_id')
  final String id;
  DateTime? boardingPassForReturnFlight;

  BoardingPass({
    required this.id,
    this.boardingPassForReturnFlight,
  });

  factory BoardingPass.fromJson(Map<String, dynamic> json) {
    return _$BoardingPassFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BoardingPassToJson(this);
  }
}
