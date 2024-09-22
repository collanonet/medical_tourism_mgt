// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getting_final_ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
