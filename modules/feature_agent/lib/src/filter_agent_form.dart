// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_l10n/l10n.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup formFilterPatient() => FormGroup(
      {
        'nameKana': FormControl<String?>(),
        'companyName': FormControl<String?>(),
        'pastCasesNumber': FormControl<int>(),
        'country': FormControl<String?>(),
        'area': FormControl<String?>(),
      },
    );

Map<String, String Function(Object)> validationMessagesFilterPatient(
  BuildContext context,
) =>
    {
      ValidationMessage.required: (error) => context.l10n.mgsFieldRequired,
    };
