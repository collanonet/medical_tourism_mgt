// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_l10n/l10n.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup formFilterPrePatient() => FormGroup(
      {
        'agents': FormControl<String>(
          value: '',
        ),
        'patient': FormControl<String>(
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
