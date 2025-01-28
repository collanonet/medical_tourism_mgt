// Flutter imports:
import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

/// A reactive form field widget that provides both manual date input and calendar picker functionality.
///
/// This widget combines a text input field for manual date entry with a calendar picker,
/// integrated into a reactive form structure. It supports date validation and formatting
/// in the YYYY/MM/DD format.
///
/// Example usage:
/// ```dart
/// ReactiveDatePickerField(
///   formControlName: 'birthDate',
///   label: 'Date of Birth',
///   helperText: 'Enter your birth date',
/// )
/// ```
class ReactiveDatePickerField extends StatefulWidget {
  /// Creates a reactive date picker field.
  ///
  /// The [formControlName] parameter is required to bind this field to a reactive form control.
  const ReactiveDatePickerField({
    super.key,
    this.onChanged,
    this.onSubmitted,
    this.label,
    this.helperText,
    required this.formControlName,
    this.firstDate,
    this.initialDate,
    this.lastDate,
  });

  /// Callback function triggered when the date value changes.
  final Function(FormControl<DateTime>)? onChanged;

  /// Callback function triggered when the field is submitted.
  final Function(FormControl<DateTime>)? onSubmitted;

  /// The label text displayed above the input field.
  final String? label;

  /// Helper text displayed below the input field.
  final String? helperText;

  /// The name of the form control to bind this field to.
  final String formControlName;

  /// The earliest date that can be selected.
  /// Defaults to year 1900 if not specified.
  final DateTime? firstDate;

  /// The initial date to display when the picker is shown.
  /// Defaults to current date if not specified.
  final DateTime? initialDate;

  /// The latest date that can be selected.
  /// Defaults to year 2100 if not specified.
  final DateTime? lastDate;

  @override
  State<ReactiveDatePickerField> createState() =>
      _ReactiveDatePickerFieldState();
}

class _ReactiveDatePickerFieldState extends State<ReactiveDatePickerField> {
  final dateFormat = DateFormat('yyyy/MM/dd');
  final TextEditingController _dateController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final String _datePattern =
      r'^\d{4}/(0[1-9]|1[0-2])/(0[1-9]|[1-2][0-9]|3[0-1])$';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      init();
    });
  }

  void init() {
    final formGroup = ReactiveForm.of(context) as FormGroup?;

    if (formGroup == null) {
      return;
    }

    final control = formGroup.control(widget.formControlName);

    final currentValue = control.value;
    if (currentValue != null) {
      _dateController.text = dateFormat.format(currentValue);
    }

    control.valueChanges.listen((value) {
      if (value != null) {
        _dateController.text = dateFormat.format(value);
      } else {
        _dateController.clear();
      }
    });

    if (control.validators.contains(Validators.required)) {
      validate(_dateController.text);
    }
    setState(() {});
  }

  String? _validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return '日付を入力してください';
    }

    final RegExp regex = RegExp(_datePattern);
    if (!regex.hasMatch(value)) {
      return '日付をYYYY/MM/DD形式で入力してください';
    }

    try {
      final parts = value.split('/');
      final year = int.parse(parts[0]);
      final month = int.parse(parts[1]);
      final day = int.parse(parts[2]);
      final date = DateTime(year, month, day);

      if (date.year != year || date.month != month || date.day != day) {
        return '無効な日付';
      }
    } catch (e) {
      return '無効な日付';
    }

    return null;
  }

  final inputFormatter = InputFormatter();

  @override
  Widget build(BuildContext context) {
    return ReactiveDatePicker(
      formControlName: widget.formControlName,
      firstDate: widget.firstDate ?? DateTime(1900),
      initialDate: widget.initialDate ?? DateTime.now(),
      lastDate: widget.lastDate ?? DateTime(2100),
      initialEntryMode: DatePickerEntryMode.calendar,
      builder: (context, picker, child) {
        return Form(
          key: _formKey,
          child: TextFormField(
            controller: _dateController,
            keyboardType: TextInputType.datetime,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9/]')),
              inputFormatter.dateFormatter,
            ],
            validator: _validateDate,
            onChanged: validate,
            onSaved: validate,
            onFieldSubmitted: validate,
            decoration: InputDecoration(
              label: widget.label != null ? Text(widget.label!) : null,
              hintText: widget.helperText ?? 'YYYY/MM/DD',
              suffixIcon: IconButton(
                onPressed: picker.showPicker,
                icon: const Icon(
                  CupertinoIcons.calendar,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  String? validate(String? value) {
    final formGroup = ReactiveForm.of(context) as FormGroup?;
    if (formGroup == null) return null;

    if (_formKey.currentState!.validate()) {
      // If the input is valid, update the reactive form control value.
      formGroup.control(widget.formControlName).value = _parseDate(value);
      return value;
    } else {
      // If invalid, mark the control with an error.
      formGroup
          .control(widget.formControlName)
          .setErrors({'invalidDate': '無効な日付形式です'});
    }
    return null;
  }

  DateTime? _parseDate(String? value) {
    if (value == null || value.isEmpty) return null;
    final parts = value.split('/');
    final year = int.parse(parts[0]);
    final month = int.parse(parts[1]);
    final day = int.parse(parts[2]);
    return DateTime(year, month, day);
  }
}
