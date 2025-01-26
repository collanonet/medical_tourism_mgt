// Flutter imports:
import 'package:flutter/services.dart';

// Package imports:
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import '../core_utils.dart';

class InputFormatter {
  final dateFormatter = MaskTextInputFormatter(
    mask: '####/##/##',
    filter: {'#': RegExp(r'[0-9]')}, // Only allow numbers
    type: MaskAutoCompletionType.eager,
  );
  final timeFormatter = MaskTextInputFormatter(
    mask: '##:##',
    filter: {'#': RegExp(r'[0-9]')}, // Only allow numbers
    type: MaskAutoCompletionType.eager,
  );

  String maskTextDate(String text) {
    return dateFormatter.maskText(text);
  }
}

// Function to process input and apply mask
String processTimeInput(String input) {
// Remove any non-digit characters
  logger.d('input: $input');
  var text = input.replaceAll(':', '');
  logger.d('text: $text');
  // If input length is 3 digits, prepend a '0'
  if (text.length == 3) {
    text = '0$text';
  }

  // Apply the mask
  return InputFormatter().timeFormatter.maskText(text);
}

bool isValidDate(DateTime date) {
  try {
    logger.d('date: $date');
    DateTime.parse(date.toIso8601String());
    return true;
  } catch (e) {
    logger.e(e);
    return false;
  }
}

class TimeFormatValidator extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }
    final isValidFormat = RegExp(r'^\d{2}:\d{2}$').hasMatch(newValue.text);
    if (isValidFormat) {
      try {
        DateFormat('HH:mm').parseStrict(newValue.text);
        return newValue;
      } catch (e) {
        return oldValue;
      }
    } else {
      return oldValue;
    }
  }
}

class DateFormatValidator extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }
    final isValidFormat =
        RegExp(r'^\d{4}/\d{2}/\d{2}$').hasMatch(newValue.text);
    if (isValidFormat) {
      try {
        DateFormat('yyyy/MM/dd').parseStrict(newValue.text);
        return newValue;
      } catch (e) {
        return oldValue;
      }
    } else {
      return oldValue;
    }
  }
}

class CustomPhoneFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;
    if (newText.isEmpty) return newValue.copyWith(text: '+');

    // Ensure the first character is always '+'
    if (newText[0] != '+') {
      newText = '+${newText.replaceAll('+', '')}';
    }

    // Remove all non-numeric characters except the leading '+'
    newText = newText.substring(0, 1) +
        newText.substring(1).replaceAll(RegExp(r'[^0-9]'), '');

    // Apply formatting
    String formattedText = '+';
    for (int i = 1; i < newText.length && i < 14; i++) {
      if (i == 4 || i == 8) {
        formattedText += '-';
      }
      formattedText += newText[i];
    }

    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}

class CustomCurrencyFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) return newValue;

    final regex = RegExp(r'[^0-9]');
    final digits = newValue.text.replaceAll(regex, '');
    final formattedString = _format(digits);

    return TextEditingValue(
      text: formattedString,
      selection: TextSelection.collapsed(offset: formattedString.length),
    );
  }

  String _format(String digits) {
    var formattedString = '';
    for (int i = 0; i < digits.length; i++) {
      if (i % 3 == 0 && i != 0) {
        formattedString = ',$formattedString';
      }
      formattedString = digits[digits.length - 1 - i] + formattedString;
    }
    return formattedString;
  }
}

class CurrencyValueAccessor extends ControlValueAccessor<double, String> {
  @override
  String modelToViewValue(double? modelValue) {
    if (modelValue == null) return '';
    return _format(modelValue.toString());
  }

  @override
  double? viewToModelValue(String? viewValue) {
    if (viewValue == null || viewValue.isEmpty) return null;
    return double.tryParse(viewValue.replaceAll(',', ''));
  }

  String _format(String digits) {
    var formattedString = '';
    for (int i = 0; i < digits.length; i++) {
      if (i % 3 == 0 && i != 0) {
        formattedString = ',$formattedString';
      }
      formattedString = digits[digits.length - 1 - i] + formattedString;
    }
    return formattedString;
  }
}

class SingleDotInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final newText = newValue.text;
    if (newText.split('.').length > 2 ||
        !RegExp(r'^[0-9.]*$').hasMatch(newText)) {
      return oldValue;
    }
    return newValue;
  }
}
