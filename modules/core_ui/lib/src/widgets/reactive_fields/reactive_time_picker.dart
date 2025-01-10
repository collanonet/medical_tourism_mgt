import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

/// A reactive form field widget that provides both manual time input and time picker functionality.
///
/// This widget combines a text input field for manual time entry with a time picker,
/// integrated into a reactive form structure. It supports time validation and formatting
/// in the HH:mm format.
///
/// Example usage:
/// ```dart
/// ReactiveTimePickerField(
///   formControlName: 'startTime',
///   label: 'Start Time',
///   helperText: 'Enter or select a start time',
/// )
/// ```
class ReactiveTimePickerField extends StatefulWidget {
  /// Creates a reactive time picker field.
  ///
  /// The [formControlName] parameter is required to bind this field to a reactive form control.
  const ReactiveTimePickerField({
    super.key,
    this.onChanged,
    this.onSubmitted,
    this.label,
    this.helperText,
    required this.formControlName,
    this.initialTime,
  });

  /// Callback function triggered when the time value changes.
  final Function(FormControl<String>)? onChanged;

  /// Callback function triggered when the field is submitted.
  final Function(FormControl<String>)? onSubmitted;

  /// The label text displayed above the input field.
  final String? label;

  /// Helper text displayed below the input field.
  final String? helperText;

  /// The name of the form control to bind this field to.
  final String formControlName;

  /// The initial time to display when the picker is shown.
  final String? initialTime;

  @override
  State<ReactiveTimePickerField> createState() =>
      _ReactiveTimePickerFieldState();
}

class _ReactiveTimePickerFieldState extends State<ReactiveTimePickerField> {
  final TextEditingController _timeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final String _timePattern = r'^\d{2}:\d{2}$';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initialize();
    });
  }

  void _initialize() {
    final formGroup = ReactiveForm.of(context) as FormGroup?;

    if (formGroup == null) return;

    final control = formGroup.control(widget.formControlName);

    final currentValue = control.value;
    if (currentValue != null) {
      _timeController.text = currentValue as String;
    }

    control.valueChanges.listen((value) {
      if (value != null) {
        _timeController.text = value as String;
      } else {
        _timeController.clear();
      }
    });

    setState(() {});
  }

  String? _validateTime(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a time';
    }

    final RegExp regex = RegExp(_timePattern);
    if (!regex.hasMatch(value)) {
      return 'Enter time in HH:mm format';
    }

    try {
      final parts = value.split(':');
      final hour = int.parse(parts[0]);
      final minute = int.parse(parts[1]);

      if (hour < 0 || hour > 23 || minute < 0 || minute > 59) {
        return 'Invalid time';
      }
    } catch (e) {
      return 'Invalid time';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveFormField<String, String>(
      formControlName: widget.formControlName,
      validationMessages: {
        'required': (control) => 'Time is required',
        'pattern': (control) => 'Invalid time format (HH:mm)',
      },
      builder: (field) {
        return Form(
          key: _formKey,
          child: TextFormField(
            controller: _timeController,
            keyboardType: TextInputType.datetime,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: _validateTime,
            onChanged: (value) => _validateAndSet(value, field),
            onFieldSubmitted: (value) => _validateAndSet(value, field),
            decoration: InputDecoration(
              labelText: widget.label,
              helperText: widget.helperText ?? '00:00',
              suffixIcon: IconButton(
                onPressed: () async {
                  final selectedTime = await showTimePicker(
                    context: context,
                    initialTime: _parseTime(widget.initialTime) ?? TimeOfDay.now(),
                  );
                  if (selectedTime != null) {
                    final formattedTime = _formatTime(selectedTime);
                    _timeController.text = formattedTime;
                    field.didChange(formattedTime);
                  }
                },
                icon: const Icon(Icons.access_time, color: Colors.grey),
              ),
            ),
          ),
        );
      },
    );
  }

  void _validateAndSet(String? value, ReactiveFormFieldState<String, String> field) {
    final formGroup = ReactiveForm.of(context) as FormGroup?;
    if (formGroup == null) return;

    if (_formKey.currentState!.validate()) {
      formGroup.control(widget.formControlName).value = value;
      field.didChange(value);
    } else {
      formGroup
          .control(widget.formControlName)
          .setErrors({'invalidTime': 'Invalid time format'});
    }
  }

  String _formatTime(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  TimeOfDay? _parseTime(String? value) {
    if (value == null || value.isEmpty) return null;
    final parts = value.split(':');
    return TimeOfDay(
      hour: int.parse(parts[0]),
      minute: int.parse(parts[1]),
    );
  }
}