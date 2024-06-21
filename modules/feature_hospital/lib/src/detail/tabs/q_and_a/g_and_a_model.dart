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
      insertDataNewRegisterRequest(formGroup, result);
    } catch (e) {
      logger.d(e);
      newRegistrationHospitalData.value = AsyncData(error: e);
    }
  }

  void insertDataNewRegisterRequest(
      FormGroup formGroup, NewRegistrationHospitalResponse data) {
    formGroup.control('newRegistrationSection').patchValue({
      'updateDate': data.updateDate,
      'updater': data.updater,
      'classification': data.classification,
      'shareThisQADataWithHospitals': data.shareThisQADataWithHospitals,
      'question': data.question,
      'answer': data.answer,
    });
  }
}
