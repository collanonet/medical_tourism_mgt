import 'dart:convert';

import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_hospital/data_hospital.dart';
import 'package:feature_auth/feature_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class MaterialsModel {
  MaterialsModel({
    required this.hospitalRepository,
  });

  HospitalRepository hospitalRepository;

  ValueNotifier<AsyncData<List<MaterialHospitalResponse>>> materialsData =
      ValueNotifier(const AsyncData());

  void fetchData({required String hospitalId}) async {
    try {
      materialsData.value = const AsyncData(loading: true);
      final result = await hospitalRepository.getMaterialHospital(hospitalId);
      materialsData.value = AsyncData(data: result);
    } catch (e) {
      logger.d(e);
      materialsData.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<MaterialHospitalResponse>> submitMaterialHospital =
      ValueNotifier(const AsyncData());

  Future<void> postMemo(FormGroup formGroup) async {
    try {
      submitMaterialHospital.value = const AsyncData(loading: true);

      String? file;
      if (formGroup.control('file').value != null) {
        try {
          // convert Uint8List to base64
          FileSelect docFile = formGroup.control('file').value;
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

      final response = await hospitalRepository.postMaterialHospital(
        MaterialHospitalRequest(
          hospitalRecord: formGroup.control('hospitalRecord').value,
          file: file,
          brochureName: formGroup.control('brochureName').value,
          author: formGroup.control('author').value,
          dateOfIssue: formGroup.control('dateOfIssue').value,
          share: formGroup.control('share').value,
        ),
      );
      materialsData.value =
          AsyncData(data: materialsData.value.data!..add(response));
      submitMaterialHospital.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
      materialsData.value = AsyncData(error: e);
    }
  }
}
