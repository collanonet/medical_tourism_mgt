import 'package:reactive_forms/reactive_forms.dart';

FormGroup treatmentForm({required String hospitalId}) {
  return FormGroup({
    'treatmentMenu': FormArray([
      FormGroup({
        'hospitalId' : FormControl<String>(value: hospitalId),
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
        'hospitalId' : FormControl<String>(value: hospitalId),
        'project': FormControl<String>(),
        'treatingCostExcludingTax': FormControl<num>(),
        'treatingCostIncludingTax': FormControl<num>(),
        'remarks': FormControl<String>(),
      }),
    ])
  });
}
