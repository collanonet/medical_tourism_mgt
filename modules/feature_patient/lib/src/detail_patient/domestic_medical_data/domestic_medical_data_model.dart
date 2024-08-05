import 'dart:convert';

import 'package:core_network/core_network.dart';
import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_patient/data_patient.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class DomesticMedicalDataModel{
  DomesticMedicalDataModel({
    required this.patientRepository,
  });

  final PatientRepository patientRepository;

  // late Patient _patient;

  // Patient get patient => _patient;

  // Future<void> initialData({Patient? patient, String? id}) async {
  //   notifyListeners();
  // }

  ValueNotifier<AsyncData<List<DomesticMedicalDataResponse>>> domesticMedicalData = ValueNotifier(const AsyncData());
  void fetchDomesticMedicalData({required String id}) async{
    try{
      domesticMedicalData.value = const AsyncData(loading: true);
      final response = await patientRepository.getDomesticMedicalData(medicalRecordId: id);
      domesticMedicalData.value = AsyncData(data: response);
    }catch(e){
      logger.d(e);
      domesticMedicalData.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<DomesticMedicalDataResponse>> submit = ValueNotifier(const AsyncData());
  void submitDomesticMedicalData(FormGroup formGroup) async{
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

      final response = await patientRepository.postDomesticMedicalData(
        DomesticMedicalDataRequest(
          file: file,
          nameOfMedicalInstitution: formGroup.control('name_of_medical_institution').value,
          category: formGroup.control('category').value,
          documentName: formGroup.control('documentName').value,
          remark: formGroup.control('remark').value,
          dateOfIssue: formGroup.control('dateOfIssue').value,
          sharedUrlIssue: formGroup.control('shared_URL_issue').value,
          disclosureToPatients: formGroup.control('disclosure_to_patients').value,
          disclosureToOtherMedicalInstitutions: formGroup.control('disclosure_to_other_medical_institutions').value,
          

        )
      );
      domesticMedicalData.value = AsyncData(data: domesticMedicalData.value.data!..add(response));
      submit.value = AsyncData(data: response);

    }catch(e){
      logger.d(e);
      submit.value = AsyncData(error: e);
    }

  }
}
