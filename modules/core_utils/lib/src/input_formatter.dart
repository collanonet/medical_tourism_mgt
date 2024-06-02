import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../core_utils.dart';

class InputFormatter {
  final dateFormatter = MaskTextInputFormatter(
    mask: '####/##/##',
    type: MaskAutoCompletionType.eager,
  );
  final timeFormatter = MaskTextInputFormatter(
    mask: '##:##',
    type: MaskAutoCompletionType.eager,
  );

  String maskTextDate(String text) {
    return dateFormatter.maskText(text);
  }
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

class DateFormatValidator extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }
    final isValidFormat = RegExp(r'^\d{4}/\d{2}/\d{2}$').hasMatch(newValue.text);
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
