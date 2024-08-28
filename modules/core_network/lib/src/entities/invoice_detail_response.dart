// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'invoice_detail_response.g.dart';
@JsonSerializable()
class InvoiceResponse {
  @JsonKey(name: '_id')
  String id;
  String? documentationNumber;
  String? address;
  String? title;
  DateTime? dateOfIssue;
  String? prospects;
  String? salesManagement;
  String? status;

  InvoiceResponse({
    required this.id,
    this.documentationNumber,
    this.address,
    this.title,
    this.dateOfIssue,
    this.prospects,
    this.salesManagement,
    this.status,
  });

  factory InvoiceResponse.fromJson(Map<String, dynamic> json) => _$InvoiceResponseFromJson(json);
  Map<String, dynamic> toJson() => _$InvoiceResponseToJson(this);
}
