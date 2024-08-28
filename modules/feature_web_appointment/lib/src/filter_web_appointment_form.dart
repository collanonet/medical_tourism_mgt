// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_l10n/l10n.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup formFilterWebAppointment() => FormGroup(
      {
        'hospitalName': FormControl<String>(
          value: '',
        ),
        'doctor_name': FormControl<String>(
          value: '',
        ),
        'reservation_date_from': FormControl<DateTime>(),
        'reservation_date_to': FormControl<DateTime>(),
        'inquiryInProgress': FormControl<bool>(),
        'reservationConfirmed': FormControl<bool>(),
      },
    );

Map<String, String Function(Object)> validationMessagesFilterPatient(
  BuildContext context,
) =>
    {
      ValidationMessage.required: (error) => context.l10n.mgsFieldRequired,
    };
