// Package imports:
import 'package:reactive_forms/reactive_forms.dart';

FormGroup treatmentForm({required String hospitalId}) {
  return FormGroup({
    'cost': FormArray([
      FormGroup({
        'cost': FormControl<int>(value: 15),
      })
    ]),
    'treatmentMenu': FormArray([
      FormGroup({
        // todo: add id field
        '_id': FormControl<String>(),
        'hospitalId': FormControl<String>(value: hospitalId),
        'project': FormControl<String>(),
        'treatmentCostExcludingTax': FormControl<double>(),
        'treatmentCostTaxIncluded': FormControl<double>(),
        'remark': FormControl<String>(),
        'treatmentCostTax': FormArray([
          FormGroup({
            'cost': FormControl<double>(),
            'tax': FormControl<int>(value: 15),
          })
        ])
      }),
    ]),
    'telemedicineMenu': FormArray([
      FormGroup({
        '_id': FormControl<String>(),
        'hospital': FormControl<String>(value: hospitalId),
        'project': FormControl<String>(),
        'treatmentCostExcludingTax': FormControl<double>(),
        'treatmentCostTaxIncluded': FormControl<double>(),
        'remark': FormControl<String>(),
      }),
    ])
  });
}
