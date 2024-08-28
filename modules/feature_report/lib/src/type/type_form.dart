import 'package:core_l10n/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup typeForm() {
  return FormGroup({
    'type': FormArray([
      FormGroup({
        'id': FormControl<String>(),
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
