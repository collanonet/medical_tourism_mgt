import 'package:reactive_forms/reactive_forms.dart';

FormGroup treatmentForm({required String hospitalId}) {
  return FormGroup({
    'treatmentMenu': FormArray([
      FormGroup({
        'hospitalId': FormControl<String>(value: hospitalId),
        'project': FormControl<String>(),
        'treatmentCostExcludingTax': FormControl<num>(),
        'treatmentCostIncludingTax': FormControl<num>(),
        'remark': FormControl<String>(),
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
        'hospital': FormControl<String>(value: hospitalId),
        'project': FormControl<String>(),
        'treatmentCostExcludingTax': FormControl<num>(),
        'treatmentCostIncludingTax': FormControl<num>(),
        'remark': FormControl<String>(),
      }),
    ])
  });
}
