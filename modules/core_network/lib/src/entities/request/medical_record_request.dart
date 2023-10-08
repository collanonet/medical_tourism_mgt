import 'package:json_annotation/json_annotation.dart';

part 'medical_record_request.g.dart';

@JsonSerializable()
class MedicalRecordRequest {
   DateTime? arrivalDate;
   DateTime? examinationDate;
   DateTime? departureDate;
   String? caseNumber;
   DateTime? receptionDate;
   String? type;
   String? progress;
   DateTime? advancePaymentDate;
   String? paymentMethod;
   String? memo;
   String? patient;

  MedicalRecordRequest({
     this.arrivalDate,
     this.examinationDate,
     this.departureDate,
     this.caseNumber,
     this.receptionDate,
     this.type,
     this.progress,
     this.advancePaymentDate,
     this.paymentMethod,
    this.memo,
     this.patient,
  });

  factory MedicalRecordRequest.fromJson(Map<String, dynamic> json) {
    return _$MedicalRecordRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicalRecordRequestToJson(this);
}
