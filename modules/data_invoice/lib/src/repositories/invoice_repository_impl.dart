
import 'package:core_network/entities.dart';
import 'package:injectable/injectable.dart';

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
  Future<List<InvoiceResponse>> getInvoiceDetail() async {
   return remote.getInvoiceDetail();
  }

  @override
  Future<List<InvoiceFilterResponse>> getInvoiceFilter() {
    return remote.getInvoiceFilter();
  }

  @override
  Future<InvoiceResponse> postInvoiceDetail(InvoiceRequest invoiceRequest) {
    return remote.postInvoiceDetail(invoiceRequest);
  }

  @override
  Future<InvoiceFilterResponse> postInvoiceFilter(InvoiceFilterRequest invoiceFilterRequest) {
    return remote.postFilterInvoice(invoiceFilterRequest);
  }

}
