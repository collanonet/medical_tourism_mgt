// Package imports:
import 'package:core_network/entities.dart';

abstract class InvoiceRepository {


  Future<List<InvoiceResponse>> getInvoiceDetail();

  Future<InvoiceResponse> postInvoiceDetail(
    InvoiceRequest invoiceRequest,
  );

  Future<List<InvoiceFilterResponse>> getInvoiceFilter();

  Future<InvoiceFilterResponse> postInvoiceFilter(
    InvoiceFilterRequest invoiceFilterRequest,
  );
}
