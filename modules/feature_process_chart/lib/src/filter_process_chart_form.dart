import 'package:core_l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup formFilterPatient() =>
 FormGroup(
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
        'subjects_withdrawal': FormControl<String>(
          value: '',
        ),
        'refinement_date': FormControl<String>(
          value: '',
        ),
        'period_from': FormControl<DateTime>(),
        'period_to': FormControl<DateTime>(),
      },
    );

Map<String, String Function(Object)> validationMessagesFilterPatient(
  BuildContext context,
) =>
    {
      ValidationMessage.required: (error) => context.l10n.mgsFieldRequired,
    };
