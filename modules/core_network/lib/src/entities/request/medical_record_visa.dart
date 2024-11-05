import 'package:json_annotation/json_annotation.dart';

import '../../../entities.dart';
part 'medical_record_visa.g.dart';

@JsonSerializable()
class MedicalRecordVisaRequest {
  String? medicalRecord;
  List<MedicalVisaPersonalRequest>? personal;
  List<MedicalVisaStayPeriodRequest>? stayPeriod;
  RequiredInJapan? requiredInJapan;
  MedicalVisaWithdrawalRequest? visaWithdrawal;
  AfterGettingVisaRequest? afterGettingVisa;
  MedicalVisaTravelCompanionRequest? travelCompanion;

  MedicalRecordVisaRequest({
    this.medicalRecord,
    this.personal,
    this.stayPeriod,
    this.requiredInJapan,
    this.visaWithdrawal,
    this.afterGettingVisa,
    this.travelCompanion,
  });

  factory MedicalRecordVisaRequest.fromJson(Map<String, dynamic> json) =>
      _$MedicalRecordVisaRequestFromJson(json);
  Map<String, dynamic> toJson() => _$MedicalRecordVisaRequestToJson(this);
}
