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

  Future<List<InvoiceResponse>> getInvoiceDetail() async{
      return await apiService.getInvoiceDetail();
  }

  Future<InvoiceResponse> postInvoiceDetail(InvoiceRequest invoiceRequest) async{

    return await apiService.postInvoiceDetail(invoiceRequest);
  }

  Future<List<InvoiceFilterResponse>> getInvoiceFilter() async{
    return await apiService.filterInvoice();
  }

  Future<InvoiceFilterResponse> postFilterInvoice(InvoiceFilterRequest invoiceFilterRequest)async{
    return await apiService.postFilterInvoice(invoiceFilterRequest);
  }
}


