// Package imports:
import 'package:reactive_forms/reactive_forms.dart';

FormGroup qAndAForm({required String hospital}) {
  return FormGroup({
    'newRegistrationSection': FormGroup({
      '_id': FormControl<String>(),
      'hospital': FormControl<String>(value: hospital),
      'updatedDate': FormControl<DateTime>(validators: [Validators.required]),
      'updatedBy': FormControl<String>(validators: [Validators.required]),
      'classification': FormControl<String>(validators: [Validators.required]),
      'shareThisQADataWithHospitals':
          FormControl<bool>(validators: [Validators.required],value: false),
      'question': FormControl<String>(validators: [Validators.required]),
      'answer': FormControl<String>(validators: [Validators.required]),
    }),
    'listSection': FormGroup({
      'classification': FormControl<String>(),
      'enterKeyword': FormControl<String>(),
    }),
  });
}
