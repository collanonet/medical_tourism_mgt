import 'package:json_annotation/json_annotation.dart';

part 'additional_information_hospital_request.g.dart';

@JsonSerializable()
class AdditionalInformationSectionRequest {
  @JsonKey(name: '_id')
  String? id;
  String? hospital;
  String signed;
  String notConcluded;
  String canBe;
  String none;
  num referralFee;
  String remark;
  String paymentSite;
  String endOfNextMonth;

  AdditionalInformationSectionRequest({
    this.id,
    this.hospital,
    required this.signed,
    required this.notConcluded,
    required this.canBe,
    required this.none,
    required this.referralFee,
    required this.remark,
    required this.paymentSite,
    required this.endOfNextMonth,
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
    String? signed,
    String? notConcluded,
    String? canBe,
    String? none,
    num? referralFee,
    String? remark,
    String? paymentSite,
    String? endOfNextMonth,
  }) {
    return AdditionalInformationSectionRequest(
      id: id,
      hospital: hospital ?? this.hospital,
      signed: signed ?? this.signed,
      notConcluded: notConcluded ?? this.notConcluded,
      canBe: canBe ?? this.canBe,
      none: none ?? this.none,
      referralFee: referralFee ?? this.referralFee,
      remark: remark ?? this.remark,
      paymentSite: paymentSite ?? this.paymentSite,
      endOfNextMonth: endOfNextMonth ?? this.endOfNextMonth,
    );
  }
}
