import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_hospital/data_hospital.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class HealthModel {
  HealthModel({required this.hospitalRepository});
  final HospitalRepository hospitalRepository;

  ValueNotifier<AsyncData<List<HealthResponse>>> healthData =
      ValueNotifier(const AsyncData());
  Future<void> fetchHeadInfo(FormGroup formGroup) async {
    try {
      healthData.value = const AsyncData(loading: true);
      final response = await hospitalRepository.getHealth();
      healthData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
      healthData.value = AsyncData(error: e.toString());
    }
  }

  ValueNotifier<AsyncData<HealthResponse>> submitData =
      ValueNotifier(const AsyncData());
  Future<void> submit(FormGroup formGroup) async {
    try {
      submitData.value = const AsyncData(loading: true);
      final response = await hospitalRepository.postHealth(HealthRequest(
        uploadFile: formGroup.control('uploadFile').value,
        fileName: formGroup.control('fileName').value,
        uploadDate: formGroup.control('updatedOn').value,
        hospitalRecord: formGroup.control('hospitalRecord').value,
      ));

      healthData.value = AsyncData(data: healthData.value.data!..add(response));
      submitData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
      submitData.value = AsyncData(error: e.toString());
    }
  }
}
