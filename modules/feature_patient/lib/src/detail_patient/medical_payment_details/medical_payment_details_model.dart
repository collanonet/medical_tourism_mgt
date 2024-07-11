
import 'dart:convert';

import 'package:core_network/core_network.dart';
import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_patient/data_patient.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class MedicalPaymentDetailModel{
  MedicalPaymentDetailModel({
    required this.patientRepository,
  });

   final PatientRepository patientRepository;

  // late Patient _patient;

  // Patient get patient => _patient;

  // Future<void> initialData({Patient? patient, String? id}) async {
  //   notifyListeners();
  // }
  ValueNotifier<AsyncData<List<MedicalPaymentResponse>>> medicalPaymentData = ValueNotifier(const AsyncData());
  Future<void> fetchMedicalPayment({required String id}) async{
    try{
      medicalPaymentData.value = const AsyncData(loading: true);
      final reponse = await patientRepository.getMedicalPayment(medicalRecordId: id);
      medicalPaymentData.value =  AsyncData(data: reponse );

      }catch(e){
        logger.d(e);
        medicalPaymentData.value = AsyncData(error: e);
      }
  }

  ValueNotifier<AsyncData<MedicalPaymentResponse>> submit = ValueNotifier(const AsyncData());
  Future<void> submitMedicalPayment(FormGroup formGroup) async{
    try{
      submit.value = const AsyncData(loading: true);
      String? file;
      await Future(() async {
        if (formGroup.control('uploadFile').value != null) {
          try {
            // convert Uint8List to base64
            FileSelect docFile = formGroup.control('uploadFile').value;
            String base64Image = base64Encode(docFile.file);
            FileResponse fileData = await patientRepository.uploadFileBase64(
              base64Image,
              docFile.filename,
            );
            file = fileData.filename;
          } catch (e) {
            logger.e(e);
          }
        }
      });

      final response = await patientRepository.postMedicalPayment(
        MedicalPaymentRequest(
          uploadFile: file,
          nameOfHospital: formGroup.control('name_of_hospital').value,
          documentName: formGroup.control('documentName').value,
          dataOfIssue: formGroup.control('data_of_issue').value,
        )
      );
      submit.value = AsyncData(data: response );
      medicalPaymentData.value = AsyncData(data: medicalPaymentData.value.data!..add(response));

    }catch(e){
      logger.d(e);
      submit.value = AsyncData(error: e);
    }
  }

}