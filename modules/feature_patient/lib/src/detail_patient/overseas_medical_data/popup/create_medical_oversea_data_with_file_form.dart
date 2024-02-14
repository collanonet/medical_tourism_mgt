import 'dart:io';

import 'package:reactive_forms/reactive_forms.dart';

FormGroup createMedicalOverseaDataWithFileForm(File file) {
  return FormGroup({
    'file': FormControl<File>(value: file),
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
    'qrCode': FormControl<File>(),
  });
}
