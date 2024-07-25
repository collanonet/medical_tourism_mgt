import 'package:reactive_forms/reactive_forms.dart';

FormGroup treatmentForm({required String hospitalId}) {
  return FormGroup({
    'taxRate': FormArray([
      FormGroup({
        'taxRate': FormControl<int>(
            value: 15
        ),
      })
    ]),
    'treatmentMenu': FormArray([
      FormGroup({
        // todo: add id field
        'hospitalId': FormControl<String>(value: hospitalId),
        'project': FormControl<String>(),
        'treatmentCostExcludingTax': FormControl<double>(),
        'treatmentCostTaxIncluded': FormControl<double>(),
        'remark': FormControl<String>(),
        'treatmentCostTax': FormArray([
          FormGroup({
            'tax': FormControl<double>(

            ),
            'taxRate': FormControl<int>(
                value: 15
            ),
          })
        ])
      }),
    ]),
    'telemedicineMenu': FormArray([
      FormGroup({
        // todo: add id field
        'hospital': FormControl<String>(value: hospitalId),
        'project': FormControl<String>(),
        'treatmentCostExcludingTax': FormControl<num>(),
        'treatmentCostTaxIncluded': FormControl<num>(),
        'remark': FormControl<String>(),
      }),
    ])
  });
}
