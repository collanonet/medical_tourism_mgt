import 'dart:convert';

import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_hospital/data_hospital.dart';
import 'package:feature_auth/feature_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class FacilityModel {
  FacilityModel({
    required this.hospitalRepository,
  });

  HospitalRepository hospitalRepository;

  ValueNotifier<AsyncData<FacilityResponse>> facilityData =
      ValueNotifier(const AsyncData());
  Future<void> fetchFacility(FormGroup formGroup) async {
    try {
      facilityData.value = const AsyncData(loading: true);
      final response = await hospitalRepository.getFacilityPhoto();
      insertFacility(formGroup, response);
    } catch (e) {
      logger.d(e);
    }
  }

  void insertFacility(FormGroup formGroup, FacilityResponse? data) {
    formGroup.control('facilityFile').value = data?.facilityFile;
    formGroup.control('NameOfHspital').value = data?.nameOfHospital;
    formGroup.control('photograph').value = data?.photograph;
    formGroup.control('shooting_date').value = data?.shootingDate;
    formGroup.control('share').value = data?.share;
    formGroup.control('UploadePhoto').value = data?.uploadedPhoto;
  }

  ValueNotifier<AsyncData<FacilityResponse>> submit = ValueNotifier(const AsyncData());
  Future<void> submitFacility(FormGroup formGroup) async{
    try {
      submit.value = const AsyncData(loading: true);
      final token = await GetIt.I<AuthRepository>().getAccessToken();
      logger.d("token: $token");
     

      String? file;
      if (formGroup.control('UploadePhoto').value != null) {
        try {
          // convert Uint8List to base64
          FileSelect docFile = formGroup.control('UploadePhoto').value;
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
      final response = await hospitalRepository.postFacilityPhoto(
        FacilityRequest(
          facilityFile: formGroup.control('facilityFile').value,
          nameOfHospital: formGroup.control('NameOfHspital').value,
          photograph: formGroup.control('photograph').value,
          shootingDate: formGroup.control('shooting_date').value,
          share: formGroup.control('share').value,
          uploadedPhoto: file,
        )
      );
      facilityData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
    }
  }
}
