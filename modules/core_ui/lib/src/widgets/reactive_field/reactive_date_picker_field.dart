import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:intl/intl.dart';

class ReactiveDatePickerField extends StatefulWidget {
  const ReactiveDatePickerField({
    super.key,
    this.onChanged,
    this.onSubmitted,
    required this.label,
    this.helperText,
    required this.formControlName,
    this.lastDate,
    this.firstDate,
    this.initialDate,
  });

  final Function(FormControl<DateTime>)? onChanged;
  final Function(FormControl<DateTime>)? onSubmitted;

  final DateTime? lastDate;
  final DateTime? firstDate;
  final DateTime? initialDate;
  final String label;
  final String? helperText;
  final String formControlName;

  @override
  State<ReactiveDatePickerField> createState() =>
      _ReactiveDatePickerFieldState();
}

class _ReactiveDatePickerFieldState extends State<ReactiveDatePickerField> {
  final formatter = InputFormatter();
  final dateFormat = DateFormat('yyyy/MM/dd');

  @override
  Widget build(BuildContext context) {
    return ReactiveDateTimePicker(
      formControlName: widget.formControlName,
      firstDate: widget.firstDate ?? DateTime(1900),
      lastDate: widget.lastDate ?? DateTime(2100),
      valueAccessor: DateTimeValueAccessor(
        dateTimeFormat: dateFormat,
      ),
      validationMessages: {
        'invalidDate': (_) => 'Invalid date format. Use yyyy/MM/dd.',
      },
      datePickerEntryMode: DatePickerEntryMode.inputOnly,
      decoration:  InputDecoration(
        labelText: widget.label,
        helperText: widget.helperText,
        fillColor: Colors.white,
        filled: true,
        suffixIcon: Icon(
          CupertinoIcons.calendar,
          color: Colors.grey,
        ),
      ),
    );

  }
}


// return ReactiveDatePicker<DateTime>(
// formControlName: widget.formControlName,
// firstDate: widget.firstDate ?? DateTime(1900),
// initialDate: widget.initialDate ?? DateTime.now(),
// lastDate: widget.lastDate ?? DateTime.now(),
// builder: (context, picker, child) {
// return ReactiveTextField<DateTime>(
// formControlName: widget.formControlName,
// valueAccessor: DateTimeValueAccessor(
// dateTimeFormat: dateFormat,
// ),
// onChanged: widget.onChanged,
// onSubmitted: widget.onSubmitted,
// decoration: InputDecoration(
// label: Text(
// widget.label,
// ),
// fillColor: Colors.white,
// filled: true,
// suffixIcon: IconButton(
// icon: const Icon(
// CupertinoIcons.calendar,
// color: Colors.grey,
// ),
// onPressed: picker.showPicker,
// ),
// ),
// validationMessages: {
// 'invalidDate': (_) => 'Invalid date format. Use yyyy/MM/dd.',
// },
// inputFormatters: [
// formatter.dateFormatter,
// ],
// );
// },
// );