import 'package:json_annotation/json_annotation.dart';
part 'invoice_detail_request.g.dart';
@JsonSerializable()
class InvoiceRequest {
  String? documentationNumber;
  String? address;
  String? title;
  DateTime? dateOfIssue;
  String? prospects;
  String? salesManagement;
  String? status;

  InvoiceRequest({
    this.documentationNumber,
    this.address,
    this.title,
    this.dateOfIssue,
    this.prospects,
    this.salesManagement,
    this.status,
  });

  factory InvoiceRequest.fromJson(Map<String, dynamic> json) => _$InvoiceRequestFromJson(json);
  Map<String, dynamic> toJson() => _$InvoiceRequestToJson(this);
}
