// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_invoice/data_invoice.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class InvoiceModel{
  InvoiceModel({
    required this.invoiceRepository,
  });

  final InvoiceRepository invoiceRepository;
  ValueNotifier<AsyncData<List<InvoiceResponse>>> invoiceDetailData = ValueNotifier(const AsyncData());
  Future<void> fetchInvoiceDetail() async {
    try{
      invoiceDetailData.value = const AsyncData(loading: true);
      final response = await invoiceRepository.getInvoiceDetail();
      invoiceDetailData.value = AsyncData(data: response);
    }catch(e){
      logger.d(e);
      invoiceDetailData.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<List<InvoiceFilterResponse>>> invoiceFilterData = ValueNotifier(const AsyncData());
  Future<void> fetchInvoiceFilter() async {
    try{
      invoiceDetailData.value = const AsyncData(loading: true);
      final response = await invoiceRepository.getInvoiceFilter();
      invoiceFilterData.value = AsyncData(data: response);

    }catch(e){
      logger.d(e);
      invoiceFilterData.value = AsyncData(error: e);
    }

  }

  ValueNotifier<AsyncData<InvoiceFilterResponse>> submitInvoiceFilterData = ValueNotifier(const AsyncData());
  Future<void> submitInvoiceFilter(FormGroup formGroup) async {
    try{


    }catch(e){
      logger.d(e);
      submitInvoiceFilterData.value = AsyncData(error: e);
    }

  }


  ValueNotifier<List<Prospects>> prospects = ValueNotifier([
    Prospects(item: 'A'),
    Prospects(item: 'B'),
    Prospects(item: 'C'),
  ]);
  ValueNotifier<List<Invoice>> invoices = ValueNotifier([
    Invoice(item: '見積書'),
    
  ]);
}


class Prospects{
  String item;
  Prospects({required this.item});
}

class Invoice{
  String item;
  Invoice({required this.item});
}
