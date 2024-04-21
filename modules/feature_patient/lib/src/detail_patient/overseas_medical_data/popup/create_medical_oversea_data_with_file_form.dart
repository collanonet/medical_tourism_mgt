import 'dart:io';
import 'dart:typed_data';

import 'package:reactive_forms/reactive_forms.dart';

FormGroup createMedicalOverseaDataWithFileForm(Uint8List file) {
  return FormGroup({
    'file': FormControl<Uint8List>(value: file),
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
    'qrCode': FormControl<Uint8List>(),
  });
}
