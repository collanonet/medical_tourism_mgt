import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:intl/intl.dart';

class ReactiveDatePickerField extends StatefulWidget {
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

  final Function(FormControl<DateTime>)? onChanged;
  final Function(FormControl<DateTime>)? onSubmitted;
  final String? label;
  final String? helperText;
  final String formControlName;
  final DateTime? firstDate;
  final DateTime? initialDate;
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
    init();
  }

  void init() {
    final formGroup = ReactiveForm.of(context) as FormGroup?;

    if (formGroup == null) {
      // If formGroup is still null, it means the form isn't ready yet.
      return;
    }

    final control = formGroup.control(widget.formControlName);

    // Set initial text if control already has a value
    final currentValue = control.value;
    if (currentValue != null) {
      _dateController.text = dateFormat.format(currentValue);
    }
    setState(() {});
  }

  String? _validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a date';
    }

    final RegExp regex = RegExp(_datePattern);
    if (!regex.hasMatch(value)) {
      return 'Enter date in YYYY/MM/DD format';
    }

    try {
      final parts = value.split('/');
      final year = int.parse(parts[0]);
      final month = int.parse(parts[1]);
      final day = int.parse(parts[2]);
      final date = DateTime(year, month, day);

      if (date.year != year || date.month != month || date.day != day) {
        return 'Invalid date';
      }
    } catch (e) {
      return 'Invalid date';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveDatePicker(
      formControlName: widget.formControlName,
      firstDate: widget.firstDate ?? DateTime(1900),
      initialDate: widget.initialDate ?? DateTime.now(),
      lastDate: widget.lastDate ?? DateTime(2100),
      initialEntryMode: DatePickerEntryMode.input,
      builder: (context, picker, child) {
        return Form(
          key: _formKey,
          child: TextFormField(
            controller: _dateController,
            keyboardType: TextInputType.datetime,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9/]')),
            ],
            validator: _validateDate,
            onChanged: validate,
            onSaved: validate,
            onFieldSubmitted: validate,
            decoration: InputDecoration(
              hintText: 'YYYY/MM/DD',
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
          .setErrors({'invalidDate': 'Invalid date format'});
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
