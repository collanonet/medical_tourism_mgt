import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

/// A reactive form field widget that displays a group of toggleable buttons.
///
/// This widget creates a row of buttons where only one can be selected at a time,
/// similar to a radio group but with a more prominent visual appearance.
///
/// Example usage:
/// ```dart
/// ReactiveSwitchField<String>(
///   formControlName: 'gender',
///   values: ['male', 'female'],
///   labels: ['Male', 'Female'],
///   helperText: 'Select your gender',
/// )
/// ```
class ReactiveSwitchField<T> extends StatelessWidget {
  /// Creates a ReactiveSwitchField.
  const ReactiveSwitchField({
    super.key,
    required this.formControlName,
    required this.values,
    required this.labels,
    this.helperText,
    this.initialValue,
    this.buttonStyle,
    this.spacing = 8.0,
  });

  /// The name of the form control to bind this field to.
  final String formControlName;

  /// The list of values that can be selected.
  /// Each value corresponds to a button in the switch field.
  final List<T> values;

  /// The list of labels to display on each button.
  /// Must have the same length as [values].
  final List<String> labels;

  /// Optional helper text displayed below the buttons.
  final String? helperText;

  /// The initial value to be selected when the field is first created.
  final T? initialValue;

  /// Custom button style to override the default appearance.
  final ButtonStyle? buttonStyle;

  /// The horizontal spacing between buttons.
  /// Defaults to 8.0 logical pixels.
  final double spacing;

  @override
  Widget build(BuildContext context) {
    assert(values.length == labels.length,
        'The number of values and labels must match.');

    return ReactiveValueListenableBuilder<T>(
      formControlName: formControlName,
      builder: (context, controlValue, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: spacing,
              children: List.generate(values.length, (index) {
                final value = values[index];
                final label = labels[index];
                final isSelected = controlValue.value == value;

                return ElevatedButton(
                  style: buttonStyle ??
                      ElevatedButton.styleFrom(
                        foregroundColor: isSelected
                            ? Colors.white
                            : Theme.of(context).colorScheme.primary,
                        backgroundColor: isSelected
                            ? Theme.of(context).colorScheme.primary
                            : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                            width: 2,
                          ),
                        ),
                      ),
                  onPressed: () {
                    controlValue.value = value;
                  },
                  child: Text(label),
                );
              }),
            ),
            if (helperText != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  helperText!,
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
          ],
        );
      },
    );
  }
}
