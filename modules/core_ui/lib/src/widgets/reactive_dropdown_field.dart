import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../core_ui.dart';

class ReactiveDropdownFormField extends StatelessWidget {
  const ReactiveDropdownFormField({
    super.key,
    this.formControl,
    this.formControlName,
    this.autofocus = false,
    this.decoration = const InputDecoration(),
    this.onSubmitted,
    this.validationMessages,
    this.onTap,
    this.readOnly = false,
    this.radiusBorder,
    this.onChanged,
    this.items,
  });

  final String? formControlName;
  final FormControl<String>? formControl;
  final bool autofocus;
  final InputDecoration decoration;
  final ReactiveFormFieldCallback<String>? onSubmitted;
  final Map<String, String Function(Object)>? validationMessages;
  final Function(FormControl<String>)? onTap;
  final bool readOnly;
  final double? radiusBorder;
  final Function(FormControl<String>)? onChanged;
  final List<DropdownMenuItem<String>>? items;

  @override
  Widget build(BuildContext context) {
    final InputBorder errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        radiusBorder ?? context.appTheme.spacing.borderRadiusMedium,
      ),
      borderSide: BorderSide(
        color: context.appTheme.errorColor,
        width: 1.5,
      ),
    );
    final InputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        radiusBorder ?? context.appTheme.spacing.borderRadiusMedium,
      ),
      borderSide: BorderSide(
        color: context.appTheme.dividerColor,
        width: 1.5,
      ),
    );

    final InputBorder focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        radiusBorder ?? context.appTheme.spacing.borderRadiusMedium,
      ),
      borderSide: BorderSide(
        color: context.appTheme.primaryColor,
        width: 1.5,
      ),
    );

    return ReactiveDropdownField<String>(
      formControlName: formControlName,
      formControl: formControl,
      autofocus: autofocus,
      validationMessages: validationMessages,
      onTap: onTap,
      readOnly: readOnly,
      decoration: decoration.copyWith(
        fillColor: Colors.white,
        // fillColor: CupertinoColors.systemGroupedBackground,
        filled: true,
        border: border,
        enabledBorder: border,
        errorBorder: errorBorder,
        focusedErrorBorder: errorBorder,
        focusedBorder: focusedBorder,
      ),
      onChanged: onChanged,
      items: items ?? [],
    );
  }
}
