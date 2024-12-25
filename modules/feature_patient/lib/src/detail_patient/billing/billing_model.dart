// Flutter imports:
import 'dart:convert';

import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:data_patient/data_patient.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class BillingModel {
  BillingModel({
    required this.patientRepository,
  });

  final PatientRepository patientRepository;

  ValueNotifier<AsyncData<MedicalRecord>> medicalRecord =
      ValueNotifier(const AsyncData());

  Future<void> initialData({
    required MedicalRecord medicalRecord,
  }) async {
    try {
      this.medicalRecord.value = AsyncData(data: medicalRecord);
      await fetchBillingData(medicalRecord.id);
    } catch (e) {
      logger.e(e);
      this.medicalRecord.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<BillingResponse>> billingData =
      ValueNotifier(const AsyncData());

  Future<void> fetchBillingData(String medicalRecord) async {
    try {
      billingData.value = const AsyncData(loading: true);
      final response =
          await patientRepository.getBilling(medicalRecord: medicalRecord);
      billingData.value = AsyncData(data: response);
    } catch (e) {
      logger.e(e);
      billingData.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<bool>> submit = ValueNotifier(const AsyncData());

  Future<void> submitBilling(FormGroup formGroup) async {
    try {
      submit.value = const AsyncData(loading: true);

      List<TreatmentCostRequest>? treatmentCos = [];
      for (dynamic element in formGroup.control('treatmentCost').value) {
        String? file;
        if (element['file'] != null) {
          FileSelect docFile = element['file'];
          if (docFile.file != null) {
            try {
              String base64Image = base64Encode(docFile.file!);
              FileResponse fileData = await patientRepository.uploadFileBase64(
                base64Image,
                docFile.filename!,
              );
              file = fileData.filename;
            } catch (e) {
              logger.e(e);
            }
          } else {
            file = docFile.url;
          }
        }

        treatmentCos.add(TreatmentCostRequest(
          occurrenceDate: element['occurrenceDate'],
          hospitalName: element['hospitalName'],
          treatmentDetails: element['treatmentDetails'],
          amount: element['amount'],
          remainingAmount: element['remainingAmount'],
          file: file,
        ));
      }

      BillingRequest request = BillingRequest(
        deposit: formGroup.control('deposit').value,
        settlementFee: formGroup.control('settlementFee').value,
        balance: formGroup.control('balance').value,
        treatmentCost: treatmentCos,
        remarks: formGroup.control('remarks').value,
        medicalRecord: medicalRecord.value.data?.id,
      );
      final response = await patientRepository.postBilling(request);
      billingData.value = AsyncData(data: response);
    } catch (e) {
      logger.e(e);
      submit.value = AsyncData(error: e);
    }
  }
}
