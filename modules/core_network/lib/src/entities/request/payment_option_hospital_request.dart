import 'package:json_annotation/json_annotation.dart';

part 'payment_option_hospital_request.g.dart';

@JsonSerializable()
class PaymentOptionHospitalRequest {
  @JsonKey(name: '_id')
  String? id;
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

  PaymentOptionHospitalRequest({
    this.id,
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

  factory PaymentOptionHospitalRequest.fromJson(Map<String, dynamic> json) =>
      _$PaymentOptionHospitalRequestFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentOptionHospitalRequestToJson(this);
}

extension PaymentOptionHospitalRequestExtension
    on PaymentOptionHospitalRequest {
  PaymentOptionHospitalRequest copyWith({
    String? hospital,
    String? payer,
    String? paymentTiming,
    String? feeBack,
    String? paymentDirectlyToTheHospital,
    bool? transfer,
    bool? electronicPayment,
    bool? alipay,
    bool? unionPayPay,
    bool? unionPay,
    bool? weChatPay,
    bool? creditCard,
    bool? visa,
    bool? masterCard,
    bool? americanExpress,
    bool? jcb,
    bool? cash,
    String? remark,
  }) {
    return PaymentOptionHospitalRequest(
      id: id,
      hospital: hospital ?? this.hospital,
      payer: payer ?? this.payer,
      paymentTiming: paymentTiming ?? this.paymentTiming,
      feeBack: feeBack ?? this.feeBack,
      paymentDirectlyToTheHospital:
          paymentDirectlyToTheHospital ?? this.paymentDirectlyToTheHospital,
      transfer: transfer ?? this.transfer,
      electronicPayment: electronicPayment ?? this.electronicPayment,
      alipay: alipay ?? this.alipay,
      unionPayPay: unionPayPay ?? this.unionPayPay,
      unionPay: unionPay ?? this.unionPay,
      weChatPay: weChatPay ?? this.weChatPay,
      creditCard: creditCard ?? this.creditCard,
      visa: visa ?? this.visa,
      masterCard: masterCard ?? this.masterCard,
      americanExpress: americanExpress ?? this.americanExpress,
      jcb: jcb ?? this.jcb,
      cash: cash ?? this.cash,
      remark: remark ?? this.remark,
    );
  }
}
