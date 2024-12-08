// Package imports:
import 'package:reactive_forms/reactive_forms.dart';

FormGroup estimateMasterForm() {
  return FormGroup({
    'arr': FormArray([
      FormGroup({
        '_id': FormControl<String>(),
        'project': FormControl<String>(
          validators: [Validators.required],
        ),
        'unitPriceSellingPrice': FormControl<String>(),
        'amountOfMoneySellingPrice': FormControl<String>(),
        'unitPriceCostPrice': FormControl<String>(),
        'amountOfMoneyCostPrice': FormControl<String>(),
      }),
    ]),
  });
}
