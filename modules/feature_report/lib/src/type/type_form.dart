// Package imports:
import 'package:reactive_forms/reactive_forms.dart';

FormGroup typeForm() {
  return FormGroup({
    'type': FormArray([
      FormGroup({
        '_id': FormControl<String>(value: ''),
        'typeName': FormControl<String>(
          validators: [Validators.required],
        ),
        'color': FormControl<String>(
          value: 'FFFFFF',
          validators: [Validators.required],
        ),
      })
    ])
  });
}
