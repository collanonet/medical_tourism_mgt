import 'package:core_l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup formFilterPatient() => FormGroup(
      {
        'nameKana': FormControl<String>(),
        'companyName': FormControl<String>(),
        'pastCasesNumber': FormControl<int>(),
        'address': FormControl<String>(),
        'area': FormControl<String>(),
        'patientName': FormControl<String>(),
      },
    );

Map<String, String Function(Object)> validationMessagesFilterPatient(
  BuildContext context,
) =>
    {
      ValidationMessage.required: (error) => context.l10n.mgsFieldRequired,
    };
