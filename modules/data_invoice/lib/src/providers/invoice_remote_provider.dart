// Package imports:
import 'package:core_network/core_network.dart';
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

  Future<List<MedicalInvoiceResponse>> getInvoices({
    String? medicalRecord,
    bool? type,
    String? nameOfHospital,
    String? agentName,
    String? patientName,
    DateTime? issueDateFrom,
    DateTime? issueDateTo,
    String? prospects,
  }) {
    return apiService.getInvoices(
      medicalRecord: medicalRecord,
      type: type,
      nameOfHospital: nameOfHospital,
      agentName: agentName,
      patientName: patientName,
      issueDateFrom: issueDateFrom,
      issueDateTo: issueDateTo,
      prospects: prospects,
    );
  }

  Future<void> deleteInvoice(String id) {
    return apiService.deleteInvoice(id);
  }
}
