import 'dart:convert';
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

  ValueNotifier<AsyncData<List<MaterialHospitalResponse>>> materialsData =
      ValueNotifier(const AsyncData());

  ValueNotifier<AsyncData<MemoMaterialHospitalResponse>> memoMaterialsData =
      ValueNotifier(const AsyncData());

  Future<void> fetchMaterial(
      {required FormGroup formGroup, required String hospital}) async {
    try {
      materialsData.value = const AsyncData(loading: true);
      final response = await hospitalRepository.getMaterialHospital(hospital);
      materialsData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
      materialsData.value = AsyncData(error: e);
    }
  }

  void fetchData(
      {required FormGroup formGroup, required String hospitalId}) async {
    try {
      materialsData.value = const AsyncData(loading: true);
      final result = await hospitalRepository.getMaterialHospital(hospitalId);
      materialsData.value = AsyncData(data: result);

      final resultMenu =
          await hospitalRepository.getMemoMaterialHospital(hospitalId);
      formGroup.control('memo').value = resultMenu.memo;
      formGroup.control('hospitalRecord').value = hospitalId;
      memoMaterialsData.value = AsyncData(data: resultMenu);
    } catch (e) {
      logger.d(e);
      materialsData.value = AsyncData(error: e);
    }
  }

  Future<void> submitMemoData(FormGroup formGroup) async {
    try {
      memoMaterialsData.value = const AsyncData(loading: true);
      final response = await hospitalRepository.postMemoMaterialHospital(
        MemoMaterialHospitalRequest(
          hospitalRecord: formGroup.control('hospitalRecord').value,
          memo: formGroup.control('memo').value,
        ),
      );
      memoMaterialsData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
      memoMaterialsData.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<MaterialHospitalResponse>> submitMaterialHospital =
      ValueNotifier(const AsyncData());

  Future<void> postFile(FormGroup formGroup) async {
    try {
      submitMaterialHospital.value = const AsyncData(loading: true);

      String? file;
      if (formGroup.control('file').value != null) {
        try {
          // convert Uint8List to base64
          FileSelect docFile = formGroup.control('file').value;
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

      final response = await hospitalRepository.postMaterialHospital(
        MaterialHospitalRequest(
          file: file,
          brochureName: formGroup.control('brochureName').value,
          author: formGroup.control('author').value,
          dateOfIssue: formGroup.control('dateOfIssue').value,
          share: formGroup.control('share').value,
          hospitalRecord: formGroup.control('hospitalRecord').value,
        ),
      );
      materialsData.value =
          AsyncData(data: materialsData.value.data!..add(response));
      submitMaterialHospital.value = AsyncData(data: response);
      logger.d(response.toJson());
    } catch (e) {
      logger.d(e);
      materialsData.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<bool>> delete = ValueNotifier(const AsyncData());

  Future<void> deleteMaterials(List<String> ids) async {
    try {
      delete.value = const AsyncData(loading: true);
      for (var id in ids) {
        await hospitalRepository.deleteMaterialHospital(id);
        materialsData.value = AsyncData(
            data: materialsData.value.data!
              ..removeWhere((element) => element.id == id));
      }

      delete.value = const AsyncData(data: true);
    } catch (e) {
      logger.e(e);
      delete.value = AsyncData(error: e.toString());
    }
  }
}
