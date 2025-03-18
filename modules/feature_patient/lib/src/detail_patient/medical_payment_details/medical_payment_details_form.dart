// Package imports:
import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup medicalPaymentForm({required String medicalRecordId,FileSelect? file}){
  return FormGroup({
    'medicalRecordId' : FormControl<String>(value: medicalRecordId),
    'url' : FormControl<String>(),
    'file' : FormControl<FileSelect>(value: file),
    'theNameOfTheHospital' : FormControl<String>(value: ''),
    'documentName' :FormControl<String>(value: ''),
    'dateOfIssue' : FormControl<DateTime>(validators: [
      Validators.pattern(
        ValidatorRegExp.date,
      )
    ]),
  });
}
