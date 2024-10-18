// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getting_visa_ticket_back.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketBack _$TicketBackFromJson(Map<String, dynamic> json) => TicketBack(
      returnFlightTicket: json['returnFlightTicket'] == null
          ? null
          : DateTime.parse(json['returnFlightTicket'] as String),
    );

Map<String, dynamic> _$TicketBackToJson(TicketBack instance) =>
    <String, dynamic>{
      'returnFlightTicket': instance.returnFlightTicket?.toIso8601String(),
    };
