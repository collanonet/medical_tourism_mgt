import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup billingForm() => FormGroup(
      {
        'deposit': FormControl<double>(),
        'settlementFee': FormControl<double>(),
        'balance': FormControl<double>(),
        'treatmentCost': FormArray(
          [
            FormGroup(
              {
                'occurrenceDate': FormControl<DateTime>(
                  validators: [
                    Validators.pattern(
                      ValidatorRegExp.date,
                    ),
                  ],
                ),
                'hospitalName': FormControl<String>(value: ''),
                'treatmentDetails': FormControl<String>(value: ''),
                'amount': FormControl<String>(),
                'remainingAmount': FormControl<String>(),
                'file': FormControl<FileSelect>(),
              },
            ),
          ],
        ),
        'remarks': FormControl<String>(value: ''),
      },
    );
