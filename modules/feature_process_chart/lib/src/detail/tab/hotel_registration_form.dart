import 'package:reactive_forms/reactive_forms.dart';

FormGroup hotelRegistrationForm() => FormGroup(
  {
    'patient_name': FormControl<String>(
      value: '',
    ),
  },
);
