import 'dart:convert';

import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_agent/data_agent.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class EstimateInvoiceModel {
  EstimateInvoiceModel({
    required this.authRepository,
  });

  final AgentRepository authRepository;
  ValueNotifier<AsyncData<List<EstimateInvoiceResponse>>> estimateInvoiceData =
      ValueNotifier(const AsyncData());
  Future<void> fetchEstimateInvoice({required String id}) async {
    try {
      estimateInvoiceData.value = const AsyncData(loading: true);
      final response = await authRepository.getEstimateInvoice(id: id);
      estimateInvoiceData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
      estimateInvoiceData.value = AsyncData(error: e.toString());
    }
  }

  ValueNotifier<AsyncData<EstimateInvoiceResponse>> submit =
      ValueNotifier(const AsyncData());

  Future<void> submitEstimateInvoice(FormGroup formGroup) async {
    try {
      submit.value = const AsyncData(loading: true);
      String? file;
      if (formGroup.control('uploadFile').value != null) {
        try {
          // convert Uint8List to base64
          FileSelect docFile = formGroup.control('uploadFile').value;
          String base64Image = base64Encode(docFile.file);
          FileResponse fileData = await authRepository.uploadFileBase64(
            base64Image,
            docFile.filename,
          );
          file = fileData.filename;
        } catch (e) {
          logger.e(e);
        }
      }
      final response =
          await authRepository.postEstimateInvoice(EstimateInvoiceRequest(
        uploadFile: file,
        documentName: formGroup.control('documentName').value,
        publisher: formGroup.control('publisher').value,
        dateOfIssue: formGroup.control('dateOfIssue').value,
        dateOfPayment: formGroup.control('dateOfPayment').value,
        paymentDay: formGroup.control('paymentDay').value,
        methodOfPayment: formGroup.control('methodOfPayment').value,
        agentRecord: formGroup.control('agentRecord').value,
      ));
      submit.value = AsyncData(data: response);
      estimateInvoiceData.value =
          AsyncData(data: estimateInvoiceData.value.data!..add(response));
    } catch (e) {
      logger.d(e);
      submit.value = AsyncData(error: e.toString());
    }
  }
}
