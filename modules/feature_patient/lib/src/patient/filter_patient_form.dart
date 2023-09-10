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
        'hospital_name': FormControl<String>(
          value: '',
        ),
        'classification': FormControl<String>(
          value: '',
        ),
        'sales_representative': FormControl<String>(
          value: '',
        ),
        'entry_date_from': FormControl<String>(
          value: '',
        ),
        'entry_date_to': FormControl<String>(
          value: '',
        ),
        'examination_date_from': FormControl<String>(
          value: '',
        ),
        'examination_date_to': FormControl<String>(
          value: '',
        ),
        'return_date_from': FormControl<String>(
          value: '',
        ),
        'return_date_to': FormControl<String>(
          value: '',
        ),
      },
    );

Map<String, String Function(Object)> validationMessagesLogin(
  BuildContext context,
) =>
    {
      ValidationMessage.required: (error) => context.l10n.mgsFieldRequired,
    };
