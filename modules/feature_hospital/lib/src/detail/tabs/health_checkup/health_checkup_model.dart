import 'dart:convert';

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
  void fetchHeadInfo({required String id}) async {
    try {
      healthData.value = const AsyncData(loading: true);
      final response = await hospitalRepository.getHealth(id: id);
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

      String? file;
      if (formGroup.control('uploadFile').value != null) {
        try {
          // convert Uint8List to base64
          FileSelect docFile = formGroup.control('uploadFile').value;
          String base64Image = base64Encode(docFile.file);
          FileResponse fileData = await hospitalRepository.uploadFileBase64(
            base64Image,
            docFile.filename,
          );
          file = fileData.filename;
        } catch (e) {
          logger.e(e);
        }
      }

      final response = await hospitalRepository.postHealth(HealthRequest(
        uploadFile: file,
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

  Future<void> deleteHealth({required String id}) async {
    try {
      await hospitalRepository.deleteHealth(id: id);
      healthData.value = AsyncData(
        data: healthData.value.data!
          ..removeWhere((element) => element.id == id),
      );
    } catch (e) {
      logger.d(e);
    }
  }
}
