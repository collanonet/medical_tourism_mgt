import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';

/// A reactive form field widget for handling phone number input with formatting.
///
/// This widget provides a text input field that:
/// - Automatically formats phone numbers
/// - Validates input as numeric values
/// - Integrates with ReactiveForm for form handling
///
/// Example usage:
/// ```dart
/// ReactivePhoneField(
///   formControlName: 'phoneNumber',
///   label: 'Phone',
///   helperText: 'Enter your phone number',
/// )
/// ```
class ReactivePhoneField extends StatefulWidget {
  const ReactivePhoneField({
    super.key,
    this.onChanged,
    this.onSubmitted,
    this.label,
    this.helperText,
    required this.formControlName,
    this.initialPhoneNumber,
  });

  /// Callback function triggered when the phone number changes
  final Function(FormControl<String>)? onChanged;

  /// Callback function triggered when the field is submitted
  final Function(FormControl<String>)? onSubmitted;

  /// The label text displayed above the input field
  final String? label;

  /// Helper text displayed below the input field
  final String? helperText;

  /// The name of the form control to bind this field to
  final String formControlName;

  /// The initial phone number to display in the input field
  final String? initialPhoneNumber;

  @override
  State<ReactivePhoneField> createState() => _ReactivePhoneFieldState();
}

class _ReactivePhoneFieldState extends State<ReactivePhoneField> {
  /// Controller for managing the text input
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initialize();
    });
  }

  /// Initializes the field with existing form control value and sets up value change listener
  void _initialize() {
    final formGroup = ReactiveForm.of(context) as FormGroup?;

    if (formGroup == null) return;

    final control = formGroup.control(widget.formControlName);

    if (control.value != null) {
      _phoneController.text = formatPhoneNumber(control.value as String);
    }

    control.valueChanges.listen((value) {
      if (value != null) {
        _phoneController.text = formatPhoneNumber(value as String);
      } else {
        _phoneController.clear();
      }
    });

    setState(() {});
  }

  /// Formats a phone number string with proper spacing
  ///
  /// [value] The phone number string to format
  /// Returns the formatted phone number string
  String formatPhoneNumber(String value) {
    if (value.length == 12) {
      return '+${value.substring(0, 3)} ${value.substring(3, 6)} ${value.substring(6, 9)} ${value.substring(9)}';
    }
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveFormField<String, String>(
      formControlName: widget.formControlName,
      validationMessages: {
        'required': (control) => 'Phone number is required',
        'pattern': (control) => 'Invalid phone number format',
      },
      builder: (field) {
        return TextFormField(
          controller: _phoneController,
          keyboardType: TextInputType.phone,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9+]')),
          ],
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            labelText: widget.label,
            helperText: widget.helperText ?? 'Enter your phone number',
            suffixIcon: const Icon(Icons.phone, color: Colors.grey),
          ),
          onChanged: (value) => _onFieldChange(value, field),
          onFieldSubmitted: (value) => _onFieldChange(value, field),
        );
      },
    );
  }

  /// Handles changes to the field value
  ///
  /// [value] The new string value from the text field
  /// [field] The reactive form field state
  void _onFieldChange(
      String value, ReactiveFormFieldState<String, String> field) {
    final formGroup = ReactiveForm.of(context) as FormGroup?;
    if (formGroup == null) return;

    final plainValue =
        value.replaceAll(' ', '').replaceAll('+', ''); // Remove formatting
    formGroup.control(widget.formControlName).value =
        plainValue; // Save unformatted value
    field.didChange(plainValue);

    // Format the displayed value
    _phoneController.text = formatPhoneNumber(plainValue);
    _phoneController.selection = TextSelection.fromPosition(
      TextPosition(offset: _phoneController.text.length),
    );
  }
}
