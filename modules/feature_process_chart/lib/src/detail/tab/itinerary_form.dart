import 'package:reactive_forms/reactive_forms.dart';

FormGroup itineraryForm() => FormGroup(
      {
        'patient_name': FormControl<String>(
          value: '',
        ),
      },
    );
