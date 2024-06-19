import 'package:reactive_forms/reactive_forms.dart';

FormGroup contractForm() {
  return FormGroup({
    'contract': FormGroup({
      '_id': FormControl<String?>(),
      'contractDate': FormControl<DateTime>(
        validators: [Validators.required],
      ),
      'contractType': FormControl<String>(),
      'contractPeriod': FormControl<String>(),
      'contractEndDate': FormControl<DateTime>(),
      'contractStatus': FormControl<String>(),
      'contractMemo': FormControl<String>(),
    }),
  });
}