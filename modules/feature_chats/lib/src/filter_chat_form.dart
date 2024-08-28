import 'package:core_l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup formFilterChat() => FormGroup(
      {
        'patientNameMessage': FormControl<String>(),
      },
    );
