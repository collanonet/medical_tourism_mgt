import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../core_ui.dart';

class ReactiveTextFormField extends StatelessWidget {
  const ReactiveTextFormField({
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
    this.keyboardType,
    this.inputFormatters,
    this.maxLength,
    this.onEditingComplete,
    this.onChanged,
    this.obscureText = false,
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
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final Function(FormControl<String>)? onEditingComplete;
  final Function(FormControl<String>)? onChanged;
  final bool obscureText;
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

    return ReactiveTextField<String>(
      formControlName: formControlName,
      formControl: formControl,
      autofocus: autofocus,
      validationMessages: validationMessages,
      onTap: onTap,
      obscureText: obscureText,
      readOnly: readOnly,
      maxLength: maxLength,
      decoration: decoration.copyWith(
        fillColor: CupertinoColors.systemGroupedBackground,
        filled: true,
        border: border,
        enabledBorder: border,
        errorBorder: errorBorder,
        focusedErrorBorder: errorBorder,
        focusedBorder: focusedBorder,
      ),
      onEditingComplete: onEditingComplete,
      onChanged: onChanged,
      keyboardType: keyboardType ?? TextInputType.text,
      inputFormatters: inputFormatters ?? [],
      onSubmitted: onSubmitted,
    );
  }
}
