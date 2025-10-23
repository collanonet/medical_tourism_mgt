// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_invoice/data_invoice.dart';
import 'package:injectable/injectable.dart';

@injectable
class InvoiceModel {
  InvoiceModel({
    required this.invoiceRepository,
  });

  final InvoiceRepository invoiceRepository;

  ValueNotifier<AsyncData<List<MedicalInvoiceResponse>>> medicalInvoiceData =
      ValueNotifier(const AsyncData());

  Future<void> searchInvoices({
    String? diseaseName,
    String? agentName,
    String? patientName,
    DateTime? issueDateFrom,
    DateTime? issueDateTo,
    String? prospects,
    String? readStatus,
  }) async {
    try {
      medicalInvoiceData.value = const AsyncData(loading: true);
      final response = await invoiceRepository.getInvoices(
        diseaseName: diseaseName,
        agentName: agentName,
        patientName: patientName,
        issueDateFrom: issueDateFrom,
        issueDateTo: issueDateTo,
        prospects: prospects,
        readStatus: readStatus,
      );
      medicalInvoiceData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
      medicalInvoiceData.value = AsyncData(error: e);
    }
  }

  Future<void> fetchInvoices() async {
    try {
      medicalInvoiceData.value = const AsyncData(loading: true);
      final response = await invoiceRepository.getInvoices();
      medicalInvoiceData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
      medicalInvoiceData.value = AsyncData(error: e);
    }
  }
}
