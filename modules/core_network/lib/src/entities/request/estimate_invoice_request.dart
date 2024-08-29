// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'estimate_invoice_request.g.dart';
@JsonSerializable()
class EstimateInvoiceRequest {
  String? uploadFile;
  String? documentName;
  String? publisher;
  DateTime? dateOfIssue;
  DateTime? dateOfPayment;
  DateTime? paymentDay;
  String? methodOfPayment;
  String agentRecord;

  EstimateInvoiceRequest({
    this.uploadFile,
    this.documentName,
    this.publisher,
    this.dateOfIssue,
    this.dateOfPayment,
    this.paymentDay,
    this.methodOfPayment,
    required this.agentRecord,
  });

  factory EstimateInvoiceRequest.fromJson(Map<String, dynamic> json) => _$EstimateInvoiceRequestFromJson(json);
  Map<String, dynamic> toJson() => _$EstimateInvoiceRequestToJson(this);
}
