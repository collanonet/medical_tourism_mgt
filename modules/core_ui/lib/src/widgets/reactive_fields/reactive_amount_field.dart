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

  // For Japanese Yen with commas but no decimals:
  final NumberFormat _japaneseCurrencyFormat = NumberFormat('#,##0', 'ja_JP');

  // Flag to avoid multiple subscriptions or unnecessary calls in lifecycle events
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _initialize());
  }

  @override
  void didUpdateWidget(covariant ReactiveAmountField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialAmount != widget.initialAmount) {
      _initialize();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Make sure we only initialize once to avoid multiple subscriptions
    if (!_initialized) {
      _initialize();
    }
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

    // Mark that we've attached the listener
    _initialized = true;

    // Initialize with either the control value or provided initialAmount
    final double initialValue =
        (control.value ?? widget.initialAmount ?? 0.0) as double;
    _amountController.text = _formatAmount(initialValue);

    // Listen for external changes to the control value
    control.valueChanges.listen((value) {
      if (value != null) {
        final formatted = _formatAmount(value as double);
        // Update controller text only if it differs
        if (_amountController.text != formatted) {
          _amountController.value = TextEditingValue(
            text: formatted,
            selection: TextSelection.collapsed(offset: formatted.length),
          );
        }
      }
    });
  }

  String _formatAmount(double value) {
    try {
      return _japaneseCurrencyFormat.format(value);
    } catch (_) {
      return value.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveFormField<double, String>(
      formControlName: widget.formControlName,
      valueAccessor: DoubleValueAccessor(),
      validationMessages: {
        'required': (control) => '金額は必須です',
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
            helperText: widget.helperText ?? '金額を日本円で入力してください',
            suffixIcon: const Icon(
              Icons.currency_yen,
              color: Colors.grey,
            ),
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

    final oldText = _amountController.text;
    final oldCursorPosition = _amountController.selection.start;

    // Remove commas so we can parse the numeric value
    final plainText = value.replaceAll(',', '');
    final parsedValue =
        plainText.isEmpty ? 0.0 : double.tryParse(plainText) ?? 0.0;

    // Update the reactive form control with the parsed double
    formGroup.control(widget.formControlName).value = parsedValue;

    // Format the new text
    final newFormattedText = _formatAmount(parsedValue);

    // Adjust the cursor position to account for commas
    int newCursorPosition = oldCursorPosition;
    if (oldText.length != newFormattedText.length) {
      final oldCommaCount =
          oldText.substring(0, oldCursorPosition).split(',').length - 1;
      final newCommaCount = newFormattedText
              .substring(0, _min(oldCursorPosition, newFormattedText.length))
              .split(',')
              .length -
          1;
      newCursorPosition += (newCommaCount - oldCommaCount);
    }

    // Clamp the position in case we go out of range
    newCursorPosition = newCursorPosition.clamp(0, newFormattedText.length);

    // Update the text controller
    _amountController.value = TextEditingValue(
      text: newFormattedText,
      selection: TextSelection.collapsed(offset: newCursorPosition),
    );

    // Update the underlying ReactiveFormField
    field.didChange(newFormattedText);

    // Call onChanged callback
    if (widget.onChanged != null) {
      widget.onChanged!(
          formGroup.control(widget.formControlName) as FormControl<double>);
    }
  }

  int _min(int a, int b) => a < b ? a : b;
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
