import 'package:json_annotation/json_annotation.dart';
part 'invoice_filter_response.g.dart';

@JsonSerializable()
class InvoiceFilterResponse {
  @JsonKey(name: '_id')
  String id;
  String? nameOfHospital;
  String? agentName;
  String? patientName;
  DateTime? issueDateFrom;
  DateTime? issueDateTo;
  String? invoice;
  String? prospects;

  InvoiceFilterResponse({
    required this.id,
    this.nameOfHospital,
    this.agentName,
    this.patientName,
    this.issueDateFrom,
    this.issueDateTo,
    this.invoice,
    this.prospects,
  });
  
  factory InvoiceFilterResponse.fromJson(Map<String, dynamic> json) => _$InvoiceFilterResponseFromJson(json);
  
  Map<String, dynamic> toJson() => _$InvoiceFilterResponseToJson(this);
}