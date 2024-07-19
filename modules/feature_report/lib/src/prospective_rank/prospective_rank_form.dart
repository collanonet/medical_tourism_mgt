import 'package:reactive_forms/reactive_forms.dart';

FormGroup ProspectivePankForm() {
  return FormGroup({
    'data': FormArray([
      FormGroup({
        'prospective_rank': FormControl<String>(),
      }),
    ]),
  });
}
