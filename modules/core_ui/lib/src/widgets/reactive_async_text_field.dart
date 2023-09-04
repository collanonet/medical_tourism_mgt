import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ReactiveAsyncTextField extends ReactiveTextField<String> {
  ReactiveAsyncTextField({
    super.key,
    required this.controlName,
    this.inputFormatters,
    this.helperWidget,
    this.suffixWidget,
    this.loading,
    this.labelText,
    this.hintText,
    this.onChanged,
    this.border,
  }) : super(
          formControlName: controlName,
          autofocus: true,
          onChanged: onChanged,
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            enabledBorder: border,
            border: border ?? const OutlineInputBorder(),
            suffixIcon: loading == true
                ? Transform.scale(
                    scale: 0.5,
                    child: const CircularProgressIndicator(),
                  )
                : suffixWidget,
          ),
          keyboardType: TextInputType.number,
          inputFormatters: inputFormatters ?? [],
        );

  final String controlName;
  final Function(FormControl<String> control)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? helperWidget;
  final Widget? suffixWidget;
  final bool? loading;
  final String? labelText;
  final String? hintText;
  final InputBorder? border;
}
