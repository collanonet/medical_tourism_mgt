// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_visa_after_getting_visa_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AfterGettingVisaResponse _$AfterGettingVisaResponseFromJson(
        Map<String, dynamic> json) =>
    AfterGettingVisaResponse(
      id: json['_id'] as String?,
      vasaInfo: (json['vasaInfo'] as List<dynamic>?)
          ?.map((e) => VasaInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      ticket: (json['ticket'] as List<dynamic>?)
          ?.map((e) => Ticket.fromJson(e as Map<String, dynamic>))
          .toList(),
      ticketBack: (json['ticketBack'] as List<dynamic>?)
          ?.map((e) => TicketBack.fromJson(e as Map<String, dynamic>))
          .toList(),
      boardingPass: (json['boardingPass'] as List<dynamic>?)
          ?.map((e) => BoardingPass.fromJson(e as Map<String, dynamic>))
          .toList(),
      certificateOfEligibility: json['certificateOfEligibility'] == null
          ? null
          : DateTime.parse(json['certificateOfEligibility'] as String),
    );

Map<String, dynamic> _$AfterGettingVisaResponseToJson(
        AfterGettingVisaResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'vasaInfo': instance.vasaInfo,
      'ticket': instance.ticket,
      'ticketBack': instance.ticketBack,
      'boardingPass': instance.boardingPass,
      'certificateOfEligibility':
          instance.certificateOfEligibility?.toIso8601String(),
    };

VasaInfo _$VasaInfoFromJson(Map<String, dynamic> json) => VasaInfo(
      id: json['_id'] as String,
      visaPage: json['visaPage'] == null
          ? null
          : DateTime.parse(json['visaPage'] as String),
      landingPermit: json['landingPermit'] == null
          ? null
          : DateTime.parse(json['landingPermit'] as String),
    );

Map<String, dynamic> _$VasaInfoToJson(VasaInfo instance) => <String, dynamic>{
      '_id': instance.id,
      'visaPage': instance.visaPage?.toIso8601String(),
      'landingPermit': instance.landingPermit?.toIso8601String(),
    };

Ticket _$TicketFromJson(Map<String, dynamic> json) => Ticket(
      id: json['_id'] as String,
      planeTicketForYourVisitToJapan: json['planeTicketForYourVisitToJapan'] ==
              null
          ? null
          : DateTime.parse(json['planeTicketForYourVisitToJapan'] as String),
    );

Map<String, dynamic> _$TicketToJson(Ticket instance) => <String, dynamic>{
      '_id': instance.id,
      'planeTicketForYourVisitToJapan':
          instance.planeTicketForYourVisitToJapan?.toIso8601String(),
    };

TicketBack _$TicketBackFromJson(Map<String, dynamic> json) => TicketBack(
      id: json['_id'] as String,
      returnFlightTicket: json['returnFlightTicket'] == null
          ? null
          : DateTime.parse(json['returnFlightTicket'] as String),
    );

Map<String, dynamic> _$TicketBackToJson(TicketBack instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'returnFlightTicket': instance.returnFlightTicket?.toIso8601String(),
    };

BoardingPass _$BoardingPassFromJson(Map<String, dynamic> json) => BoardingPass(
      id: json['_id'] as String,
      boardingPassForReturnFlight: json['boardingPassForReturnFlight'] == null
          ? null
          : DateTime.parse(json['boardingPassForReturnFlight'] as String),
    );

Map<String, dynamic> _$BoardingPassToJson(BoardingPass instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'boardingPassForReturnFlight':
          instance.boardingPassForReturnFlight?.toIso8601String(),
    };
