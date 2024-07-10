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

  ValueNotifier<AsyncData<HealthResponse>> healthData =
      ValueNotifier(const AsyncData());
  Future<void> fetchHeadInfo(FormGroup formGroup) async {
    healthData.value = const AsyncData(loading: true);
    final response = await hospitalRepository.getHealth();
    insertHealth(formGroup, response);
  }

  void insertHealth(FormGroup formGroup, HealthResponse? data) {
    formGroup.control('uploadFile').value = data?.uploadFile;
    formGroup.control('fileName').value = data?.fileName;
    formGroup.control('updatedOn').value = data?.uploadDate;
  }

  ValueNotifier<AsyncData<HealthResponse>> submitData =
      ValueNotifier(const AsyncData());
  Future<void> submit(FormGroup formGroup) async {
    try {
      submitData.value = const AsyncData(loading: true);
      final response = await hospitalRepository.postHealth(HealthRequest(
          uploadFile: formGroup.control('uploadFile').value,
          fileName: formGroup.control('fileName').value,
          uploadDate: formGroup.control('updatedOn').value));

      healthData.value = AsyncData(data: response);
      submitData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
    }
  }
}
