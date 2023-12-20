import 'package:core_l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup formFilterChat() =>  FormGroup(
  {
    'hospital_name': FormControl<String>(
      value: '',
    ),
    'type': FormControl<String>(
      value: '',
    ),
    'keyword': FormControl<String>(
      value: '',
    ),
    'r_have': FormControl<String>(
      value: '',
    ),
    'hospital_type': FormControl<String>(
      value: '',
    ),
  },
);

Map<String, String Function(Object)> validationMessagesFilterPatient(
  BuildContext context,
) =>
    {
      ValidationMessage.required: (error) => context.l10n.mgsFieldRequired,
    };
