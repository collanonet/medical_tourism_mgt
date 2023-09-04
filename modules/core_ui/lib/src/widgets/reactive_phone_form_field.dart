import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'package:reactive_forms/reactive_forms.dart';

import 'reactive_text_form_field.dart';

const String prefixPhoneNumber = '+855';

final formatter = MaskTextInputFormatter(
  mask: '#########',
  type: MaskAutoCompletionType.eager,
);

class ReactivePhoneFormField extends StatelessWidget {
  const ReactivePhoneFormField({
    super.key,
    this.formControl,
    this.formControlName,
    this.autofocus = false,
    this.decoration = const InputDecoration(),
    this.onSubmitted,
  });

  final String? formControlName;
  final FormControl<String>? formControl;
  final bool autofocus;
  final InputDecoration decoration;
  final ReactiveFormFieldCallback<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return ReactiveTextFormField(
      formControlName: formControlName,
      formControl: formControl,
      autofocus: autofocus,
      decoration: decoration.copyWith(
        prefixText: '+855 ',
        border: const OutlineInputBorder(),
      ),
      keyboardType: TextInputType.phone,
      inputFormatters: [formatter],
      onSubmitted: onSubmitted,
    );
  }
}
