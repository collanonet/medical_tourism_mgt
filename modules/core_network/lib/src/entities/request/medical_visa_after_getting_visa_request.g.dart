// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_visa_after_getting_visa_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AfterGettingVisaRequest _$AfterGettingVisaRequestFromJson(
        Map<String, dynamic> json) =>
    AfterGettingVisaRequest(
      vasaInfo: (json['vasaInfo'] as List<dynamic>?)
          ?.map(
              (e) => GettingVisaInfoRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      ticket: (json['ticket'] as List<dynamic>?)
          ?.map((e) => TicketRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      ticketBack: (json['ticketBack'] as List<dynamic>?)
          ?.map((e) => TicketBackRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      boardingPass: (json['boardingPass'] as List<dynamic>?)
          ?.map((e) => BoardingPassRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      certificateOfEligibility: json['certificateOfEligibility'] == null
          ? null
          : DateTime.parse(json['certificateOfEligibility'] as String),
      certificateOfEligibilityFileName:
          json['certificateOfEligibilityFileName'] as String?,
    );

Map<String, dynamic> _$AfterGettingVisaRequestToJson(
        AfterGettingVisaRequest instance) =>
    <String, dynamic>{
      'vasaInfo': instance.vasaInfo,
      'ticket': instance.ticket,
      'ticketBack': instance.ticketBack,
      'boardingPass': instance.boardingPass,
      'certificateOfEligibility':
          instance.certificateOfEligibility?.toIso8601String(),
      'certificateOfEligibilityFileName':
          instance.certificateOfEligibilityFileName,
    };
