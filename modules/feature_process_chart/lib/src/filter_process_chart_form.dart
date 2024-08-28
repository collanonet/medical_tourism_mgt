import 'package:core_l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup formFilterPatient() =>
 FormGroup(
      {
        '_id' : FormControl<String>(),
        'tourName': FormControl<String>(
          value: '',
        ),
        'classification': FormControl<String>(
          value: '',
        ),
        'dateFrom': FormControl<DateTime>(),
        'dateTo': FormControl<DateTime>(),
      },
    );

Map<String, String Function(Object)> validationMessagesFilterPatient(
  BuildContext context,
) =>
    {
      ValidationMessage.required: (error) => context.l10n.mgsFieldRequired,
    };
