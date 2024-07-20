import 'package:reactive_forms/reactive_forms.dart';

FormGroup prospectivePankForm() {
  return FormGroup({
    'data': FormArray([
      FormGroup({
         'id': FormControl<String>(),
        'prospective_rank': FormControl<String>(),
      }),
    ]),
  });
}
