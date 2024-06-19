import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_hospital/data_hospital.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class MaterialsModel {
  MaterialsModel({
    required this.hospitalRepository,
  });

  HospitalRepository hospitalRepository;

  ValueNotifier<AsyncData<MaterialHospitalResponse>> materialsData =
      ValueNotifier(const AsyncData());

  Future<void> fetchData(FormGroup formGroup, {String? hospitalId}) async {
    try {
      if (hospitalId != null) {
        await getMemo(formGroup, hospitalId);
      }
    } catch (e) {
      logger.d(e);
    }
  }

  Future<void> getMemo(FormGroup formGroup, String hospitalId) async {
    try {
      materialsData.value = const AsyncData(loading: true);
      final result = await hospitalRepository.getMaterialHospital(hospitalId);
      insertDataMemo(formGroup, result);
    } catch (e) {
      logger.d(e);
      materialsData.value = AsyncData(error: e);
    }
  }

  void insertDataMemo(FormGroup formGroup, MaterialHospitalResponse data) {
    formGroup.control('memoSection').patchValue({
      'memo': data.memo,
    });
  }

  Future<void> postMemo(FormGroup formGroup) async {
    try {
      materialsData.value = const AsyncData(loading: true);
      MaterialHospitalRequest materialHospitalRequest =
          MaterialHospitalRequest.fromJson(formGroup.value);
      await hospitalRepository.postMaterialHospital(materialHospitalRequest);
    } catch (e) {
      logger.d(e);
      materialsData.value = AsyncData(error: e);
    }
  }
}
