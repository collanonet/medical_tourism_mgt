
import 'dart:typed_data';

import 'package:core_network/core_network.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup createMedicalOverseaDataWithUrlForm() {
  return FormGroup({
    'file': FormControl<FileSelect>(),
    'hospitalName': FormControl<String>(),
    'category': FormControl<String>(value: '画像データ（DICOM）'),
    'documentName': FormControl<String>(),
    'issueDate': FormControl<DateTime>(),
    'sharedUrl': FormControl<String>(validators: [Validators.required]),
    'password': FormControl<String>(),
    'expirationDate': FormControl<DateTime>(),
    'qrCode': FormControl<FileSelect>(),
    'commentHospital1': FormControl<String>(),
    'commentOurCompany': FormControl<String>(),
    'commentHospital2': FormControl<String>(),
  });
}
