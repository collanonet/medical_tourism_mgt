import 'package:json_annotation/json_annotation.dart';

part 'additional_information_hospital_response.g.dart';

@JsonSerializable()
class AdditionalInformationSectionResponse {
  @JsonKey(name: '_id')
  String id;
  String? hospital;
  String signed;
  String notConcluded;
  String canBe;
  String none;
  num referralFee;
  String remark;
  String paymentSite;
  String endOfNextMonth;

  AdditionalInformationSectionResponse({
    required this.id,
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

  factory AdditionalInformationSectionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AdditionalInformationSectionResponseFromJson(json);
  Map<String, dynamic> toJson() =>
      _$AdditionalInformationSectionResponseToJson(this);
}
