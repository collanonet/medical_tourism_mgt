// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_visa_required_in_japan_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalVisaRequiredInJapanResponse _$MedicalVisaRequiredInJapanResponseFromJson(
        Map<String, dynamic> json) =>
    MedicalVisaRequiredInJapanResponse(
      id: json['_id'] as String?,
      visaInfo: (json['visaInfo'] as List<dynamic>?)
          ?.map((e) => VisaInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      schedule: (json['schedule'] as List<dynamic>?)
          ?.map((e) => Schedule.fromJson(e as Map<String, dynamic>))
          .toList(),
      statementOfReasonsDate: json['statementOfReasonsDate'] == null
          ? null
          : DateTime.parse(json['statementOfReasonsDate'] as String),
      travelCompanionListDate: json['travelCompanionListDate'] == null
          ? null
          : DateTime.parse(json['travelCompanionListDate'] as String),
      travelInfo: (json['travelInfo'] as List<dynamic>?)
          ?.map((e) => TravelInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      statementOfReasonsFileSelect:
          json['statementOfReasonsFileSelect'] as String?,
      travelCompanionListFileSelect:
          json['travelCompanionListFileSelect'] as String?,
    );

Map<String, dynamic> _$MedicalVisaRequiredInJapanResponseToJson(
        MedicalVisaRequiredInJapanResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'visaInfo': instance.visaInfo,
      'schedule': instance.schedule,
      'statementOfReasonsDate':
          instance.statementOfReasonsDate?.toIso8601String(),
      'statementOfReasonsFileSelect': instance.statementOfReasonsFileSelect,
      'travelCompanionListDate':
          instance.travelCompanionListDate?.toIso8601String(),
      'travelCompanionListFileSelect': instance.travelCompanionListFileSelect,
      'travelInfo': instance.travelInfo,
    };

VisaInfo _$VisaInfoFromJson(Map<String, dynamic> json) => VisaInfo(
      passportDate: json['passportDate'] == null
          ? null
          : DateTime.parse(json['passportDate'] as String),
      passportFileSelect: json['passportFileSelect'] as String?,
      letterOfGuaranteeFileSelect:
          json['letterOfGuaranteeFileSelect'] as String?,
      letterOfGuaranteeDate: json['letterOfGuaranteeDate'] == null
          ? null
          : DateTime.parse(json['letterOfGuaranteeDate'] as String),
      sendBy: json['sendBy'] as String?,
      byEMS: json['byEMS'] as bool?,
      byFedex: json['byFedex'] as bool?,
      byOthers: json['byOthers'] as bool?,
    );

Map<String, dynamic> _$VisaInfoToJson(VisaInfo instance) => <String, dynamic>{
      'passportDate': instance.passportDate?.toIso8601String(),
      'passportFileSelect': instance.passportFileSelect,
      'letterOfGuaranteeDate':
          instance.letterOfGuaranteeDate?.toIso8601String(),
      'letterOfGuaranteeFileSelect': instance.letterOfGuaranteeFileSelect,
      'sendBy': instance.sendBy,
      'byEMS': instance.byEMS,
      'byFedex': instance.byFedex,
      'byOthers': instance.byOthers,
    };

Schedule _$ScheduleFromJson(Map<String, dynamic> json) => Schedule(
      id: json['_id'] as String?,
      treatmentSchedule: json['treatmentSchedule'] == null
          ? null
          : DateTime.parse(json['treatmentSchedule'] as String),
      treatmentScheduleFileSelect:
          json['treatmentScheduleFileSelect'] as String?,
    );

Map<String, dynamic> _$ScheduleToJson(Schedule instance) => <String, dynamic>{
      '_id': instance.id,
      'treatmentSchedule': instance.treatmentSchedule?.toIso8601String(),
      'treatmentScheduleFileSelect': instance.treatmentScheduleFileSelect,
    };

TravelInfo _$TravelInfoFromJson(Map<String, dynamic> json) => TravelInfo(
      id: json['_id'] as String?,
      landingPermissionDate: json['landingPermissionDate'] == null
          ? null
          : DateTime.parse(json['landingPermissionDate'] as String),
      visaValidityPeriodExpirationDate:
          json['visaValidityPeriodExpirationDate'] == null
              ? null
              : DateTime.parse(
                  json['visaValidityPeriodExpirationDate'] as String),
      dateOfEntryIntoJapan: json['dateOfEntryIntoJapan'] == null
          ? null
          : DateTime.parse(json['dateOfEntryIntoJapan'] as String),
      departureDateFromJapan: json['departureDateFromJapan'] == null
          ? null
          : DateTime.parse(json['departureDateFromJapan'] as String),
      departureIn: json['departureIn'] as String?,
      arrivalIn: json['arrivalIn'] as String?,
      flightNumberIn: json['flightNumberIn'] as String?,
      departureTimeIn: json['departureTimeIn'] as String?,
      arrivalTimeIn: json['arrivalTimeIn'] as String?,
      departureOut: json['departureOut'] as String?,
      arrivalOut: json['arrivalOut'] as String?,
      flightNumberOut: json['flightNumberOut'] as String?,
      departureTimeOut: json['departureTimeOut'] as String?,
      arrivalTimeOut: json['arrivalTimeOut'] as String?,
      seatNumberOut: json['seatNumberOut'] as String?,
      remarks: json['remarks'] as String?,
    );

Map<String, dynamic> _$TravelInfoToJson(TravelInfo instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'landingPermissionDate':
          instance.landingPermissionDate?.toIso8601String(),
      'visaValidityPeriodExpirationDate':
          instance.visaValidityPeriodExpirationDate?.toIso8601String(),
      'dateOfEntryIntoJapan': instance.dateOfEntryIntoJapan?.toIso8601String(),
      'departureDateFromJapan':
          instance.departureDateFromJapan?.toIso8601String(),
      'departureIn': instance.departureIn,
      'arrivalIn': instance.arrivalIn,
      'flightNumberIn': instance.flightNumberIn,
      'departureTimeIn': instance.departureTimeIn,
      'arrivalTimeIn': instance.arrivalTimeIn,
      'departureOut': instance.departureOut,
      'arrivalOut': instance.arrivalOut,
      'flightNumberOut': instance.flightNumberOut,
      'departureTimeOut': instance.departureTimeOut,
      'arrivalTimeOut': instance.arrivalTimeOut,
      'seatNumberOut': instance.seatNumberOut,
      'remarks': instance.remarks,
    };
