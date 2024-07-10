import 'dart:convert';

import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_hospital/data_hospital.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class ContrantModel {
  ContrantModel({required this.hospitalRepository});
  final HospitalRepository hospitalRepository;

  ValueNotifier<AsyncData<List<ContractResponse>>> contrantData =
      ValueNotifier(const AsyncData());

  void fetchContrant({required String id}) async {
    try {
      contrantData.value = const AsyncData(loading: true);
      final response = await hospitalRepository.getContract(id: id);
      contrantData.value = AsyncData(data: response);
    } catch (e) {
      logger.e(e);
      contrantData.value = AsyncData(error: e.toString());
    }
  }

  ValueNotifier<AsyncData<ContractResponse>> submitData =
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
      final response = await hospitalRepository.postContract(
        ContractRequest(
          uploadFile: file,
          fileName: formGroup.control('DocumentName').value,
          uploadDate: formGroup.control('updatedOn').value,
          hospitalRecord: formGroup.control('hospitalRecord').value,
        ),
      );

      contrantData.value =
          AsyncData(data: contrantData.value.data!..add(response));
      submitData.value = AsyncData(data: response);
    } catch (e) {
      logger.e(e);
      submitData.value = AsyncData(error: e.toString());
    }
  }
}
