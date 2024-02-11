import 'package:core_l10n/l10n.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup formFilterPatient() => FormGroup(
      {
        'patient_name': FormControl<String?>(),
        'companyAGENTS': FormControl<String?>(),
        'acceptingHospital': FormControl<String>(),
        'type': FormControl<String>(),
        'salesStaff': FormControl<String?>(),
        'dateOfEntryfrom': FormControl<DateTime>(
        ),
        'dateOfEntryto': FormControl<DateTime>(),
        'medicalDayfrom': FormControl<DateTime>(),
        'medicalDayto': FormControl<DateTime>(),
        'returnDatefrom': FormControl<DateTime>(),
        'returnDateto': FormControl<DateTime>(),
      },
    );

Map<String, String Function(Object)> validationMessagesFilterPatient(
  BuildContext context,
) =>
    {
      ValidationMessage.required: (error) => context.l10n.mgsFieldRequired,
    };
