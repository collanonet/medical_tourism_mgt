// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getting_visa_ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ticket _$TicketFromJson(Map<String, dynamic> json) => Ticket(
      planeTicketForYourVisitToJapan: json['planeTicketForYourVisitToJapan'] ==
              null
          ? null
          : DateTime.parse(json['planeTicketForYourVisitToJapan'] as String),
    );

Map<String, dynamic> _$TicketToJson(Ticket instance) => <String, dynamic>{
      'planeTicketForYourVisitToJapan':
          instance.planeTicketForYourVisitToJapan?.toIso8601String(),
    };
