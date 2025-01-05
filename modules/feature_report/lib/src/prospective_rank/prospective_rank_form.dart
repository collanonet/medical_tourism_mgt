// Package imports:
import 'package:reactive_forms/reactive_forms.dart';

FormGroup prospectivePankForm() {
  return FormGroup({
    'data': FormArray([
      FormGroup({
        '_id': FormControl<String>(),
        'prospectRank': FormControl<String>(
          validators: [
            Validators.required,
          ],
        ),
        'shouldItBeIncludedInSalesManagementEstimates': FormControl<bool>(
          value: false,
        ),
      }),
    ]),
  });
}
