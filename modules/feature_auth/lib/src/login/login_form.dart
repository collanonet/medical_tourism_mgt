
import 'package:core_l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup formLogin() => FormGroup({
      'email': FormControl<String>(
        value: '',
        validators: [Validators.required],
      ),
      'password': FormControl<String>(
        value: '',
        validators: [Validators.required],
      ),
    });

Map<String, String Function(Object)> validationMessagesLogin(BuildContext context) => {
  ValidationMessage.required: (error) => context.l10n.mgsFieldRequired
};
