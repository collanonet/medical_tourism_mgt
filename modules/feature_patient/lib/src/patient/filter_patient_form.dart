import 'package:core_l10n/l10n.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup formFilterPatient() => FormGroup(
      {
        'patientName': FormControl<String?>(),
        'companyAGENTS': FormControl<String?>(),
        'acceptingHospital': FormControl<String?>(),
        'type': FormControl<String>(),
        'salesStaff': FormControl<String?>(),
        'dateOfEntryfrom': FormControl<DateTime>(
          validators: [
            Validators.pattern(
              ValidatorRegExp.date,
            ),
          ],
        ),
        'dateOfEntryto': FormControl<DateTime>(
          validators: [
            Validators.pattern(
              ValidatorRegExp.date,
            ),
          ],
        ),
        'medicalDayfrom': FormControl<DateTime>(
          validators: [
            Validators.pattern(
              ValidatorRegExp.date,
            ),
          ],
        ),
        'medicalDayto': FormControl<DateTime>(
          validators: [
            Validators.pattern(
              ValidatorRegExp.date,
            ),
          ],
        ),
        'returnDatefrom': FormControl<DateTime>(
          validators: [
            Validators.pattern(
              ValidatorRegExp.date,
            ),
          ],
        ),
        'returnDateto': FormControl<DateTime>(
          validators: [
            Validators.pattern(
              ValidatorRegExp.date,
            ),
          ],
        ),
      },
    );

Map<String, String Function(Object)> validationMessagesFilterPatient(
  BuildContext context,
) =>
    {
      ValidationMessage.required: (error) => context.l10n.mgsFieldRequired,
    };
