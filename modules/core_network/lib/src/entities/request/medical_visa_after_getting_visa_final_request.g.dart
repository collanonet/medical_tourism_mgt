// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_visa_after_getting_visa_final_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalAfterGettingVisaFinalRequest
    _$MedicalAfterGettingVisaFinalRequestFromJson(Map<String, dynamic> json) =>
        MedicalAfterGettingVisaFinalRequest(
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

Map<String, dynamic> _$MedicalAfterGettingVisaFinalRequestToJson(
        MedicalAfterGettingVisaFinalRequest instance) =>
    <String, dynamic>{
      'vasaInfo': instance.vasaInfo,
      'ticket': instance.ticket,
      'ticketBack': instance.ticketBack,
      'boardingPass': instance.boardingPass,
      'certificateOfEligibility':
          instance.certificateOfEligibility?.toIso8601String(),
    };
