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

    if (control.validators.contains(Validators.required)) {
      // Add required validator to the field
    }

    setState(() {});
  }

  /// Formats a phone number string with proper spacing
  ///
  /// [value] The phone number string to format
  /// Returns the formatted phone number string
  String formatPhoneNumber(String value) {
    if (value.length <= 12) {
      return '+${value.substring(0, 2)}-${value.substring(2, 5)}-${value.substring(5, 8)}-${value.substring(8)}';
    } else if (value.length <= 15) {
      return '+${value.substring(0, 2)}-${value.substring(2, 5)}-${value.substring(5, 8)}-${value.substring(8, 11)}-${value.substring(11)}';
    } else {
      // Handle other lengths dynamically
      String formatted = '+${value.substring(0, 2)}';
      int index = 2;
      while (index < value.length) {
        int endIndex = (index + 3 < value.length) ? index + 3 : value.length;
        formatted += '-${value.substring(index, endIndex)}';
        index = endIndex;
      }
      return formatted;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveFormField<String, String>(
      formControlName: widget.formControlName,
      validationMessages: {
        'required': (control) => '電話番号は必須です',
        'pattern': (control) => '電話番号の形式が無効です',
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
            helperText: widget.helperText ?? '電話番号を入力してください',
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
