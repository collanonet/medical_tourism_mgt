// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'medical_visa_required_in_japan_response.g.dart';

@JsonSerializable()
class MedicalVisaRequiredInJapanResponse {
  @JsonKey(name: '_id')
  final String id;
  final DateTime? passportFileUploadDate;
  final String? passportFileUpload;
  final DateTime? personalReferenceFileUploadDate;
  final String? personalReferenceFileUpload;
  final String? sendOriginalEmsFedexPdsFileUpload;
  final DateTime? treatmentScheduleFileUploadDate;
  final String? treatmentScheduleFileUpload;
  final DateTime? statementReasonsFileUploadDate;
  final String? statementReasonsFileUpload;
  final DateTime? accompanyingPersonsListFileUploadDate;
  final String? accompanyingPersonsListFileUpload;
  final DateTime? visaPageFileUploadDate;
  final String? visaPageFileUpload;
  final DateTime? landingPermitFileUploadDate;
  final String? landingPermitFileUpload;
  final DateTime? airlineTickeArrivalJapanFileUploadDate;
  final String? airlineTickeArrivalJapanFileUpload;
  final DateTime? airlineTicketReturnJapanFileUploadDate;
  final String? airlineTicketReturnJapanFileUpload;
  final DateTime? boardingPassReturningFileUploadDate;
  final String? boardingPassReturningFileUpload;
  final DateTime? certificateEligibilityFileUploadDate;
  final String? certificateEligibilityFileUpload;
  final DateTime? photoFileUploadDate;
  final String? photoFileUpload;
  final DateTime? visaApplicationFormFileUploadDate;
  final String? visaApplicationFormFileUpload;
  final DateTime? bankBalanceCertificateFileUploadDate;
  final String? bankBalanceCertificateFileUpload;
  final DateTime? identificationDocumentsFileUploadDate;
  final String? identificationDocumentsFileUpload;
  final DateTime? othersFileUploadDate;
  final String? othersFileUpload;

  MedicalVisaRequiredInJapanResponse({
    required this.id,
    this.passportFileUpload,
    this.passportFileUploadDate,
    this.personalReferenceFileUploadDate,
    this.personalReferenceFileUpload,
    this.sendOriginalEmsFedexPdsFileUpload,
    this.treatmentScheduleFileUploadDate,
    this.treatmentScheduleFileUpload,
    this.statementReasonsFileUploadDate,
    this.statementReasonsFileUpload,
    this.accompanyingPersonsListFileUploadDate,
    this.accompanyingPersonsListFileUpload,
    this.visaPageFileUploadDate,
    this.visaPageFileUpload,
    this.landingPermitFileUploadDate,
    this.landingPermitFileUpload,
    this.airlineTickeArrivalJapanFileUploadDate,
    this.airlineTickeArrivalJapanFileUpload,
    this.airlineTicketReturnJapanFileUploadDate,
    this.airlineTicketReturnJapanFileUpload,
    this.boardingPassReturningFileUploadDate,
    this.boardingPassReturningFileUpload,
    this.certificateEligibilityFileUploadDate,
    this.certificateEligibilityFileUpload,
    this.photoFileUploadDate,
    this.photoFileUpload,
    this.visaApplicationFormFileUploadDate,
    this.visaApplicationFormFileUpload,
    this.bankBalanceCertificateFileUploadDate,
    this.bankBalanceCertificateFileUpload,
    this.identificationDocumentsFileUploadDate,
    this.identificationDocumentsFileUpload,
    this.othersFileUploadDate,
    this.othersFileUpload,
  });

  factory MedicalVisaRequiredInJapanResponse.fromJson(
          Map<String, dynamic> json) =>
      _$MedicalVisaRequiredInJapanResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MedicalVisaRequiredInJapanResponseToJson(this);
}
