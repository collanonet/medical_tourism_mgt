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

  ValueNotifier<AsyncData<DocumentResponse>> documentData =
      ValueNotifier(const AsyncData());
  Future<void> fetchDocument(FormGroup formGroup) async {
    try {
      documentData.value = const AsyncData(loading: true);
      final response = await hospitalRepository.getDocument();
      insertDocument(formGroup, response);

      documentData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
    }
  }

  void insertDocument(FormGroup formGroup, DocumentResponse? data) {
    try {
      formGroup.control('uploadFile').value = data?.updatedOn;
      formGroup.control('document_name').value = data?.documentName;
      formGroup.control('updatedOn').value = data?.updatedOn;
      formGroup.control('translationLanguage').value = data?.translationLanguage;
      formGroup.control('translator').value = data?.translator;
    } catch (e) {
      logger.d(e);
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
      final response = await hospitalRepository.postDocument(DocumentRequest(
        uploadFile: file,
       documentName: formGroup.control('document_name').value,
        updatedOn: formGroup.control('updatedOn').value,
        translationLanguage: formGroup.control('translationLanguage').value,
        translator: formGroup.control('translator').value,
      ));
      submitDocumentData.value = AsyncData(data: response);
      documentData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
    }
  }
}
