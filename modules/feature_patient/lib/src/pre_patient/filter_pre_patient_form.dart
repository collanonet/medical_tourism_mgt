import 'package:core_l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup formFilterPrePatient() => FormGroup(
      {
        'agent_name': FormControl<String>(
          value: '',
        ),
        'patient_name': FormControl<String>(
          value: '',
        ),
      },
    );

Map<String, String Function(Object)> validationMessagesFilterPrePatient(
  BuildContext context,
) =>
    {
      ValidationMessage.required: (error) => context.l10n.mgsFieldRequired,
    };
