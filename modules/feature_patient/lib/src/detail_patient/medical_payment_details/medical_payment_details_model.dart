// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_patient/data_patient.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class MedicalPaymentDetailModel {
  MedicalPaymentDetailModel({
    required this.patientRepository,
  });

  final PatientRepository patientRepository;

  ValueNotifier<AsyncData<List<MedicalPaymentResponse>>> medicalPaymentData =
      ValueNotifier(const AsyncData());
  Future<void> fetchMedicalPayment({required String id}) async {
    try {
      medicalPaymentData.value = const AsyncData(loading: true);
      final reponse =
          await patientRepository.getMedicalPayment(medicalRecordId: id);
      medicalPaymentData.value = AsyncData(data: reponse);
    } catch (e) {
      logger.d(e);
      medicalPaymentData.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<MedicalPaymentResponse>> submit =
      ValueNotifier(const AsyncData());
  Future<void> submitMedicalPayment(FormGroup formGroup) async {
    try {
      submit.value = const AsyncData(loading: true);
      String? file;
      if (formGroup.control('file').value != null) {
        FileSelect docFile = formGroup.control('file').value;

        if (docFile.file != null) {
          String filename = DateTime.now().millisecondsSinceEpoch.toString() +
              '.'+
              docFile.filename!.split('.').last;
          try {
            String base64Image = base64Encode(docFile.file!);
            FileResponse fileData = await patientRepository.uploadFileBase64(
              base64Image,
              filename,
            );
            file = fileData.filename;
          } catch (e) {
            logger.e(e);
          }
        } else {
          file = docFile.url;
        }
      }else{
        file = formGroup.control('url').value;
      }

      final response = await patientRepository.postMedicalPayment(
        MedicalPaymentRequest(
          file: file,
          theNameOfTheHospital: formGroup.control('theNameOfTheHospital').value,
          documentName: formGroup.control('documentName').value,
          dateOfIssue: formGroup.control('dateOfIssue').value,
          medicalRecord: formGroup.control('medicalRecordId').value,
        ),
      );
      submit.value = AsyncData(data: response);
      medicalPaymentData.value =
          AsyncData(data: medicalPaymentData.value.data!..add(response));
    } catch (e) {
      logger.d(e);
      submit.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<bool>> delete = ValueNotifier(const AsyncData());

  Future<void> deleteMaterials(List<String> ids) async {
    try {
      delete.value = const AsyncData(loading: true);
      for (var id in ids) {
        await patientRepository.deleteMedicalPayment(id);
        medicalPaymentData.value = AsyncData(
            data: medicalPaymentData.value.data!
              ..removeWhere((element) => element.id == id));
      }

      delete.value = const AsyncData(data: true);
    } catch (e) {
      logger.e(e);
      delete.value = AsyncData(error: e.toString());
    }
  }
}
