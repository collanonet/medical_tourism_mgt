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
      createMedicalOverseaData.value = const AsyncData(loading: true);

      String? qrCode;

      if (formGroup.control('qrCode').value != null) {
        try {
          // convert Uint8List to base64
          FileSelect qrFile = formGroup.control('qrCode').value;
          String base64Image = base64Encode(qrFile.file!);
          FileResponse qrData = await patientRepository.uploadFileBase64(
            base64Image,
            qrFile.filename!,
          );
          qrCode = qrData.filename;
        } catch (e) {
          logger.e(e);
        }
      }

      var medicalRecordOverseaDataRequest = MedicalRecordOverseaDataRequest(
        file: formGroup.control('file').value,
        hospitalName: formGroup.control('hospitalName').value,
        category: formGroup.control('category').value,
        documentName: formGroup.control('documentName').value,
        issueDate: formGroup.control('issueDate').value,
        sharedUrl: formGroup.control('sharedUrl').value,
        password: formGroup.control('password').value,
        expirationDate: formGroup.control('expirationDate').value,
        qrCode: qrCode,
        medicalRecord: medicalRecordData.value.requireData.id,
        commentHospital1: formGroup.control('commentHospital1').value,
        commentOurCompany: formGroup.control('commentOurCompany').value,
        commentHospital2: formGroup.control('commentHospital2').value,
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

  ValueNotifier<AsyncData<bool>> delete = ValueNotifier(const AsyncData());

  Future<void> deleteMedicalRecordOverseaData(List<String> ids) async {
    try {
      delete.value = const AsyncData(loading: true);
      for (var id in ids) {
        await patientRepository.deleteMedicalRecordOverseaData(id);
        medicalRecordsOverseasData.value = AsyncData(
            data: medicalRecordsOverseasData.value.data!
              ..removeWhere((element) => element.id == id));
      }

      delete.value = const AsyncData(data: true);
    } catch (e) {
      logger.e(e);
      delete.value = AsyncData(error: e.toString());
    }
  }

  ValueNotifier<AsyncData<MedicalRecordOverseaData>> submitComment =
      ValueNotifier(const AsyncData());

  void commentDicomFile(
    String id,
    String comment,
  ) async {
    try {
      submitComment.value = const AsyncData(loading: true);
      MedicalRecordOverseaData data = medicalRecordsOverseasData
          .value.requireData
          .firstWhere((element) => element.id == id);

      CommentDicomFile commentDicomFile = CommentDicomFile(
        comment: comment,
        role: 'Admin',
      );

      if (data.commentDicomFile != null) {
        data.commentDicomFile!.add(commentDicomFile);
      } else {
        data.commentDicomFile = [commentDicomFile];
      }

      var request = MedicalRecordOverseaDataRequest(
        file: data.file,
        commentDicomFile: data.commentDicomFile,
        hospitalName: data.hospitalName,
        category: data.category,
        documentName: data.documentName,
        issueDate: data.issueDate,
        sharedUrl: data.sharedUrl,
        password: data.password,
        expirationDate: data.expirationDate,
        qrCode: data.qrCode,
        medicalRecord: data.medicalRecord,
        commentHospital1: data.commentHospital1,
        commentOurCompany: data.commentOurCompany,
        commentHospital2: data.commentHospital2,
      );
      var response = await patientRepository.putMedicalRecordOverseaData(
        id,
        request,
      );
      medicalRecordsOverseasData.value = AsyncData(
        data: medicalRecordsOverseasData.value.requireData
          ..removeWhere((element) => element.id == id)
          ..add(response),
      );
      submitComment.value = AsyncData(data: response);
    } catch (e) {
      logger.e(e);
      submitComment.value = AsyncData(error: e.toString());
    }
  }
}
