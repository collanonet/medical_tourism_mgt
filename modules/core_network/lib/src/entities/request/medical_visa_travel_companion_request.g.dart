// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_visa_travel_companion_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalVisaTravelCompanionRequest _$MedicalVisaTravelCompanionRequestFromJson(
        Map<String, dynamic> json) =>
    MedicalVisaTravelCompanionRequest(
      nameRomaji: json['nameRomaji'] as String?,
      dateBirth: json['dateBirth'] == null
          ? null
          : DateTime.parse(json['dateBirth'] as String),
      age: (json['age'] as num?)?.toInt(),
      sex: json['sex'] as String?,
      addressArea: json['addressArea'] as String?,
      numberPassport: json['numberPassport'] as String?,
      travelInfo: (json['travelInfo'] as List<dynamic>?)
          ?.map((e) => TravelInfoRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      travelRemarks: json['travelRemarks'] as String?,
      subjectVisaWithdrawal: json['subjectVisaWithdrawal'] as bool?,
      deathOrOccurrenceEventDate: json['deathOrOccurrenceEventDate'] == null
          ? null
          : DateTime.parse(json['deathOrOccurrenceEventDate'] as String),
      remarks: json['remarks'] as String?,
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
    );

Map<String, dynamic> _$MedicalVisaTravelCompanionRequestToJson(
        MedicalVisaTravelCompanionRequest instance) =>
    <String, dynamic>{
      'nameRomaji': instance.nameRomaji,
      'dateBirth': instance.dateBirth?.toIso8601String(),
      'age': instance.age,
      'sex': instance.sex,
      'addressArea': instance.addressArea,
      'numberPassport': instance.numberPassport,
      'travelInfo': instance.travelInfo,
      'travelRemarks': instance.travelRemarks,
      'subjectVisaWithdrawal': instance.subjectVisaWithdrawal,
      'deathOrOccurrenceEventDate':
          instance.deathOrOccurrenceEventDate?.toIso8601String(),
      'remarks': instance.remarks,
      'vasaInfo': instance.vasaInfo,
      'ticket': instance.ticket,
      'ticketBack': instance.ticketBack,
      'boardingPass': instance.boardingPass,
      'certificateOfEligibility':
          instance.certificateOfEligibility?.toIso8601String(),
    };
