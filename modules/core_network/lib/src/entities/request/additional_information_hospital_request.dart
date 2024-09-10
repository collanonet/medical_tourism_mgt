// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'additional_information_hospital_request.g.dart';

@JsonSerializable()
class AdditionalInformationSectionRequest {
  @JsonKey(name: '_id')
  String? id;
  String hospital;
  String? outsourcingContract;
  List<String>? contract;
  String? msCorporation;
  String? referralFee;
  String? treatmentCostPointCalculationPerPoint;
  String? remark;
  String? paymentSiteTighten;
  String? paymentSitePayment;
  List<String>? files;

  AdditionalInformationSectionRequest({
    this.id,
    required this.hospital,
    this.outsourcingContract,
    this.contract,
    this.msCorporation,
    this.referralFee,
    this.treatmentCostPointCalculationPerPoint,
    this.remark,
    this.paymentSiteTighten,
    this.paymentSitePayment,
    this.files,
  });

  factory AdditionalInformationSectionRequest.fromJson(
          Map<String, dynamic> json) =>
      _$AdditionalInformationSectionRequestFromJson(json);
  Map<String, dynamic> toJson() =>
      _$AdditionalInformationSectionRequestToJson(this);
}

extension AdditionalInformationSectionRequestExtension
    on AdditionalInformationSectionRequest {
  AdditionalInformationSectionRequest copyWith({
    String? hospital,
    String? outsourcingContract,
    List<String>? contract,
    String? msCorporation,
    String? referralFee,
    String? treatmentCostPointCalculationPerPoint,
    String? remark,
    String? paymentSiteTighten,
    String? paymentSitePayment,
  }) {
    return AdditionalInformationSectionRequest(
      id: id,
      hospital: hospital ?? this.hospital,
      outsourcingContract: outsourcingContract ?? this.outsourcingContract,
      contract: contract ?? this.contract,
      msCorporation: msCorporation ?? this.msCorporation,
      referralFee: referralFee ?? this.referralFee,
      treatmentCostPointCalculationPerPoint:
          treatmentCostPointCalculationPerPoint ??
              this.treatmentCostPointCalculationPerPoint,
      remark: remark ?? this.remark,
      paymentSiteTighten: paymentSiteTighten ?? this.paymentSiteTighten,
      paymentSitePayment: paymentSitePayment ?? this.paymentSitePayment,
    );
  }
}
