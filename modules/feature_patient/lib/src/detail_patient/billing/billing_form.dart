// Package imports:
import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup billingForm() => FormGroup(
      {
        'deposit': FormControl<double>(),
        'settlementFee': FormControl<double>(),
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
                'amount': FormControl<String>(value: ''),
                'file': FormControl<FileSelect>(),
              },
            ),
          ],
        ),
        'remarks': FormControl<String>(value: ''),
      },
    );
