import 'package:reactive_forms/reactive_forms.dart';

FormGroup materialsForm() {
  return FormGroup({
    'memo': FormControl<String>(),
  });
}
