// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getting_final_ticket_back.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
