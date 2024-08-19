import 'dart:io';
import 'dart:typed_data';

import 'package:core_network/core_network.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup createMedicalOverseaDataWithFileForm(FileSelect file) {
  return FormGroup({
    'file': FormControl<FileSelect>(value: file),
    'hospitalName': FormControl<String>(validators: [Validators.required]),
    'category': FormControl<String>(value: '画像データ（DICOM）'),
    'documentName': FormControl<String>(validators: [Validators.required]),
    'issueDate': FormControl<DateTime>(validators: [Validators.required]),

    'commentHospital1': FormControl<String>(),
    'commentOurCompany': FormControl<String>(),
    'commentHospital2': FormControl<String>(),

    'sharedUrl': FormControl<String>(),
    'password': FormControl<String>(),
    'expirationDate': FormControl<DateTime>(),
    'qrCode': FormControl<FileSelect>(),
  });
}
