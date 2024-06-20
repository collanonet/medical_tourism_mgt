import 'package:json_annotation/json_annotation.dart';

part 'payment_option_hospital_response.g.dart';

@JsonSerializable()
class PaymentOptionHospitalResponse {
  @JsonKey(name: '_id')
  String id;
  String hospital;
  String? payer;
  String? paymentTiming;
  String? feeBack;
  String? paymentDirectlyToTheHospital;
  bool? transfer;
  bool? electronicPayment;
  bool? alipay;
  bool? unionPayPay;
  bool? unionPay;
  bool? weChatPay;
  bool? creditCard;
  bool? visa;
  bool? masterCard;
  bool? americanExpress;
  bool? jcb;
  bool? cash;
  String? remark;

  PaymentOptionHospitalResponse({
    required this.id,
    required this.hospital,
    this.payer,
    this.paymentTiming,
    this.feeBack,
    this.paymentDirectlyToTheHospital,
    this.transfer,
    this.electronicPayment,
    this.alipay,
    this.unionPayPay,
    this.unionPay,
    this.weChatPay,
    this.creditCard,
    this.visa,
    this.masterCard,
    this.americanExpress,
    this.jcb,
    this.cash,
    this.remark,
  });

  factory PaymentOptionHospitalResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentOptionHospitalResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentOptionHospitalResponseToJson(this);
}
