// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getting_visa_ticket_back.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketBackRequest _$TicketBackRequestFromJson(Map<String, dynamic> json) =>
    TicketBackRequest(
      returnFlightTicket: json['returnFlightTicket'] == null
          ? null
          : DateTime.parse(json['returnFlightTicket'] as String),
      returnFlightTicketFileName: json['returnFlightTicketFileName'] as String?,
    );

Map<String, dynamic> _$TicketBackRequestToJson(TicketBackRequest instance) =>
    <String, dynamic>{
      'returnFlightTicket': instance.returnFlightTicket?.toIso8601String(),
      'returnFlightTicketFileName': instance.returnFlightTicketFileName,
    };
