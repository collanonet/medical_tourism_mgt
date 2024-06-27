// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_visa_required_in_japan_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalVisaRequiredInJapanResponse _$MedicalVisaRequiredInJapanResponseFromJson(
        Map<String, dynamic> json) =>
    MedicalVisaRequiredInJapanResponse(
      id: json['_id'] as String,
      passportFileUpload: json['passportFileUpload'] as String?,
      passportFileUploadDate: json['passportFileUploadDate'] == null
          ? null
          : DateTime.parse(json['passportFileUploadDate'] as String),
      personalReferenceFileUploadDate:
          json['personalReferenceFileUploadDate'] == null
              ? null
              : DateTime.parse(
                  json['personalReferenceFileUploadDate'] as String),
      personalReferenceFileUpload:
          json['personalReferenceFileUpload'] as String?,
      sendOriginalEmsFedexPdsFileUpload:
          json['sendOriginalEmsFedexPdsFileUpload'] as String?,
      treatmentScheduleFileUploadDate:
          json['treatmentScheduleFileUploadDate'] == null
              ? null
              : DateTime.parse(
                  json['treatmentScheduleFileUploadDate'] as String),
      treatmentScheduleFileUpload:
          json['treatmentScheduleFileUpload'] as String?,
      statementReasonsFileUploadDate: json['statementReasonsFileUploadDate'] ==
              null
          ? null
          : DateTime.parse(json['statementReasonsFileUploadDate'] as String),
      statementReasonsFileUpload: json['statementReasonsFileUpload'] as String?,
      accompanyingPersonsListFileUploadDate:
          json['accompanyingPersonsListFileUploadDate'] == null
              ? null
              : DateTime.parse(
                  json['accompanyingPersonsListFileUploadDate'] as String),
      accompanyingPersonsListFileUpload:
          json['accompanyingPersonsListFileUpload'] as String?,
      visaPageFileUploadDate: json['visaPageFileUploadDate'] == null
          ? null
          : DateTime.parse(json['visaPageFileUploadDate'] as String),
      visaPageFileUpload: json['visaPageFileUpload'] as String?,
      landingPermitFileUploadDate: json['landingPermitFileUploadDate'] == null
          ? null
          : DateTime.parse(json['landingPermitFileUploadDate'] as String),
      landingPermitFileUpload: json['landingPermitFileUpload'] as String?,
      airlineTickeArrivalJapanFileUploadDate:
          json['airlineTickeArrivalJapanFileUploadDate'] == null
              ? null
              : DateTime.parse(
                  json['airlineTickeArrivalJapanFileUploadDate'] as String),
      airlineTickeArrivalJapanFileUpload:
          json['airlineTickeArrivalJapanFileUpload'] as String?,
      airlineTicketReturnJapanFileUploadDate:
          json['airlineTicketReturnJapanFileUploadDate'] == null
              ? null
              : DateTime.parse(
                  json['airlineTicketReturnJapanFileUploadDate'] as String),
      airlineTicketReturnJapanFileUpload:
          json['airlineTicketReturnJapanFileUpload'] as String?,
      boardingPassReturningFileUploadDate:
          json['boardingPassReturningFileUploadDate'] == null
              ? null
              : DateTime.parse(
                  json['boardingPassReturningFileUploadDate'] as String),
      boardingPassReturningFileUpload:
          json['boardingPassReturningFileUpload'] as String?,
      certificateEligibilityFileUploadDate:
          json['certificateEligibilityFileUploadDate'] == null
              ? null
              : DateTime.parse(
                  json['certificateEligibilityFileUploadDate'] as String),
      certificateEligibilityFileUpload:
          json['certificateEligibilityFileUpload'] as String?,
      photoFileUploadDate: json['photoFileUploadDate'] == null
          ? null
          : DateTime.parse(json['photoFileUploadDate'] as String),
      photoFileUpload: json['photoFileUpload'] as String?,
      visaApplicationFormFileUploadDate:
          json['visaApplicationFormFileUploadDate'] == null
              ? null
              : DateTime.parse(
                  json['visaApplicationFormFileUploadDate'] as String),
      visaApplicationFormFileUpload:
          json['visaApplicationFormFileUpload'] as String?,
      bankBalanceCertificateFileUploadDate:
          json['bankBalanceCertificateFileUploadDate'] == null
              ? null
              : DateTime.parse(
                  json['bankBalanceCertificateFileUploadDate'] as String),
      bankBalanceCertificateFileUpload:
          json['bankBalanceCertificateFileUpload'] as String?,
      identificationDocumentsFileUploadDate:
          json['identificationDocumentsFileUploadDate'] == null
              ? null
              : DateTime.parse(
                  json['identificationDocumentsFileUploadDate'] as String),
      identificationDocumentsFileUpload:
          json['identificationDocumentsFileUpload'] as String?,
      othersFileUploadDate: json['othersFileUploadDate'] == null
          ? null
          : DateTime.parse(json['othersFileUploadDate'] as String),
      othersFileUpload: json['othersFileUpload'] as String?,
    );

Map<String, dynamic> _$MedicalVisaRequiredInJapanResponseToJson(
        MedicalVisaRequiredInJapanResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'passportFileUploadDate':
          instance.passportFileUploadDate?.toIso8601String(),
      'passportFileUpload': instance.passportFileUpload,
      'personalReferenceFileUploadDate':
          instance.personalReferenceFileUploadDate?.toIso8601String(),
      'personalReferenceFileUpload': instance.personalReferenceFileUpload,
      'sendOriginalEmsFedexPdsFileUpload':
          instance.sendOriginalEmsFedexPdsFileUpload,
      'treatmentScheduleFileUploadDate':
          instance.treatmentScheduleFileUploadDate?.toIso8601String(),
      'treatmentScheduleFileUpload': instance.treatmentScheduleFileUpload,
      'statementReasonsFileUploadDate':
          instance.statementReasonsFileUploadDate?.toIso8601String(),
      'statementReasonsFileUpload': instance.statementReasonsFileUpload,
      'accompanyingPersonsListFileUploadDate':
          instance.accompanyingPersonsListFileUploadDate?.toIso8601String(),
      'accompanyingPersonsListFileUpload':
          instance.accompanyingPersonsListFileUpload,
      'visaPageFileUploadDate':
          instance.visaPageFileUploadDate?.toIso8601String(),
      'visaPageFileUpload': instance.visaPageFileUpload,
      'landingPermitFileUploadDate':
          instance.landingPermitFileUploadDate?.toIso8601String(),
      'landingPermitFileUpload': instance.landingPermitFileUpload,
      'airlineTickeArrivalJapanFileUploadDate':
          instance.airlineTickeArrivalJapanFileUploadDate?.toIso8601String(),
      'airlineTickeArrivalJapanFileUpload':
          instance.airlineTickeArrivalJapanFileUpload,
      'airlineTicketReturnJapanFileUploadDate':
          instance.airlineTicketReturnJapanFileUploadDate?.toIso8601String(),
      'airlineTicketReturnJapanFileUpload':
          instance.airlineTicketReturnJapanFileUpload,
      'boardingPassReturningFileUploadDate':
          instance.boardingPassReturningFileUploadDate?.toIso8601String(),
      'boardingPassReturningFileUpload':
          instance.boardingPassReturningFileUpload,
      'certificateEligibilityFileUploadDate':
          instance.certificateEligibilityFileUploadDate?.toIso8601String(),
      'certificateEligibilityFileUpload':
          instance.certificateEligibilityFileUpload,
      'photoFileUploadDate': instance.photoFileUploadDate?.toIso8601String(),
      'photoFileUpload': instance.photoFileUpload,
      'visaApplicationFormFileUploadDate':
          instance.visaApplicationFormFileUploadDate?.toIso8601String(),
      'visaApplicationFormFileUpload': instance.visaApplicationFormFileUpload,
      'bankBalanceCertificateFileUploadDate':
          instance.bankBalanceCertificateFileUploadDate?.toIso8601String(),
      'bankBalanceCertificateFileUpload':
          instance.bankBalanceCertificateFileUpload,
      'identificationDocumentsFileUploadDate':
          instance.identificationDocumentsFileUploadDate?.toIso8601String(),
      'identificationDocumentsFileUpload':
          instance.identificationDocumentsFileUpload,
      'othersFileUploadDate': instance.othersFileUploadDate?.toIso8601String(),
      'othersFileUpload': instance.othersFileUpload,
    };
