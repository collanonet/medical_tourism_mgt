import 'dart:io';

import 'package:reactive_forms/reactive_forms.dart';

FormGroup createMedicalOverseaDataWithUrlForm() {
  return FormGroup({
    'file': FormControl<File?>(),
    'hospitalName': FormControl<String>(validators: [Validators.required]),
    'category': FormControl<String>(value: '画像データ（DICOM）'),
    'documentName': FormControl<String>(validators: [Validators.required]),

    'issueDate': FormControl<DateTime>(validators: [Validators.required]),
    'sharedUrl': FormControl<String>(),
    'password': FormControl<String>(),
    'expirationDate': FormControl<DateTime>(),
    'qrCode': FormControl<File>(),

    'commentHospital1': FormControl<String>(),
    'commentOurCompany': FormControl<String>(),
    'commentHospital2': FormControl<String>(),
  });
}
