import 'dart:convert';

import 'package:core_network/entities.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_hospital/data_hospital.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class DocumentModel {
  DocumentModel({required this.hospitalRepository});
  HospitalRepository hospitalRepository;

  ValueNotifier<AsyncData<List<DocumentResponse>>> documentData =
      ValueNotifier(const AsyncData());
  void fetchDocument({required String id}) async {
    try {
      documentData.value = const AsyncData(loading: true);
      final response = await hospitalRepository.getDocument(id: id);

      documentData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
      documentData.value = AsyncData(error: e.toString());
    }
  }

  ValueNotifier<AsyncData<DocumentResponse>> submitDocumentData =
      ValueNotifier(const AsyncData());
  Future<void> submitDocument(FormGroup formGroup) async {
    try {
      submitDocumentData.value = const AsyncData(loading: true);

      String? file;
      if (formGroup.control('uploadFile').value != null) {
        try {
          // convert Uint8List to base64
          FileSelect docFile = formGroup.control('uploadFile').value;
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
      final response = await hospitalRepository.postDocument(DocumentRequest(
        uploadFile: file,
        documentName: formGroup.control('documentName').value,
        updatedOn: formGroup.control('updatedOn').value,
        translationLanguage: formGroup.control('translationLanguage').value,
        translator: formGroup.control('translator').value,
        hospitalRecord: formGroup.control('hospitalRecord').value,
      ));
      submitDocumentData.value = AsyncData(data: response);
      documentData.value =
          AsyncData(data: documentData.value.data!..add(response));
    } catch (e) {
      logger.d(e);
      submitDocumentData.value = AsyncData(error: e.toString());
    }
  }

  ValueNotifier<AsyncData<bool>> delete = ValueNotifier(const AsyncData());

  Future<void> deleteDocument(List<String> ids) async {
    try {
      delete.value = const AsyncData(loading: true);
      for (var id in ids) {
        await hospitalRepository.deleteDocument(id);
        documentData.value = AsyncData(
            data: documentData.value.data!
              ..removeWhere((element) => element.id == id));
      }

      delete.value = const AsyncData(data: true);
    } catch (e) {
      logger.e(e);
      delete.value = AsyncData(error: e.toString());
    }
  }
}
