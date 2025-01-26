// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_l10n/l10n.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup formFilterHospital() => FormGroup(
      {
        'hospitalName': FormControl<String>(),
        'type': FormControl<String>(),
        'location': FormControl<String>(),
        'rHave': FormControl<String>(),
        'universityHospitalType': FormControl<bool>(),
        'nationalAndPublicHospitalsType': FormControl<bool>(),
        'privateHospitalType': FormControl<bool>(),
        'clinicType': FormControl<bool>(),
      },
    );

Map<String, String Function(Object)> validationMessagesFilterPatient(
  BuildContext context,
) =>
    {
      ValidationMessage.required: (error) => context.l10n.mgsFieldRequired,
    };
