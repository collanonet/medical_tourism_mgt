import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

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

  final Function(FormControl<double>)? onChanged;
  final Function(FormControl<double>)? onSubmitted;
  final String? label;
  final String? helperText;
  final String formControlName;
  final double? initialAmount;

  @override
  State<ReactiveAmountField> createState() => _ReactiveAmountFieldState();
}

class _ReactiveAmountFieldState extends State<ReactiveAmountField> {
  final TextEditingController _amountController = TextEditingController();
  final NumberFormat _japaneseCurrencyFormat = NumberFormat('#,##0', 'ja_JP');

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initialize();
    });
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  void _initialize() {
    final formGroup = ReactiveForm.of(context) as FormGroup?;
    if (formGroup == null) return;

    final control = formGroup.control(widget.formControlName);

    // Initialize with either the control value or provided initialAmount
    final initialValue = control.value ?? widget.initialAmount ?? 0.0;
    if (initialValue != null) {
      _amountController.text = _formatAmount(initialValue as double);
    }

    // Listen for external changes to the control value
    control.valueChanges.listen((value) {
      if (value != null &&
          _amountController.text != _formatAmount(value as double)) {
        final newText = _formatAmount(value as double);
        _amountController.value = TextEditingValue(
          text: newText,
          selection: TextSelection.collapsed(offset: newText.length),
        );
      }
    });

    setState(() {});
  }

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
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            // Allow digits and comma for formatting
            FilteringTextInputFormatter.allow(RegExp(r'[0-9,]')),
          ],
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            labelText: widget.label,
            helperText: widget.helperText ?? 'Enter amount in JPY',
            suffixIcon: const Icon(Icons.currency_yen, color: Colors.grey),
            errorText: field.errorText,
          ),
          onChanged: (value) => _onFieldChange(value, field),
          onFieldSubmitted: (value) {
            _onFieldChange(value, field);
            if (widget.onSubmitted != null) {
              final formGroup = ReactiveForm.of(context) as FormGroup?;
              if (formGroup != null) {
                widget.onSubmitted!(formGroup.control(widget.formControlName)
                    as FormControl<double>);
              }
            }
          },
        );
      },
    );
  }

  void _onFieldChange(
      String value, ReactiveFormFieldState<double, String> field) {
    final formGroup = ReactiveForm.of(context) as FormGroup?;
    if (formGroup == null) return;

    // Store current cursor position and text for later adjustment
    final currentPosition = _amountController.selection.start;
    final oldText = _amountController.text;

    // Parse value, handle empty string case
    final plainText = value.replaceAll(',', '');
    final parsedValue =
        plainText.isEmpty ? 0.0 : double.tryParse(plainText) ?? 0.0;

    // Update the form control value
    formGroup.control(widget.formControlName).value = parsedValue;

    // Format the displayed value
    final formattedText = _formatAmount(parsedValue);

    // Calculate new cursor position accounting for added/removed commas
    int newPosition = currentPosition;
    if (oldText.length != formattedText.length) {
      // Count commas before cursor in old and new text
      final oldCommaCount =
          oldText.substring(0, currentPosition).split(',').length - 1;
      final newCommaCount = formattedText
              .substring(0, min(currentPosition, formattedText.length))
              .split(',')
              .length -
          1;
      newPosition += (newCommaCount - oldCommaCount);
    }

    // Ensure the position is valid
    newPosition = newPosition.clamp(0, formattedText.length);

    // Update the text field with formatted value and adjusted cursor position
    _amountController.value = TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: newPosition),
    );

    // Notify field was changed
    field.didChange(formattedText);

    // Call onChanged callback if provided
    if (widget.onChanged != null) {
      widget.onChanged!(
          formGroup.control(widget.formControlName) as FormControl<double>);
    }
  }
}

class DoubleValueAccessor extends ControlValueAccessor<double, String> {
  final NumberFormat _formatter = NumberFormat('#,##0', 'ja_JP');

  @override
  String? modelToViewValue(double? modelValue) {
    if (modelValue == null) return null;
    return _formatter.format(modelValue);
  }

  @override
  double? viewToModelValue(String? viewValue) {
    if (viewValue == null || viewValue.isEmpty) return null;
    return double.tryParse(viewValue.replaceAll(',', ''));
  }
}

// Helper function needed for the implementation
int min(int a, int b) => a < b ? a : b;
