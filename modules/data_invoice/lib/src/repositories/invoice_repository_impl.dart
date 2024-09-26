// Package imports:
import 'package:core_network/entities.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../providers/invoice_local_provider.dart';
import '../providers/invoice_remote_provider.dart';
import 'invoice_repository.dart';

@Injectable(as: InvoiceRepository)
class InvoiceRepositoryIml extends InvoiceRepository {
  InvoiceRepositoryIml({
    required this.remote,
    required this.local,
  });

  final InvoiceRemoteProvider remote;
  final InvoiceLocalProvider local;

  @override
  Future<void> deleteInvoice(String id) {
    return remote.deleteInvoice(id);
  }

  @override
  Future<List<MedicalInvoiceResponse>> getInvoices({String? medicalRecord, bool? type}) {
    return remote.getInvoices(medicalRecord: medicalRecord, type: type);
  }

  @override
  Future<MedicalInvoiceResponse> getInvoicesByMedicalRecordId(String medicalRecordId) {
    return remote.getInvoicesByMedicalRecordId(medicalRecordId);
  }

  @override
  Future<MedicalInvoiceResponse> postInvoice(MedicalInvoiceRequest invoiceRequest) {
    return remote.postInvoice(invoiceRequest);
  }

  @override
  Future<MedicalInvoiceResponse> putInvoice(String id, MedicalInvoiceRequest invoiceRequest) {
    return remote.putInvoice(id, invoiceRequest);
  }



}
