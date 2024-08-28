// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_hospital/data_hospital.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class QAndAModel {
  QAndAModel({
    required this.hospitalRepository,
  });

  final HospitalRepository hospitalRepository;

  ValueNotifier<AsyncData<List<NewRegistrationHospitalResponse>>>
      newRegistrationHospitalData = ValueNotifier(
          const AsyncData<List<NewRegistrationHospitalResponse>>(data: []));

  ValueNotifier<String?> hospitalId = ValueNotifier(null);

  Future<void> fetchData({
    String? hospitalId,
  }) async {
    try {
      if (hospitalId != null) {
        this.hospitalId.value = hospitalId;
        await fetchDataAndSearch();
      }
    } catch (e) {
      logger.d(e);
    }
  }

  Future<void> fetchDataAndSearch({
    String? classification,
    String? search,
  }) async {
    try {
      newRegistrationHospitalData.value = const AsyncData(loading: true);
      final result = await hospitalRepository.getNewRegistrationHospital(
        hospitalId: hospitalId.value!,
        classification: classification,
        search: search,
      );
      newRegistrationHospitalData.value = AsyncData(data: result);
    } catch (e) {
      logger.d(e);
      newRegistrationHospitalData.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<NewRegistrationHospitalResponse>> submit =
      ValueNotifier(const AsyncData());

  Future<void> submitNewRegistrationHospital(FormGroup formGroup) async {
    try {
      submit.value = const AsyncData(loading: true);
      final response = await hospitalRepository.postNewRegistrationHospital(
        NewRegistrationHospitalRequest(
          hospital: formGroup.control('hospital').value,
          updatedDate: formGroup.control('updatedDate').value,
          updatedBy: formGroup.control('updatedBy').value,
          classification: formGroup.control('classification').value,
          shareThisQADataWithHospitals:
              formGroup.control('shareThisQADataWithHospitals').value,
          question: formGroup.control('question').value,
          answer: formGroup.control('answer').value,
        ),
      );
      submit.value = AsyncData(data: response);
      newRegistrationHospitalData.value = AsyncData(
          data: newRegistrationHospitalData.value.data!..add(response));
    } catch (e) {
      logger.d(e);
      submit.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<bool>> delete = ValueNotifier(const AsyncData());

  Future<void> deleteData(NewRegistrationHospitalResponse requireData) async {
    try {

      delete.value = const AsyncData(loading: true);
      await hospitalRepository.deleteNewRegistrationHospital(
        requireData.id,
      );
      newRegistrationHospitalData.value = AsyncData(
        data: newRegistrationHospitalData.value.data!
          ..removeWhere((element) => element == requireData),
      );
      delete.value = const AsyncData(data: true);
    } catch (e) {
      logger.d(e);
      delete.value = AsyncData(error: e);
    }
  }
}
