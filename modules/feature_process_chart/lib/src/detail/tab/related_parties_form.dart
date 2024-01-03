import 'package:reactive_forms/reactive_forms.dart';

FormGroup relatedPartiesForm() => FormGroup(
  {
    'patient_name': FormControl<String>(
      value: '',
    ),
  },
);
