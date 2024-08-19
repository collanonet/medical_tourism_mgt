import 'package:core_network/core_network.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_patient/data_patient.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class ApplicationBloodPurificationTherapyModel {
  ApplicationBloodPurificationTherapyModel({
    required this.patientRepository,
  });

  final PatientRepository patientRepository;

  ValueNotifier<AsyncData<ApplicationBloodPurificationTherapyResponse>>
      applicationBloodPurificationTherapyResponse =
      ValueNotifier(const AsyncData());

  ValueNotifier<AsyncData<ApplicationBloodPurificationTherapyResponse>>
      submitApplicationBloodPurificationTherapyResponse =
      ValueNotifier(const AsyncData());

  ValueNotifier<AsyncData<MedicalRecord>> medicalRecord =
      ValueNotifier<AsyncData<MedicalRecord>>(const AsyncData());

  Future<void> getMedicalRecords({String? patientId}) async {
    if (patientId != null) {
      try {
        medicalRecord.value = const AsyncData(loading: true);

        var result = await patientRepository.medicalRecordsByPatient(patientId);
        logger.d('result: $result');
        if (result.isNotEmpty) {
          medicalRecord.value = AsyncData(data: result.first);
          await fechApplicationBloodPurificationTherapy();
        } else {
          medicalRecord.value = const AsyncData();
        }
      } catch (e) {
        logger.e(e);
        medicalRecord.value = AsyncData(error: e);
      }
    }
  }

  fechApplicationBloodPurificationTherapy() async {
    try {
      applicationBloodPurificationTherapyResponse.value =
          const AsyncData(loading: true);
      var result =
          await patientRepository.getApplicationBloodPurificationTherapy(
              medicalRecord: medicalRecord.value.requireData.id);

      logger.d('result: $result');
      applicationBloodPurificationTherapyResponse.value =
          AsyncData(data: result);
    } catch (e) {
      logger.e(e);
      applicationBloodPurificationTherapyResponse.value = AsyncData(error: e);
    }
  }

  void postApplicationBloodPurificationTherapy(FormGroup formGroup) async {
    try {
      applicationBloodPurificationTherapyResponse.value =
          const AsyncData(loading: true);

      submitApplicationBloodPurificationTherapyResponse.value =
          const AsyncData(loading: true);
      List<String> nameOfTheDrug = [];
      await formGroup.control('drugName').value.forEach((element) async {
        if (element['drug'].toString().isNotEmpty && element['drug'] != null) {
          nameOfTheDrug.add(element['drug']);
        }
      });
      final response =
          await patientRepository.postApplicationBloodPurificationTherapy(
              ApplicationBloodPurificationTherapyRequest(
        purposeOfCommission1: formGroup.control('purposeOfCommission1').value,
        purposeOfCommission2: formGroup.control('purposeOfCommission2').value,
        purposeOfCommission3: formGroup.control('purposeOfCommission3').value,
        purposeOfCommission4: formGroup.control('purposeOfCommission4').value,
        purposeOfCommission5: formGroup.control('purposeOfCommission5').value,
        date1: formGroup.control('date1').value,
        date2: formGroup.control('date2').value,
        date3: formGroup.control('date3').value,
        noDate: formGroup.control('noDate').value,
        remarks: formGroup.control('remarks').value,
        people: formGroup.control('people').value,
        age: formGroup.control('age').value,
        sex: formGroup.control('sex').value,
        relationship: formGroup.control('relationship').value,
        attend: formGroup.control('attend').value,
        desiredArea: formGroup.control('desiredArea').value,
        reason: formGroup.control('reason').value,
        menu1: formGroup.control('menu1').value,
        menu2: formGroup.control('menu2').value,
        menu3: formGroup.control('menu3').value,
        others: formGroup.control('others').value,
        concern: formGroup.control('concern').value,
        question: formGroup.control('question').value,
        item1: formGroup.control('item1').value,
        item2: formGroup.control('item2').value,
        item3: formGroup.control('item3').value,
        others1: formGroup.control('others1').value,
        pleaceReceive1: formGroup.control('pleaceReceive1').value,
        pleaceReceive2: formGroup.control('pleaceReceive2').value,
        otherCountry: formGroup.control('otherCountry').value,
        introducer: formGroup.control('introducer').value,
        historyCancer: formGroup.control('historyCancer').value,
        treatmentDetail: formGroup.control('treatmentDetail').value,
        detail: formGroup.control('detail').value,
        cancerSite: formGroup.control('cancerSite').value,
        treatmentDetail1: formGroup.control('treatmentDetail1').value,
        detail1: formGroup.control('detail1').value,
        drugName: nameOfTheDrug,
        dicom: formGroup.control('dicom').value,
        otherTestData: formGroup.control('otherTestData').value,
        detail2: formGroup.control('detail2').value,
        privetcy: formGroup.control('privetcy').value,
        ifwoman: formGroup.control('ifwoman').value,
        medicalRecord: medicalRecord.value.requireData.id,
      ));
      applicationBloodPurificationTherapyResponse.value =
          AsyncData(data: response);
      submitApplicationBloodPurificationTherapyResponse.value =
          AsyncData(data: response);
    } catch (e) {
      logger.e(e);
      applicationBloodPurificationTherapyResponse.value = AsyncData(error: e);
      submitApplicationBloodPurificationTherapyResponse.value =
          AsyncData(error: e);
    }
  }
}
