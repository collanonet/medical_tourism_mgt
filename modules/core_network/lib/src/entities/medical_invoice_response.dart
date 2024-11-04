import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../core_network.dart';
import '../../entities.dart';
import 'entities.dart';
import 'user.dart';

part 'medical_invoice_response.g.dart';

@CopyWith()
@JsonSerializable()
class MedicalInvoiceResponse {
  @JsonKey(name: '_id')
  String id;
  String? logoFile;
  String? stampFile;
  bool? type;
  String? fileNamePdfEN;
  String? fileNamePdfJP;
  String? fileNamePdfVN;
  String? fileNamePdfZH;
  String? fileNamePdfZHTW;
  String? invoiceNumber;
  DateTime? invoiceDate;
  DateTime? startDate;
  double? totalAmount;

  String? companyName;
  String? address;
  String? telNumber;
  String? fexNumber;
  String? inCharge;

  MedicalRecord medicalRecord;
  User? user;
  Patient? patient;
  BasicInformationHospitalResponse? hospitalRecord;
  List<ItemResponse>? item;
  List<NoteInvoiceResponse>? notes;
  int? taxRate;
  bool taxRateOption;
  String? remarks;

  final DateTime createdAt;
  final DateTime updatedAt;

  MedicalInvoiceResponse({
    required this.id,
    this.logoFile,
    this.stampFile,
    this.type,
    this.fileNamePdfEN,
    this.fileNamePdfJP,
    this.fileNamePdfVN,
    this.fileNamePdfZH,
    this.fileNamePdfZHTW,
    this.invoiceNumber,
    this.invoiceDate,
    this.startDate,
    this.companyName,
    this.address,
    this.telNumber,
    this.fexNumber,
    this.inCharge,
    this.totalAmount,
    required this.medicalRecord,
    this.user,
    this.patient,
    this.hospitalRecord,
    this.item,
    this.notes,
    this.taxRate,
    this.taxRateOption = false,
    this.remarks,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MedicalInvoiceResponse.fromJson(Map<String, dynamic> json) =>
      _$MedicalInvoiceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MedicalInvoiceResponseToJson(this);
}

@JsonSerializable()
class ItemResponse {
  @JsonKey(name: '_id')
  String id;
  String? itemCode;
  String? details;
  double? quantity;
  String? unit;
  double? unitPrice;

  ItemResponse({
    required this.id,
    this.itemCode,
    this.details,
    this.quantity,
    this.unit,
    this.unitPrice,
  });

  factory ItemResponse.fromJson(Map<String, dynamic> json) =>
      _$ItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ItemResponseToJson(this);
}

@JsonSerializable()
class NoteInvoiceResponse {
  @JsonKey(name: '_id')
  String id;
  String? note;

  NoteInvoiceResponse({
    required this.id,
    this.note,
  });

  factory NoteInvoiceResponse.fromJson(Map<String, dynamic> json) =>
      _$NoteInvoiceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NoteInvoiceResponseToJson(this);
}
