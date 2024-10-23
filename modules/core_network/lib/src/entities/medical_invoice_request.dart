import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'medical_invoice_request.g.dart';

@CopyWith()
@JsonSerializable()
class MedicalInvoiceRequest {
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

  String? companyName;
  String? address;
  String? telNumber;
  String? fexNumber;
  String? inCharge;

  String medicalRecord;
  String? user;
  String? patient;
  String? hospitalRecord;
  List<ItemRequest>? item;
  List<NoteInvoiceRequest>? notes;
  String? taxRate;
  String? remarks;

  MedicalInvoiceRequest({
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
    this.companyName,
    this.address,
    this.telNumber,
    this.fexNumber,
    this.inCharge,
    required this.medicalRecord,
    this.user,
    this.patient,
    this.hospitalRecord,
    this.item,
    this.notes,
    this.taxRate,
    this.remarks,
  });

  factory MedicalInvoiceRequest.fromJson(Map<String, dynamic> json) =>
      _$MedicalInvoiceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$MedicalInvoiceRequestToJson(this);
}

@JsonSerializable()
class ItemRequest {
  String? itemCode;
  String? details;
  double? quantity;
  String? unit;
  double? unitPrice;

  ItemRequest({
    this.itemCode,
    this.details,
    this.quantity,
    this.unit,
    this.unitPrice,
  });

  factory ItemRequest.fromJson(Map<String, dynamic> json) =>
      _$ItemRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ItemRequestToJson(this);
}

@JsonSerializable()
class NoteInvoiceRequest {
  String? note;

  NoteInvoiceRequest({
    this.note,
  });

  factory NoteInvoiceRequest.fromJson(Map<String, dynamic> json) =>
      _$NoteInvoiceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$NoteInvoiceRequestToJson(this);
}
