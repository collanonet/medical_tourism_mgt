import 'package:json_annotation/json_annotation.dart';

import '../../../entities.dart';
part 'medical_record_visa_response.g.dart';

@JsonSerializable()
class MedicalRecordVisaResponse {
    @JsonKey(name: '_id')
  String id;
  List<MedicalVisaPersonalResponse>? personal;
  List<MedicalVisaStayPeriodResponse>? stayPeriod;
  MedicalVisaRequiredInJapanResponse? requiredInJapan;
  MedicalVisaVisaWithdrawalResponse? visaWithdrawal;
  AfterGettingVisaResponse? afterGettingVisa;
  MedicalVisaTravelCompanionResponse? travelCompanion;

  MedicalRecordVisaResponse({
    required this.id,
    this.personal,
    this.stayPeriod,
    this.requiredInJapan,
    this.visaWithdrawal,
    this.afterGettingVisa,
    this.travelCompanion,
  });

  factory MedicalRecordVisaResponse.fromJson(Map<String, dynamic> json) => _$MedicalRecordVisaResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MedicalRecordVisaResponseToJson(this);

 
}
