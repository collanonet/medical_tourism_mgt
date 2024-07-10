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
  ValueNotifier<AsyncData<EstimateInvoiceResponse>> estimateInvoiceData = ValueNotifier(const AsyncData());
  Future<void> fetchEstimateInvoice(FormGroup formGroup) async{
    try{
      estimateInvoiceData.value = const AsyncData(loading: true);
      final response = await authRepository.getEstimateInvoice();
      insertEstimateInvoice(formGroup, response);
    estimateInvoiceData.value = AsyncData(data: response);
    }catch(e){
      logger.d(e);
    }
  }

  void insertEstimateInvoice(FormGroup formGroup,EstimateInvoiceResponse? data){
    formGroup.control('documentName').value = data?.documentName;
    formGroup.control('publisher').value = data?.publisher;
    formGroup.control('date_of_issue').value = data?.dateOfIssue;
    formGroup.control('date_of_payment').value = data?.dateOfPayment;
    formGroup.control('payment_day').value = data?.paymentDay;
    formGroup.control('method_of_payment').value = data?.methodOfPayment;
  }

  ValueNotifier<AsyncData<EstimateInvoiceResponse>> submit = ValueNotifier(const AsyncData());
  Future<void> submitEstimateInvoice(FormGroup formGroup) async{
    try{
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
      final response = await authRepository.postEstimateInvoice(
        EstimateInvoiceRequest(
          uploadFile: file,
          documentName: formGroup.control('documentName').value,
          publisher: formGroup.control('publisher').value,
          dateOfIssue: formGroup.control('date_of_issue').value,
          dateOfPayment: formGroup.control('date_of_payment').value,
          paymentDay: formGroup.control('payment_day').value,
          methodOfPayment: formGroup.control('method_of_payment').value,
        )
      );
      submit.value = AsyncData(data: response);
      estimateInvoiceData.value = AsyncData(data: response);

    }catch(e){
      logger.d(e);
    }
  }
}