// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getting_visa_ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketRequest _$TicketRequestFromJson(Map<String, dynamic> json) =>
    TicketRequest(
      planeTicketForYourVisitToJapan: json['planeTicketForYourVisitToJapan'] ==
              null
          ? null
          : DateTime.parse(json['planeTicketForYourVisitToJapan'] as String),
      planeTicketForYourVisitToJapanFileName:
          json['planeTicketForYourVisitToJapanFileName'] as String?,
    );

Map<String, dynamic> _$TicketRequestToJson(TicketRequest instance) =>
    <String, dynamic>{
      'planeTicketForYourVisitToJapan':
          instance.planeTicketForYourVisitToJapan?.toIso8601String(),
      'planeTicketForYourVisitToJapanFileName':
          instance.planeTicketForYourVisitToJapanFileName,
    };
