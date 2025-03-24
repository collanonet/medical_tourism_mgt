import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';

/// A reactive form field widget that provides both manual time input
/// and a time picker for HH:mm (24-hour) time format.
class ReactiveTimePickerField extends StatefulWidget {
  /// The name of the form control to bind this field to.
  final String formControlName;

  /// The label text displayed above the input field.
  final String? label;

  /// Helper text displayed below the input field.
  final String? helperText;

  /// The initial time (HH:mm) to display when the picker is shown.
  final String? initialTime;

  /// Callback function triggered when the time value changes.
  final Function(FormControl<String>)? onChanged;

  /// Callback function triggered when the field is submitted.
  final Function(FormControl<String>)? onSubmitted;

  const ReactiveTimePickerField({
    Key? key,
    required this.formControlName,
    this.label,
    this.helperText,
    this.initialTime,
    this.onChanged,
    this.onSubmitted,
  }) : super(key: key);

  @override
  State<ReactiveTimePickerField> createState() =>
      _ReactiveTimePickerFieldState();
}

class _ReactiveTimePickerFieldState extends State<ReactiveTimePickerField> {
  late TextEditingController _timeController;

  @override
  void initState() {
    super.initState();
    _timeController = TextEditingController();

    // After the widget builds, sync the controller text with the form control.
    WidgetsBinding.instance.addPostFrameCallback((_) => _initialize());
  }

  void _initialize() {
    final formGroup = ReactiveForm.of(context) as FormGroup?;
    if (formGroup == null) return;

    final control = formGroup.control(widget.formControlName);

    // Set the initial text based on current form control value
    final currentValue = control.value;
    if (currentValue != null) {
      _timeController.text = currentValue as String;
    }

    // Listen to changes in the form control and update the text controller
    control.valueChanges.listen((value) {
      if (value != null && value != _timeController.text) {
        _timeController.text = value as String;
      } else if (value == null) {
        _timeController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveFormField<String, String>(
      formControlName: widget.formControlName,
      // Provide custom validation messages (optional)
      validationMessages: {
        'required': (_) => 'Time is required',
        'invalidTime': (_) => 'Invalid time',
      },
      // Convert the control's data to/from String directly
      valueAccessor: DefaultValueAccessor(),
      builder: (field) {
        return TextField(
          controller: _timeController,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.done,
          inputFormatters: [
            // Only allow digits, up to 4 (HHmm),
            // then auto-insert colon when length >= 3.
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(4),
            _TimeTextFormatter(),
          ],
          decoration: InputDecoration(
            labelText: widget.label,
            helperText: widget.helperText ?? 'HH:mm',
            errorText: field.errorText, // Reactive error message
            suffixIcon: IconButton(
              icon: const Icon(Icons.access_time, color: Colors.grey),
              onPressed: () async {
                // Show the built-in time picker
                final selectedTime = await showTimePicker(
                  context: context,
                  initialTime:
                  _parseTime(field.value) ?? _parseTime(widget.initialTime) ?? TimeOfDay.now(),
                );
                if (selectedTime != null) {
                  final formatted = _formatTime(selectedTime);
                  _timeController.text = formatted;
                  // Update the reactive form control
                  field.didChange(formatted);
                  widget.onChanged?.call(field.control);
                }
              },
            ),
          ),
          onChanged: (value) {
            _onChangedValue(value, field);
          },
          onSubmitted: (value) {
            _onChangedValue(value, field);
            widget.onSubmitted?.call(field.control);
          },
        );
      },
    );
  }

  /// Whenever the user changes text, validate & update the form control.
  void _onChangedValue(String value, ReactiveFormFieldState<String, String> field) {
    final formGroup = ReactiveForm.of(context) as FormGroup?;
    if (formGroup == null) return;

    // If valid, remove 'invalidTime' error. Otherwise, set it.
    if (_isValidTime(value)) {
      field.control.setErrors({});
      field.didChange(value);
      widget.onChanged?.call(field.control);
    } else {
      field.control.setErrors({'invalidTime': true});
    }
  }

  /// Checks if the given text is a valid HH:mm (24-hour) time.
  bool _isValidTime(String value) {
    // If the user hasn't typed enough digits to form HH:mm, ignore or treat as invalid.
    if (!value.contains(':') || value.length < 5) return false;

    final parts = value.split(':');
    if (parts.length != 2) return false;

    final hour = int.tryParse(parts[0]);
    final minute = int.tryParse(parts[1]);

    if (hour == null || minute == null) return false;
    if (hour < 0 || hour > 23) return false;
    if (minute < 0 || minute > 59) return false;

    return true;
  }

  /// Format a TimeOfDay to HH:mm (24-hour).
  String _formatTime(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  /// Parses a string like "HH:mm" into a TimeOfDay. Returns null if invalid.
  TimeOfDay? _parseTime(String? timeString) {
    if (timeString == null || timeString.isEmpty) return null;
    final parts = timeString.split(':');
    if (parts.length != 2) return null;

    final hour = int.tryParse(parts[0]);
    final minute = int.tryParse(parts[1]);

    if (hour == null || minute == null) return null;
    return TimeOfDay(hour: hour, minute: minute);
  }

  @override
  void dispose() {
    _timeController.dispose();
    super.dispose();
  }
}

/// A [TextInputFormatter] that automatically inserts a colon to
/// produce a `HH:mm` format as the user types or deletes characters.
///
/// Example transformations:
///  - "1" -> "1"
///  - "12" -> "12"
///  - "123" -> "12:3"
///  - "1234" -> "12:34"
///  - Backspacing from "12:3" -> "12"
class _TimeTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    // Remove any existing colon
    final digitsOnly = newValue.text.replaceAll(':', '');

    // If no digits, just return empty
    if (digitsOnly.isEmpty) {
      return newValue.copyWith(
        text: '',
        selection: const TextSelection.collapsed(offset: 0),
      );
    }

    // If user typed only 1 or 2 digits, don't insert colon yet.
    if (digitsOnly.length <= 2) {
      return newValue.copyWith(
        text: digitsOnly,
        selection: TextSelection.collapsed(offset: digitsOnly.length),
      );
    }

    // Once we have 3 or 4 digits, insert colon after the first 2.
    final hour = digitsOnly.substring(0, 2);
    final minute = digitsOnly.substring(2);

    final newText = '$hour:$minute';
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
