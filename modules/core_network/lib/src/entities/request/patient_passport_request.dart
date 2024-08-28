// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'patient_passport_request.g.dart';

@JsonSerializable()
class PatientPassportRequest {
   String? passportNumber;
   DateTime? issueDate;
   DateTime? expirationDate;
   String? visaType;
   String? visaCategory;
   bool? underConfirmation;
   String? patient;

  PatientPassportRequest({
     this.passportNumber,
     this.issueDate,
     this.expirationDate,
     this.visaType,
     this.visaCategory,
     this.underConfirmation,
     this.patient,
  });

  factory PatientPassportRequest.fromJson(Map<String, dynamic> json) {
    return _$PatientPassportRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PatientPassportRequestToJson(this);
}
