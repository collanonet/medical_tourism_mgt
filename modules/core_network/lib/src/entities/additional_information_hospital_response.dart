import 'package:json_annotation/json_annotation.dart';

part 'additional_information_hospital_response.g.dart';

@JsonSerializable()
class AdditionalInformationSectionResponse {
  @JsonKey(name: '_id')
  String id;
  String hospital;
  String? outsourcingContract;
  List<String?>? contract;
  String? msCorporation;
  String? referralFee;
  String? treatmentCostPointCalculationPerPoint;
  String? remark;
  String? paymentSiteTighten;
  String? paymentSitePayment;
  String? file;

  AdditionalInformationSectionResponse({
    required this.id,
    required this.hospital,
    this.outsourcingContract,
    this.contract,
    this.msCorporation,
    this.referralFee,
    this.treatmentCostPointCalculationPerPoint,
    this.remark,
    this.paymentSiteTighten,
    this.paymentSitePayment,
    this.file,
  });

  factory AdditionalInformationSectionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AdditionalInformationSectionResponseFromJson(json);
  Map<String, dynamic> toJson() =>
      _$AdditionalInformationSectionResponseToJson(this);
}
