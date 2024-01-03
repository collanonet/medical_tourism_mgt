import 'package:reactive_forms/reactive_forms.dart';

FormGroup hotelSearchForm() => FormGroup(
  {
    'patient_name': FormControl<String>(
      value: '',
    ),
  },
);
