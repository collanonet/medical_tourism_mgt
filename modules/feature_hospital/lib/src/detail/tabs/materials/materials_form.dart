
import 'package:core_network/core_network.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup materialsForm() {
  return FormGroup({
    'file' : FormControl<FileSelect>(),
    'memo': FormControl<String>(),
    'brochureName' : FormControl<String>(),
    'author' : FormControl<String>(),
    'date_of_issue' : FormControl<DateTime>(),
    'share' : FormControl<String>(),
  });
}
