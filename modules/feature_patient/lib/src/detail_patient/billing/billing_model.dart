// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
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

  Future<void> initialData(
      {required MedicalRecord medicalRecord,
      required FormGroup formGroup}) async {
    try {
      this.medicalRecord.value = AsyncData(data: medicalRecord);
      await fetchBillingData(medicalRecord.id, formGroup);
    } catch (e) {
      this.medicalRecord.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<BillingResponse>> billingData =
      ValueNotifier(const AsyncData());

  Future<void> fetchBillingData(
      String medicalRecord, FormGroup formGroup) async {
    try {
      billingData.value = const AsyncData(loading: true);
      var response =
          await patientRepository.getBilling(medicalRecord: medicalRecord);
      insertBilling(formGroup, response);
    } catch (e) {
      billingData.value = AsyncData(error: e);
    }
  }

  void insertBilling(FormGroup formGroup, BillingResponse response) {
    try {
      FormArray treatmentCost = formGroup.control('treatmentCost') as FormArray;
      formGroup.control('deposit').value = response.deposit;
      formGroup.control('settlementFee').value = response.settlementFee;
      formGroup.control('balance').value = response.balance;
      if (response.treatmentCost?.isNotEmpty ?? false) {
        treatmentCost.reset();
        treatmentCost.clear();
        for (var element in response.treatmentCost!) {
          treatmentCost.add(
            FormGroup(
              {
                'occurrenceDate': FormControl<DateTime>(
                  value: element.occurrenceDate,
                  validators: [
                    Validators.pattern(
                      ValidatorRegExp.date,
                    ),
                  ],
                ),
                'hospitalName':
                    FormControl<String>(value: element.hospitalName),
                'treatmentDetails':
                    FormControl<String>(value: element.treatmentDetails),
                'amount': FormControl<String>(value: element.amount),
                'remainingAmount':
                    FormControl<String>(value: element.remainingAmount),
                'file': FormControl<FileSelect>(
                  value: element.file != null
                      ? FileSelect(
                          url: element.file,
                        )
                      : null,
                ),
              },
            ),
          );
        }
      }
      formGroup.control('remarks').value = response.remarks;
    } catch (e) {
      logger.e(e);
    }

    billingData.value = AsyncData(data: response);
  }

  ValueNotifier<AsyncData<bool>> submit = ValueNotifier(const AsyncData());

  Future<void> submitBilling(FormGroup formGroup) async {
    try {
      submit.value = const AsyncData(loading: true);

      List<TreatmentCostRequest> treatmentCos = [];
      for (dynamic element in formGroup.control('treatmentCost').value) {
        String? file;
        if (element['file'] != null) {
          FileSelect docFile = element['file'];

          if (docFile.file != null) {
            String filename = DateTime.now().millisecondsSinceEpoch.toString() +
                '.'+
                docFile.filename!.split('.').last;
            try {
              String base64Image = base64Encode(docFile.file!);
              FileResponse fileData = await patientRepository.uploadFileBase64(
                base64Image,
                filename,
              );
              file = fileData.filename;
            } catch (e) {
              logger.e(e);
            }
          } else {
            file = docFile.url;
          }
        }

        treatmentCos.add(
          TreatmentCostRequest(
            occurrenceDate: element['occurrenceDate'],
            hospitalName: element['hospitalName'],
            treatmentDetails: element['treatmentDetails'],
            amount: element['amount'],
            remainingAmount: element['remainingAmount'],
            file: file,
          ),
        );
      }

      BillingRequest request = BillingRequest(
        deposit: formGroup.control('deposit').value,
        settlementFee: formGroup.control('settlementFee').value,
        balance: formGroup.control('balance').value,
        treatmentCost: treatmentCos,
        remarks: formGroup.control('remarks').value,
        medicalRecord: medicalRecord.value.requireData.id,
      );
      final response = await patientRepository.postBilling(request);
      billingData.value = AsyncData(data: response);
      submit.value = const AsyncData(data: true);
    } catch (e) {
      logger.e(e);
      submit.value = AsyncData(error: e);
    }
  }
}
