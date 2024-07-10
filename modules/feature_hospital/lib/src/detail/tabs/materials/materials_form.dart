import 'package:core_network/core_network.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup materialsMemoForm({required String hospitalRecordId}) {
  return FormGroup({
    'hospitalRecord': FormControl<String>(value: hospitalRecordId),
    'memo': FormControl<String>(),
  });
}

FormGroup materialsForm(
    {required String hospitalRecordId, required FileSelect file}) {
  return FormGroup({
    'hospitalRecord': FormControl<String>(value: hospitalRecordId),
    'file': FormControl<FileSelect>(
      value: file,
    ),
    'brochureName': FormControl<String>(),
    'author': FormControl<String>(),
    'dateOfIssue': FormControl<DateTime>(),
    'share': FormControl<String>(),
  });
}
