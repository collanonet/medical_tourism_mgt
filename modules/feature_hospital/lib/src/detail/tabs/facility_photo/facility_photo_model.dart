// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_hospital/data_hospital.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class FacilityModel {
  FacilityModel({
    required this.hospitalRepository,
  });

  HospitalRepository hospitalRepository;

  ValueNotifier<AsyncData<List<FacilityResponse>>> facilityData =
      ValueNotifier(const AsyncData());

  void fetchFacility({required String id}) async {
    try {
      facilityData.value = const AsyncData(loading: true);
      final response = await hospitalRepository.getFacilityPhoto(id: id);
      facilityData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
      facilityData.value = AsyncData(error: e.toString());
    }
  }

  ValueNotifier<AsyncData<FacilityResponse>> submit =
      ValueNotifier(const AsyncData());

  Future<void> submitFacility(FormGroup formGroup) async {
    try {
      submit.value = const AsyncData(loading: true);

      String? file;
      if (formGroup.control('uploadedPhoto').value != null) {
        try {
          // convert Uint8List to base64
          FileSelect docFile = formGroup.control('uploadedPhoto').value;
          String base64Image = base64Encode(docFile.file!);
          FileResponse fileData = await hospitalRepository.uploadFileBase64(
            base64Image,
            docFile.filename!,
          );
          file = fileData.filename;
        } catch (e) {
          logger.e(e);
        }
      }

      final response =
          await hospitalRepository.postFacilityPhoto(FacilityRequest(
        facilityFile: file,
        nameOfHospital: formGroup.control('NameOfHspital').value,
        photograph: formGroup.control('photograph').value,
        shootingDate: formGroup.control('shootingDate').value,
        share: formGroup.control('share').value,
        uploadedPhoto: file,
        hospitalRecord: formGroup.control('hospitalRecord').value,
      ));
      facilityData.value = AsyncData(
          data: facilityData.value.data ?? []
            ..add(response));
      submit.value = AsyncData(data: response);
    } catch (e) {
      logger.e(e);
      facilityData.value = AsyncData(error: e.toString());
    }
  }

  ValueNotifier<AsyncData<bool>> delete = ValueNotifier(const AsyncData());

  Future<void> deleteFacilityPhoto(List<String> ids) async {
    try {
      delete.value = const AsyncData(loading: true);
      for (var id in ids) {
        await hospitalRepository.deleteFacilityPhoto(id);
        facilityData.value = AsyncData(
            data: facilityData.value.data ?? []
              ..removeWhere((element) => element.id == id));
      }

      delete.value = const AsyncData(data: true);
    } catch (e) {
      logger.e(e);
      delete.value = AsyncData(error: e.toString());
    }
  }
}
