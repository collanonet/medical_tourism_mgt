import 'dart:convert';
import 'dart:typed_data';

import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_auth/data_auth.dart';
import 'package:data_patient/data_patient.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class OverseasMedicalDataModel {
  OverseasMedicalDataModel({
    required this.patientRepository,
  });

  final PatientRepository patientRepository;

  ValueNotifier<AsyncData<bool>> loading =
      ValueNotifier<AsyncData<bool>>(const AsyncData());

  ValueNotifier<AsyncData<Patient>> patientData =
      ValueNotifier<AsyncData<Patient>>(const AsyncData());

  Future<void> initialData({Patient? patient, String? id}) async {
    loading.value = const AsyncData(loading: true);
    if (patient != null || id != null) {
      patientData.value = const AsyncData<Patient>(loading: true);

      try {
        if (patient == null) {
          if (id != null) {
            var result = await patientRepository.patient(id);
            patientData.value = AsyncData<Patient>(data: result);
          }
        } else {
          patientData.value = AsyncData<Patient>(data: patient);
        }
        await getMedicalRecordData(patientData.value.data?.id ?? id ?? '');
      } catch (error) {
        patientData.value = AsyncData<Patient>(error: error);
      } finally {
        loading.value = const AsyncData();
      }
    } else {
      patientData.value = const AsyncData();
      loading.value = const AsyncData();
    }
  }

  ValueNotifier<AsyncData<MedicalRecord>> medicalRecordData =
      ValueNotifier<AsyncData<MedicalRecord>>(const AsyncData());

  getMedicalRecordData(String patientId) async {
    medicalRecordData.value = const AsyncData(loading: true);

    try {
      var result = await patientRepository.medicalRecordsByPatient(patientId);
      logger.d('result: $result');
      if (result.isNotEmpty) {
        medicalRecordData.value = AsyncData(data: result.first);
        await getMedicalRecordsOverseasData(
            medicalRecordData.value.requireData.id);
      } else {
        medicalRecordData.value = const AsyncData();
      }
    } catch (e) {
      logger.e(e);
      medicalRecordData.value = AsyncData(error: e);
    }
  }

//GET_MEDICAL_RECORDS_OVERSEAS_DATA
  ValueNotifier<AsyncData<List<MedicalRecordOverseaData>>>
      medicalRecordsOverseasData =
      ValueNotifier<AsyncData<List<MedicalRecordOverseaData>>>(
          const AsyncData());

  Future<void> getMedicalRecordsOverseasData(String medicalRecordId) async {
    medicalRecordsOverseasData.value = const AsyncData(loading: true);

    await patientRepository
        .medicalRecordOverseaDataByMedicalRecord(medicalRecordId)
        .then((value) {
      medicalRecordsOverseasData.value = AsyncData(data: value);
    }).catchError((error) {
      logger.d(error);
      medicalRecordsOverseasData.value = AsyncData(error: error);
    });
  }

  ValueNotifier<AsyncData<MedicalRecordOverseaData>> createMedicalOverseaData =
      ValueNotifier<AsyncData<MedicalRecordOverseaData>>(const AsyncData());

  // post MEDICAL_RECORDS_OVERSEAS_DATA
  Future<void> postMedicalRecordsOverseasData(
    FormGroup formGroup,
  ) async {
    try {
      final token = await GetIt.I<AuthRepository>().getAccessToken();
      logger.d("token: $token");
      createMedicalOverseaData.value = const AsyncData(loading: true);
      String? file;
      if (formGroup.control('file').value != null) {
        // try {
        //   file = await patientRepository.uploadFileDio(
        //       formGroup.control('file').value, token ?? '');
        // } catch (e) {
        //   logger.e(e);
        // }

        try {
          // convert Uint8List to base64
          Uint8List bytes = formGroup.control('file').value;
          String base64Image = base64Encode(bytes);
          FileResponse fileData = await patientRepository.uploadFileBase64(
            base64Image,
            '${DateTime.timestamp()}.png',
          );
          file = fileData.filename;
        } catch (e) {
          logger.e(e);
        }
      }

      String? qrCode;

      if (formGroup.control('qrCode').value != null) {
        // try {
        //   qrCode = await patientRepository.uploadFileDio(
        //       formGroup.control('qrCode').value, token ?? '');
        // } catch (e) {
        //   logger.e(e);
        // }

        try {
          // convert Uint8List to base64
          Uint8List bytes = formGroup.control('qrCode').value;
          String base64Image = base64Encode(bytes);
          FileResponse qrData = await patientRepository.uploadFileBase64(
            base64Image,
            '${DateTime.timestamp()}.png',
          );
          qrCode = qrData.filename;
        } catch (e) {
          logger.e(e);
        }
      }

      logger.d("file: $file");
      logger.d("qrCode: $qrCode");
      var medicalRecordOverseaDataRequest = MedicalRecordOverseaDataRequest(
        file: file,
        hospitalName: formGroup.control('hospitalName').value,
        category: formGroup.control('category').value,
        documentName: formGroup.control('documentName').value,
        issueDate: formGroup.control('issueDate').value,
        sharedUrl: formGroup.control('sharedUrl').value,
        password: formGroup.control('password').value,
        expirationDate: formGroup.control('expirationDate').value,
        qrCode: qrCode,
        medicalRecord: medicalRecordData.value.requireData.id,
      );

      var result = await patientRepository
          .postMedicalRecordOverseaData(medicalRecordOverseaDataRequest);
      createMedicalOverseaData.value = AsyncData(data: result);
      if (medicalRecordsOverseasData.value.hasData) {
        medicalRecordsOverseasData.value = AsyncData(data: [
          ...medicalRecordsOverseasData.value.requireData,
          result,
        ]);
      } else {
        medicalRecordsOverseasData.value = AsyncData(data: [
          result,
        ]);
      }
    } catch (e) {
      logger.d(e);
      createMedicalOverseaData.value = AsyncData(error: e);
    }
  }
}
