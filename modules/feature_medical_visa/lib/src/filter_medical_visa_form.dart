import 'package:core_l10n/l10n.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup formFilterMedicalVisa() => FormGroup(
      {
        'patientName': FormControl<String>(
          value: '',
        ),
        'visa': FormControl<String>(
          value: '',
        ),
        'report': FormControl<String>(
          value: '',
        ),
        'subjects_withdrawal': FormControl<bool>(value: false),
        'refinement_date': FormControl<String>(
          value: '来日日',
        ),
        'period_from': FormControl<DateTime>(
          validators: [
            Validators.pattern(
              ValidatorRegExp.date,
            ),
          ],
        ),
        'period_to': FormControl<DateTime>(
          validators: [
            Validators.pattern(
              ValidatorRegExp.date,
            ),
          ],
        ),
      },
    );

Map<String, String Function(Object)> validationMessagesFilterPatient(
  BuildContext context,
) =>
    {
      ValidationMessage.required: (error) => context.l10n.mgsFieldRequired,
    };
