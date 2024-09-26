// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_network/entities.dart';
import 'package:injectable/injectable.dart';

@injectable
class InvoiceRemoteProvider {
  InvoiceRemoteProvider({
    required this.apiService,
  });

  final ApiService apiService;

  Future<MedicalInvoiceResponse> putInvoice(
      String id, MedicalInvoiceRequest invoiceRequest) {
    return apiService.putInvoice(id, invoiceRequest);
  }

  Future<MedicalInvoiceResponse> postInvoice(
      MedicalInvoiceRequest invoiceRequest) {
    return apiService.postInvoice(invoiceRequest);
  }

  Future<MedicalInvoiceResponse> getInvoicesByMedicalRecordId(
      String medicalRecordId) {
    return apiService.getInvoicesByMedicalRecordId(medicalRecordId);
  }

  Future<List<MedicalInvoiceResponse>> getInvoices(
      {String? medicalRecord, bool? type}) {
    return apiService.getInvoices(medicalRecord: medicalRecord, type: type);
  }

  Future<void> deleteInvoice(String id) {
    return apiService.deleteInvoice(id);
  }
}
