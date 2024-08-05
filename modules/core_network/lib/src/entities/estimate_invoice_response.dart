import 'package:json_annotation/json_annotation.dart';
part 'estimate_invoice_response.g.dart';
@JsonSerializable()
class EstimateInvoiceResponse {
  @JsonKey(name: '_id')
  String id;
  String? uploadFile;
  String? documentName;
  String? publisher;
  DateTime? dateOfIssue;
  DateTime? dateOfPayment;
  DateTime? paymentDay;
  String? methodOfPayment;

  EstimateInvoiceResponse({
    required this.id,
    this.uploadFile,
    this.documentName,
    this.publisher,
    this.dateOfIssue,
    this.dateOfPayment,
    this.paymentDay,
    this.methodOfPayment,
  });

  factory EstimateInvoiceResponse.fromJson(Map<String, dynamic> json) => _$EstimateInvoiceResponseFromJson(json);
  Map<String, dynamic> toJson() => _$EstimateInvoiceResponseToJson(this);
}