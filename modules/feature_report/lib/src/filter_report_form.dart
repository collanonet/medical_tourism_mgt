import 'package:core_l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup formFilterPatient() => FormGroup(
      {
        'patient_name': FormControl<String>(
          value: '',
        ),
        'agent_company_name': FormControl<String>(
          value: '',
        ),
        'hospitalName': FormControl<String>(
          value: '',
        ),
        'classification': FormControl<String>(
          value: '',
        ),
        'sales_representative': FormControl<String>(
          value: '',
        ),
        'entry_date_from': FormControl<DateTime>(),
        'entry_date_to': FormControl<DateTime>(),
        'examination_date_from': FormControl<DateTime>(),
        'examination_date_to': FormControl<DateTime>(),
        'return_date_from': FormControl<DateTime>(),
        'return_date_to': FormControl<DateTime>(),
      },
    );

Map<String, String Function(Object)> validationMessagesFilterPatient(
  BuildContext context,
) =>
    {
      ValidationMessage.required: (error) => context.l10n.mgsFieldRequired,
    };
