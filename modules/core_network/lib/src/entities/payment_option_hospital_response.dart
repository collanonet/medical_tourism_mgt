import 'package:json_annotation/json_annotation.dart';

part 'payment_option_hospital_response.g.dart';

@JsonSerializable()
class PaymentOptionHospitalResponse {
  @JsonKey(name: '_id')
  String? id;
  String? hospital;
  String payer;
  String paymentTiming;
  String feeBack;
  String paymentDirectlyToTheHospital;
  bool transfer;
  bool electronicPayment;
  bool alipay;
  bool unionPayPay;
  bool unionPay;
  bool weChatPay;
  bool creditCard;
  bool visa;
  bool masterCard;
  bool americanExpress;
  bool jcb;
  bool cash;
  String remark;

  PaymentOptionHospitalResponse({
    this.id,
    this.hospital,
    required this.payer,
    required this.paymentTiming,
    required this.feeBack,
    required this.paymentDirectlyToTheHospital,
    required this.transfer,
    required this.electronicPayment,
    required this.alipay,
    required this.unionPayPay,
    required this.unionPay,
    required this.weChatPay,
    required this.creditCard,
    required this.visa,
    required this.masterCard,
    required this.americanExpress,
    required this.jcb,
    required this.cash,
    required this.remark,
  });

  factory PaymentOptionHospitalResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentOptionHospitalResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentOptionHospitalResponseToJson(this);
}
