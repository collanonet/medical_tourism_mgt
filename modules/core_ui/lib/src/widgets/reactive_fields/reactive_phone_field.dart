import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';

/// Reactive form field for global phone number input.
/// Example usage:
/// final form = FormGroup({
///   'phone': FormControl<String>(
///     validators: [
///       Validators.required,
///       Validators.pattern(r'^\+?[1-9]\d{1,14}$'), // E.164
///     ],
///   ),
/// });
///
/// Usage in a form:
/// ReactivePhoneField(
///   formControlName: 'phone',
///   label: 'Phone Number',
///   helperText: 'Enter a valid global number (e.g., +123456789).',
/// );
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

  final Function(FormControl<String>)? onChanged;
  final Function(FormControl<String>)? onSubmitted;
  final String? label;
  final String? helperText;
  final String formControlName;
  final String? initialPhoneNumber;

  @override
  State<ReactivePhoneField> createState() => _ReactivePhoneFieldState();
}

class _ReactivePhoneFieldState extends State<ReactivePhoneField> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _initializeField());
  }

  void _initializeField() {
    final formGroup = ReactiveForm.of(context) as FormGroup?;
    if (formGroup == null) return;

    final control = formGroup.control(widget.formControlName);

    if (widget.initialPhoneNumber != null) {
      control.value = widget.initialPhoneNumber!;
      _phoneController.text = _formatPhoneNumber(widget.initialPhoneNumber!);
    }

    control.valueChanges.listen((value) {
      if (value != null) {
        _phoneController.text = _formatPhoneNumber(value as String);
      } else {
        _phoneController.clear();
      }
    });
  }

  /// Formats a phone number into an international format.
  ///
  /// E.g., "+123456789" -> "+12-345-6789".
  String _formatPhoneNumber(String value) {
    final cleanValue = value.replaceAll(RegExp(r'[^0-9]'), '');
    final buffer = StringBuffer('+');

    for (int i = 0; i < cleanValue.length; i++) {
      if (i == 2 || i == 5 || i == 8) buffer.write('-');
      buffer.write(cleanValue[i]);
    }

    return buffer.toString();
  }

  /// Validates a phone number against the E.164 format.
  bool _isValidPhoneNumber(String value) {
    final regex = RegExp(r'^\+?[1-9]\d{1,14}$'); // E.164 validation regex
    return regex.hasMatch(value.replaceAll(RegExp(r'[^0-9+]'), ''));
  }

  void _handleValueChange(
      String value, ReactiveFormFieldState<String, String> field) {
    final formGroup = ReactiveForm.of(context) as FormGroup?;
    if (formGroup == null) return;

    final cleanValue = value.replaceAll(RegExp(r'[^0-9+]'), '');
    formGroup.control(widget.formControlName).value = cleanValue;
    field.didChange(cleanValue);

    _phoneController.text = _formatPhoneNumber(cleanValue);
    _phoneController.selection = TextSelection.fromPosition(
      TextPosition(offset: _phoneController.text.length),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveFormField<String, String>(
      formControlName: widget.formControlName,
      validationMessages: {
        'required': (control) => 'Phone number is required.',
        'pattern': (control) =>
            'Enter a valid phone number (e.g., +123456789).',
      },
      builder: (field) {
        return TextFormField(
          controller: _phoneController,
          keyboardType: TextInputType.phone,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9+]')),
          ],
          decoration: InputDecoration(
            labelText: widget.label ?? 'Phone Number',
            helperText:
                widget.helperText ?? 'Enter a valid global phone number.',
            errorText: !_isValidPhoneNumber(field.value ?? '')
                ? 'Invalid phone number format'
                : null,
            suffixIcon: const Icon(Icons.phone, color: Colors.grey),
          ),
          onChanged: (value) => _handleValueChange(value, field),
          onFieldSubmitted: (value) => _handleValueChange(value, field),
        );
      },
    );
  }
}
