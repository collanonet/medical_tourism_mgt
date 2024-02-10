import 'package:reactive_forms/reactive_forms.dart';

FormGroup proposalForm() {
  return FormGroup({
    'proposal': FormArray([
      FormGroup({
        'id': FormControl<String?>(),
        'hospitalName': FormControl<String>(
          validators: [Validators.required],
        ),
        'postalCode': FormControl<String>(),
        'address': FormControl<String>(),
        'summary': FormControl<String>(),
        'medicalRecord': FormControl<String>(),
      })
    ])
  });
}
