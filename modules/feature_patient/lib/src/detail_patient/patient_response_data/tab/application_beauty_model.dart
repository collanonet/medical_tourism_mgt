import 'package:core_network/core_network.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_patient/data_patient.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class ApplicationBeautyModel {
  ApplicationBeautyModel({
    required this.patientRepository,
  });

  final PatientRepository patientRepository;

  ValueNotifier<AsyncData<ApplicationBeautyResponse>> applicationBeautyData =
      ValueNotifier(const AsyncData());

  ValueNotifier<AsyncData<ApplicationBeautyResponse>>
      submitApplicationBeautyData = ValueNotifier(const AsyncData());

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
          await fechApplicationBeauty();
        } else {
          medicalRecord.value = const AsyncData();
        }
      } catch (e) {
        logger.e(e);
        medicalRecord.value = AsyncData(error: e);
      }
    }
  }

  fechApplicationBeauty() async {
    try {
      applicationBeautyData.value = const AsyncData(loading: true);
      var result = await patientRepository.getApplicationBeauty(
          medicalRecord: medicalRecord.value.requireData.id);

      logger.d('result: $result');
      applicationBeautyData.value = AsyncData(data: result);
    } catch (e) {
      logger.e(e);
      applicationBeautyData.value = AsyncData(error: e);
    }
  }

  void postApplicationBeauty(FormGroup formGroup) async {
    try {
      submitApplicationBeautyData.value = const AsyncData(loading: true);
      applicationBeautyData.value = const AsyncData(loading: true);
      final response = await patientRepository
          .postApplicationBeauty(ApplicationBeautyRequest(
        date1: formGroup.control('date1').value,
        date2: formGroup.control('date2').value,
        date3: formGroup.control('date3').value,
        desiredDate: formGroup.control('desiredDate').value,
        remarks: formGroup.control('remarks').value,
        people: formGroup.control('people').value,
        age: formGroup.control('age').value,
        sex: formGroup.control('sex').value,
        relationship: formGroup.control('relationship').value,
        attend: formGroup.control('attend').value,
        desiredArea: formGroup.control('desiredArea').value,
        reason: formGroup.control('reason').value,
        faceMenu1: formGroup.control('faceMenu1').value,
        faceMenu2: formGroup.control('faceMenu2').value,
        faceMenu3: formGroup.control('faceMenu3').value,
        faceMenu4: formGroup.control('faceMenu4').value,
        faceMenu5: formGroup.control('faceMenu5').value,
        faceMenu6: formGroup.control('faceMenu6').value,
        faceMenu7: formGroup.control('faceMenu7').value,
        faceMenu8: formGroup.control('faceMenu8').value,
        faceMenu9: formGroup.control('faceMenu9').value,
        others: formGroup.control('others').value,
        bodyMenu1: formGroup.control('bodyMenu1').value,
        bodyMenu2: formGroup.control('bodyMenu2').value,
        bodyMenu3: formGroup.control('bodyMenu3').value,
        bodyMenu4: formGroup.control('bodyMenu4').value,
        bodyMenu5: formGroup.control('bodyMenu5').value,
        others1: formGroup.control('others1').value,
        skinMenu1: formGroup.control('skinMenu1').value,
        skinMenu2: formGroup.control('skinMenu2').value,
        skinMenu3: formGroup.control('skinMenu3').value,
        hairRemovalMeun1: formGroup.control('hairRemovalMeun1').value,
        hairRemovalMeun2: formGroup.control('hairRemovalMeun2').value,
        otherMenu1: formGroup.control('otherMenu1').value,
        otherMenu2: formGroup.control('otherMenu2').value,
        otherMenu3: formGroup.control('otherMenu3').value,
        otherMenu4: formGroup.control('otherMenu4').value,
        otherMenu5: formGroup.control('otherMenu5').value,
        menMenu1: formGroup.control('menMenu1').value,
        menMenu2: formGroup.control('menMenu2').value,
        otherHospital: formGroup.control('otherHospital').value,
        others2: formGroup.control('others2').value,
        concerne: formGroup.control('concerne').value,
        brokerageCompany: formGroup.control('brokerageCompany').value,
        privetcy: formGroup.control('privetcy').value,
        medicalRecord: medicalRecord.value.requireData.id,
      ));
      submitApplicationBeautyData.value = AsyncData(data: response);
      applicationBeautyData.value = AsyncData(data: response);
    } catch (e) {
      submitApplicationBeautyData.value = AsyncData(error: e);
      applicationBeautyData.value = AsyncData(error: e);
    }
  }
}
