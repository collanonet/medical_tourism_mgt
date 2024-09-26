// Package imports:
import 'package:core_network/entities.dart';

abstract class InvoiceRepository {
  Future<List<MedicalInvoiceResponse>> getInvoices({
    String? medicalRecord,
    bool? type,
  });

  Future<MedicalInvoiceResponse> getInvoicesByMedicalRecordId(
      String medicalRecordId);

  Future<MedicalInvoiceResponse> postInvoice(
      MedicalInvoiceRequest invoiceRequest);

  Future<MedicalInvoiceResponse> putInvoice(
      String id, MedicalInvoiceRequest invoiceRequest);

  Future<void> deleteInvoice(String id);
}
