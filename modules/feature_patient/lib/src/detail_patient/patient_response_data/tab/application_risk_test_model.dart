// application_risk_test_form.dart
// ApplicationRiskTestResponse
import 'package:core_network/core_network.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_patient/data_patient.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class ApplicationRiskTestModel {
  ApplicationRiskTestModel({
    required this.patientRepository,
  });

  final PatientRepository patientRepository;

  ValueNotifier<AsyncData<ApplicationRiskTestResponse>>
      applicationRiskTestResponse = ValueNotifier(const AsyncData());

  ValueNotifier<AsyncData<ApplicationRiskTestResponse>>
      submitApplicationRiskTestResponse = ValueNotifier(const AsyncData());

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
          await fechApplicationRiskTestResponse();
        } else {
          medicalRecord.value = const AsyncData();
        }
      } catch (e) {
        logger.e(e);
        medicalRecord.value = AsyncData(error: e);
      }
    }
  }

  fechApplicationRiskTestResponse() async {
    try {
      applicationRiskTestResponse.value = const AsyncData(loading: true);
      var result = await patientRepository.getApplicationRiskTest(
          medicalRecord: medicalRecord.value.requireData.id);

      logger.d('result: $result');
      applicationRiskTestResponse.value = AsyncData(data: result);
    } catch (e) {
      logger.e(e);
      applicationRiskTestResponse.value = AsyncData(error: e);
    }
  }

  void postApplicationRiskTesk(FormGroup formGroup) async {
    try {
      applicationRiskTestResponse.value = const AsyncData(loading: true);
      submitApplicationRiskTestResponse.value = const AsyncData(loading: true);
      List<String> nameOfTheDrug = [];
      await formGroup.control('drugName').value.forEach((element) async {
        if (element['drug'].toString().isNotEmpty && element['drug'] != null) {
          nameOfTheDrug.add(element['drug']);
        }
      });
      final response = await patientRepository
          .postApplicationRiskTest(ApplicationRiskTestRequest(
        date1: formGroup.control('date1').value,
        date2: formGroup.control('date2').value,
        date3: formGroup.control('date3').value,
        noDate: formGroup.control('noDate').value,
        remark: formGroup.control('remark').value,
        people: formGroup.control('people').value,
        age: formGroup.control('age').value,
        sex: formGroup.control('sex').value,
        relationship: formGroup.control('relationship').value,
        menu1: formGroup.control('menu1').value,
        menu2: formGroup.control('menu2').value,
        menu3: formGroup.control('menu3').value,
        menu4: formGroup.control('menu4').value,
        menu5: formGroup.control('menu5').value,
        menu6: formGroup.control('menu6').value,
        menu7: formGroup.control('menu7').value,
        menu8: formGroup.control('menu8').value,
        menu9: formGroup.control('menu9').value,
        menu10: formGroup.control('menu10').value,
        menu11: formGroup.control('menu11').value,
        menu12: formGroup.control('menu12').value,
        menu13: formGroup.control('menu13').value,
        others: formGroup.control('others').value,
        concern: formGroup.control('concern').value,
        introducer: formGroup.control('introducer').value,
        historyCancer: formGroup.control('historyCancer').value,
        cancerSite: formGroup.control('cancerSite').value,
        treatmentDetail: formGroup.control('treatmentDetail').value,
        detail: formGroup.control('detail').value,
        treatmentDetail1: formGroup.control('treatmentDetail1').value,
        detail1: formGroup.control('detail1').value,
        drugName: nameOfTheDrug,
        privetcy: formGroup.control('privetcy').value,
        ifwoman: formGroup.control('ifwoman').value,
        medicalRecord: medicalRecord.value.requireData.id,
      ));
      applicationRiskTestResponse.value = AsyncData(data: response);
      submitApplicationRiskTestResponse.value = AsyncData(data: response);
    } catch (e) {
      logger.e(e);
      applicationRiskTestResponse.value = AsyncData(error: e);
      submitApplicationRiskTestResponse.value = AsyncData(error: e);
    }
  }
}
