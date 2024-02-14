import 'dart:io';

import 'package:reactive_forms/reactive_forms.dart';

FormGroup detailMedicalOverseaForm() {
  return FormGroup({
    'id': FormControl<String>(),
    'commentHospital1': FormControl<String>(),
    'commentOurCompany': FormControl<String>(),
    'commentHospital2': FormControl<String>(),
  });
}
