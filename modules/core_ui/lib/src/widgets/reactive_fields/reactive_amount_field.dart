import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

/// A reactive form field widget for handling amount input with Japanese currency formatting.
///
/// This widget provides a text input field that:
/// - Formats numbers according to Japanese currency standards
/// - Validates input as numeric values
/// - Integrates with ReactiveForm for form handling
///
/// Example usage:
/// ```dart
/// ReactiveAmountField(
///  formControlName: 'amount',
///  label: 'Amount',
///  helperText: 'Enter amount in JPY',
/// )
/// ```

class ReactiveAmountField extends StatefulWidget {
  const ReactiveAmountField({
    super.key,
    this.onChanged,
    this.onSubmitted,
    this.label,
    this.helperText,
    required this.formControlName,
    this.initialAmount,
  });

  /// Callback function triggered when the amount value changes.
  final Function(FormControl<double>)? onChanged;

  /// Callback function triggered when the field is submitted.
  final Function(FormControl<double>)? onSubmitted;

  /// The label text displayed above the input field.
  final String? label;

  /// Helper text displayed below the input field.
  final String? helperText;

  /// The name of the form control to bind this field to.
  final String formControlName;

  /// The initial amount to display in the input field.
  final double? initialAmount;

  @override
  State<ReactiveAmountField> createState() => _ReactiveAmountFieldState();
}

class _ReactiveAmountFieldState extends State<ReactiveAmountField> {
  /// Controller for managing the text input
  final TextEditingController _amountController = TextEditingController();

  /// Formatter for Japanese currency display (without currency symbol)
  final NumberFormat _japaneseCurrencyFormat = NumberFormat("#,##0", "ja_JP");

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
      // Format the initial value
      _amountController.text = _formatAmount(control.value as double);
    }

    // Listen for changes in the control's value
    control.valueChanges.listen((value) {
      if (value != null) {
        _amountController.text = _formatAmount(value as double);
      } else {
        _amountController.clear();
      }
    });

    setState(() {});
  }

  /// Formats a double value according to Japanese currency format
  ///
  /// [value] The numeric value to format
  /// Returns the formatted string representation
  String _formatAmount(double value) {
    try {
      return _japaneseCurrencyFormat.format(value);
    } catch (e) {
      return value.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveFormField<double, String>(
      formControlName: widget.formControlName,
      valueAccessor: DoubleValueAccessor(),
      validationMessages: {
        'required': (control) => 'Amount is required',
        'invalidFormat': (control) => 'Invalid amount format',
      },
      builder: (field) {
        return TextFormField(
          controller: _amountController,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          ],
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            labelText: widget.label,
            helperText: widget.helperText ?? 'Enter amount in JPY',
            suffixIcon: const Icon(Icons.currency_yen, color: Colors.grey),
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
      String value, ReactiveFormFieldState<double, String> field) {
    final formGroup = ReactiveForm.of(context) as FormGroup?;
    if (formGroup == null) return;

    final plainValue = double.tryParse(value.replaceAll(',', '')) ??
        0.0; // Remove formatting and parse to double
    formGroup.control(widget.formControlName).value =
        plainValue; // Save unformatted value as double
    field.didChange(_formatAmount(plainValue));

    // Format the displayed value
    _amountController.text = _formatAmount(plainValue);
    _amountController.selection = TextSelection.fromPosition(
      TextPosition(offset: _amountController.text.length),
    );
  }
}

/// Converts between double values used in the form model and formatted strings shown in the UI
///
/// Handles the conversion between:
/// - Model: double values for calculations
/// - View: formatted strings for display
class DoubleValueAccessor extends ControlValueAccessor<double, String> {
  /// Formatter instance for Japanese currency format
  final NumberFormat _formatter = NumberFormat("#,##0", "ja_JP");

  /// Converts the model value (double) to view value (formatted string)
  @override
  String? modelToViewValue(double? modelValue) {
    if (modelValue == null) return null;
    return _formatter.format(modelValue);
  }

  /// Converts the view value (formatted string) to model value (double)
  @override
  double? viewToModelValue(String? viewValue) {
    if (viewValue == null || viewValue.isEmpty) return null;
    return double.tryParse(viewValue.replaceAll(',', ''));
  }
}
