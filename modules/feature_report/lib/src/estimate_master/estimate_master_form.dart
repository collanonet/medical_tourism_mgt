// Package imports:
import 'package:reactive_forms/reactive_forms.dart';

FormGroup estimateMasterForm() {
  return FormGroup({
    'arr': FormArray([
      FormGroup({
         'id': FormControl<String>(),
        'item': FormControl<String>(),
        'sell_unitPrice': FormControl<String>(),
        'sell_amountOfMoney': FormControl<String>(),
        'cost_unitPrice': FormControl<String>(),
        'cost_amountOfMoney': FormControl<String>(),
      }),
    ]),
  });
}
