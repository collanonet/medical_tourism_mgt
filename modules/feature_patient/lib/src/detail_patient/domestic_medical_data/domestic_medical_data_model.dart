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
class DomesticMedicalDataModel {
  DomesticMedicalDataModel({
    required this.patientRepository,
  });

  final PatientRepository patientRepository;

  ValueNotifier<AsyncData<String>> medicalRecordId =
      ValueNotifier(const AsyncData());

  ValueNotifier<AsyncData<List<DomesticMedicalDataResponse>>>
      domesticMedicalData = ValueNotifier(const AsyncData());

  void fetchDomesticMedicalData({required String id}) async {
    try {
      medicalRecordId.value = AsyncData(data: id);
      domesticMedicalData.value = const AsyncData(loading: true);
      final response =
          await patientRepository.getDomesticMedicalData(medicalRecordId: id);
      domesticMedicalData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
      domesticMedicalData.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<DomesticMedicalDataResponse>> submit =
      ValueNotifier(const AsyncData());

  void submitDomesticMedicalData(FormGroup formGroup) async {
    try {
      submit.value = const AsyncData(loading: true);
      String? file;
      await Future(() async {
        if (formGroup.control('uploadFile').value != null) {
          try {
            // convert Uint8List to base64
            FileSelect docFile = formGroup.control('uploadFile').value;

            String filename = DateTime.now().millisecondsSinceEpoch.toString() +
                '.'+
            docFile.filename!.split('.').last;

            String base64Image = base64Encode(docFile.file!);
            FileResponse fileData = await patientRepository.uploadFileBase64(
              base64Image,
              filename,
            );
            file = fileData.filename;
          } catch (e) {
            logger.e(e);
          }
        }
      });
      bool disclosureToPatient;
      if (formGroup.control('disclosureToPatients').value == 'true') {
        disclosureToPatient = true;
      } else {
        disclosureToPatient = false;
      }

      bool disclosureToOtherMedicalInstitutions;
      if (formGroup.control('disclosureToOtherMedicalInstitutions').value ==
          'true') {
        disclosureToOtherMedicalInstitutions = true;
      } else {
        disclosureToOtherMedicalInstitutions = false;
      }

      final response = await patientRepository.postDomesticMedicalData(
        DomesticMedicalDataRequest(
          file: file,
          medicalInstitutionName:
              formGroup.control('nameOfMedicalInstitution').value,
          category: formGroup.control('category').value,
          documentName: formGroup.control('documentName').value,
          remarks: formGroup.control('remark').value,
          dateOfIssue: formGroup.control('dateOfIssue').value,
          url: formGroup.control('sharedUrlIssue').value,
          disclosureToPatient: disclosureToPatient,
          disclosureToOtherMedicalInstitutions:
              disclosureToOtherMedicalInstitutions,
          medicalRecord: formGroup.control('medicalRecordId').value,
        ),
      );
      domesticMedicalData.value =
          AsyncData(data: domesticMedicalData.value.data!..add(response));
      submit.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
      submit.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<bool>> delete = ValueNotifier(const AsyncData());

  Future<void> deleteDomesticMedical(List<String> ids) async {
    try {
      delete.value = const AsyncData(loading: true);
      for (var id in ids) {
        await patientRepository.deleteDomesticMedical(id);
        domesticMedicalData.value = AsyncData(
            data: domesticMedicalData.value.data!
              ..removeWhere((element) => element.id == id));
      }

      delete.value = const AsyncData(data: true);
    } catch (e) {
      logger.e(e);
      delete.value = AsyncData(error: e.toString());
    }
  }
}
