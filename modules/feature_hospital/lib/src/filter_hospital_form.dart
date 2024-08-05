import 'package:core_l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup formFilterHospital() => FormGroup(
      {
        'hospitalName': FormControl<String>(
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
        'hospital_type1': FormControl<bool>(
        ),
        'hospital_type2': FormControl<bool>(
        ),
        'hospital_type3': FormControl<bool>(
        ),
        'hospital_type4': FormControl<bool>(
        ),
      },
    );

Map<String, String Function(Object)> validationMessagesFilterPatient(
  BuildContext context,
) =>
    {
      ValidationMessage.required: (error) => context.l10n.mgsFieldRequired,
    };
