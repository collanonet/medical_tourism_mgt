import 'package:reactive_forms/reactive_forms.dart';

FormGroup treatmentForm() {
  return FormGroup({
    'treatmentMenu': FormArray([
      FormGroup({
        'project': FormControl<String>(),
        'treatingCostExcludingTax': FormControl<num>(),
        'treatingCostIncludingTax': FormControl<num>(),
        'preparationForExams': FormControl<String>(),
        'includeTax': FormArray([
          FormGroup({
            'tax': FormControl<num>(),
            'taxRate': FormControl<num>(),
          })
        ])
      }),
    ]),
    'telemedicineMenu': FormArray([
      FormGroup({
        'project': FormControl<String>(),
        'treatingCostExcludingTax': FormControl<num>(),
        'treatingCostIncludingTax': FormControl<num>(),
        'remarks': FormControl<String>(),
      }),
    ])
  });
}
