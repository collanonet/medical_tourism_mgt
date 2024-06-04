import 'package:core_network/core_network.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_patient/data_patient.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/src/models/models.dart';

@injectable
class ApplicationRegenerativeMedicalModel {
  ApplicationRegenerativeMedicalModel({
    required this.patientRepository,
  });

  final PatientRepository patientRepository;

  ValueNotifier<AsyncData<ApplicationRegenerativeMedicalResponse>>
      applicationRegenerativeMedical = ValueNotifier(const AsyncData());

  ValueNotifier<AsyncData<ApplicationRegenerativeMedicalResponse>>
      submitApplicationRegenerativeMedical = ValueNotifier(const AsyncData());

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
          await fechApplicationRegenerativeMedical();
        } else {
          medicalRecord.value = const AsyncData();
        }
      } catch (e) {
        logger.e(e);
        medicalRecord.value = AsyncData(error: e);
      }
    }
  }

  fechApplicationRegenerativeMedical() async {
    try {
      applicationRegenerativeMedical.value = const AsyncData(loading: true);
      var result = await patientRepository.getApplicationRegenerattiveMedical(
          medicalRecord: medicalRecord.value.requireData.id);

      logger.d('result: $result');
      applicationRegenerativeMedical.value = AsyncData(data: result);
    } catch (e) {
      logger.e(e);
      applicationRegenerativeMedical.value = AsyncData(error: e);
    }
  }

  Future<void> postApplicationRegenerativeMedical(FormGroup formGroup) async {
    try {
      applicationRegenerativeMedical.value = const AsyncData(loading: true);
      submitApplicationRegenerativeMedical.value =
          const AsyncData(loading: true);

      List<String> nameOfTheDrug = [];
      await formGroup.control('nameOfTheDrug').value.forEach((element) async {
        if (element['nameDrug'].toString().isNotEmpty &&
            element['nameDrug'] != null) {
          nameOfTheDrug.add(element['nameDrug']);
        }
      });

      final response =
          await patientRepository.postApplicationRegenerattiveMedical(
              ApplicationRegenerativeMedicalRequest(
        diseasePrevention: formGroup.control('diseasePrevention').value,
        relapsePrevention: formGroup.control('relapsePrevention').value,
        antiAging: formGroup.control('antiAging').value,
        beauty: formGroup.control('beauty').value,
        increaseImmunity: formGroup.control('increaseImmunity').value,
        date1: formGroup.control('date1').value,
        date2: formGroup.control('date2').value,
        date3: formGroup.control('date3').value,
        noDesiredDate: formGroup.control('noDesiredDate').value,
        remarks: formGroup.control('remarks').value,
        people: formGroup.control('people').value,
        age: formGroup.control('age').value,
        sex: formGroup.control('sex').value,
        relationship: formGroup.control('relationship').value,
        atten: formGroup.control('atten').value,
        desiredArea: formGroup.control('desiredArea').value,
        reason: formGroup.control('reason').value,
        stemCellTherapy: formGroup.control('stemCellTherapy').value,
        stemCellTherapy1: formGroup.control('stemCellTherapy1').value,
        stemCellTherapy2: formGroup.control('stemCellTherapy2').value,
        freeInput: formGroup.control('freeInput').value,
        fibroblastTherapy: formGroup.control('fibroblastTherapy').value,
        prpTherapy: formGroup.control('prpTherapy').value,
        others: formGroup.control('others').value,
        currentlyConcerned: formGroup.control('currentlyConcerned').value,
        medicine: formGroup.control('medicine').value,
        item1: formGroup.control('item1').value,
        item2: formGroup.control('item2').value,
        item3: formGroup.control('item3').value,
        item4: formGroup.control('item4').value,
        item5: formGroup.control('item5').value,
        others1: formGroup.control('others1').value,
        receive1: formGroup.control('receive1').value,
        receive2: formGroup.control('receive2').value,
        countryOther: formGroup.control('countryOther').value,
        brokerageCompany: formGroup.control('brokerageCompany').value,
        historyCancer: formGroup.control('historyCancer').value,
        cancerSite: formGroup.control('cancerSite').value,
        currentHealth: formGroup.control('currentHealth').value,
        detail: formGroup.control('detail').value,
        currentHealth1: formGroup.control('currentHealth1').value,
        detail1: formGroup.control('detail1').value,
        nameDrug: nameOfTheDrug,
        medicalInformation: formGroup.control('medicalInformation').value,
        dicomImage: formGroup.control('dicomImage').value,
        otherTest: formGroup.control('otherTest').value,
        detail2: formGroup.control('detail2').value,
        readio: formGroup.control('readio').value,
        privetcy: formGroup.control('privetcy').value,
        medicalRecord: medicalRecord.value.requireData.id,
      ));
      applicationRegenerativeMedical.value = AsyncData(data: response);
      submitApplicationRegenerativeMedical.value = AsyncData(data: response);
    } catch (e) {
      logger.e(e);
      applicationRegenerativeMedical.value = AsyncData(error: e);
      submitApplicationRegenerativeMedical.value = AsyncData(error: e);
    }
  }
}
