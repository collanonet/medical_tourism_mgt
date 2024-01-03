import 'package:reactive_forms/reactive_forms.dart';

FormGroup facilityForm() => FormGroup(
  {
    'patient_name': FormControl<String>(
      value: '',
    ),
  },
);
