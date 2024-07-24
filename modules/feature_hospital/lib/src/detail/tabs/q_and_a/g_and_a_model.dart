
import 'package:core_network/core_network.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_hospital/data_hospital.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class QAndAModel {
  QAndAModel({
    required this.hospitalRepository,
  });

  final HospitalRepository hospitalRepository;

  ValueNotifier<AsyncData<NewRegistrationHospitalResponse>>
      newRegistrationHospitalData = ValueNotifier(const AsyncData());

  ValueNotifier<AsyncData<ListSectionQAndAHospitalResponse>>
      listSectionQAndAHospitalData = ValueNotifier(const AsyncData());

  Future<void> fetchData(FormGroup formGroup, {String? hospitalId}) async {
    try {
      if (hospitalId != null) {
        await fetchNewRegistrationHospital(formGroup, hospitalId);
      }
    } catch (e) {
      logger.d(e);
    }
  }

  Future<void> fetchNewRegistrationHospital(
      FormGroup formGroup, String hospitalId) async {
    try {
      newRegistrationHospitalData.value = const AsyncData(loading: true);
      final result = await hospitalRepository.getNewRegistrationHospital(
        hospitalId,
      );
      logger.d(result.toJson());
      insertDataNewRegisterRequest(formGroup, result);
    } catch (e) {
      logger.d(e);
      newRegistrationHospitalData.value = AsyncData(error: e);
    }
  }

  void insertDataNewRegisterRequest(
      FormGroup formGroup, NewRegistrationHospitalResponse data) {
      formGroup.control('updateDate').value = data.updateDate;
      formGroup.control('updater').value = data.updater;
      formGroup.control('classification').value = data.classification;
      formGroup.control('shareThisQADataWithHospitals').value =
      data.shareThisQADataWithHospitals;
      formGroup.control('question').value = data.question;
      formGroup.control('answer').value = data.answer;
    // formGroup.control('newRegistrationSection').patchValue({
    //   'updateDate': data.updateDate,
    //   'updater': data.updater,
    //   'classification': data.classification,
    //   'shareThisQADataWithHospitals': data.shareThisQADataWithHospitals,
    //   'question': data.question,
    //   'answer': data.answer,
    // });
  }

  ValueNotifier<AsyncData<NewRegistrationHospitalResponse>> submit =
      ValueNotifier(const AsyncData());

  Future<void> submitNewRegistrationHospital(FormGroup formGroup) async {
    try {
      submit.value = const AsyncData(loading: true);
      final response = await hospitalRepository.postNewRegistrationHospital(
        NewRegistrationHospitalRequest(
          hospitalId: formGroup.control('hospitalid').value,
          updateDate: formGroup.control('updateDate').value,
          updater: formGroup.control('updater').value,
          classification: formGroup.control('classification').value,
          shareThisQADataWithHospitals:
              formGroup.control('shareThisQADataWithHospitals').value,
          question: formGroup.control('question').value,
          answer: formGroup.control('answer').value,
        ),
      );
      submit.value = AsyncData(data: response);
      newRegistrationHospitalData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
      submit.value = AsyncData(error: e);
    }
  }
}
