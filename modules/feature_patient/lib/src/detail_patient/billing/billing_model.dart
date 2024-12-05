// Flutter imports:
import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:data_patient/data_patient.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class BillingModel with ChangeNotifier {
  BillingModel({
    required this.patientRepository,
  });

  final PatientRepository patientRepository;

  late Patient _patient;

  Patient get patient => _patient;

  Future<void> initialData({Patient? patient, String? id}) async {
    notifyListeners();
  }
  ValueNotifier<AsyncData<BillingResponse>> billingData = ValueNotifier(const AsyncData());
  Future<void> fetchBillingData(String patientId) async {
    try{
      billingData.value = const AsyncData(loading: true);
      final response = await patientRepository.getBilling();
      billingData.value = AsyncData(data: response);
    }catch(e){
      logger.e(e);
      billingData.value = AsyncData(error: e);
    }
  }
  

  ValueNotifier<AsyncData<bool>> submit = ValueNotifier(const AsyncData());
  Future<void> submitBilling(FormGroup formGroup) async{
    try{
      submit.value = const AsyncData(loading: true);
      List<TreatmentCostRequest>? treatmentCos = [];
      formGroup.control('treatment_cost').value.forEtch((e){
        treatmentCos.add(
         TreatmentCostRequest(
          occurrenceDate: e['occurrence_date'],
          hospitalName: e['hospitalName'],
          treatmentDetails: e['treatment_details'],
          amount: e['amount'],
          remainingAmount: e['remaining_amount'],
          file: e['file'],
         )
        );
      });
      BillingRequest request = BillingRequest(
        deposit: formGroup.control('deposit').value,
        settlementFee: formGroup.control('settlementFee').value,
        balance: formGroup.control('balance').value,
        treatmentCost: treatmentCos,
        remarks: formGroup.control('remarks').value
      );
      final response = await patientRepository.postBilling(request);
      billingData.value = AsyncData(data: response);

    }catch(e){
      logger.e(e);
      submit.value = AsyncData(error: e);
    }
  }
}
