// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'invoice_filter_request.g.dart';

@JsonSerializable()
class InvoiceFilterRequest {
  String? nameOfHospital;
  String? agentName;
  String? patientName;
  DateTime? issueDateFrom;
  DateTime? issueDateTo;
  String? invoice;
  String? prospects;

  InvoiceFilterRequest({
    this.nameOfHospital,
    this.agentName,
    this.patientName,
    this.issueDateFrom,
    this.issueDateTo,
    this.invoice,
    this.prospects,
  });

  factory InvoiceFilterRequest.fromJson(Map<String, dynamic> json) => _$InvoiceFilterRequestFromJson(json);
  Map<String, dynamic> toJson() =>_$InvoiceFilterRequestToJson(this);
}
