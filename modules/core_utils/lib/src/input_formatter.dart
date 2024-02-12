import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InputFormatter {
  final dateFormatter = MaskTextInputFormatter(
    mask: '####/##/##',
    type: MaskAutoCompletionType.eager,
  );

  String maskTextDate(String text) {
    return dateFormatter.maskText(text);
  }
}

bool isValidDate(DateTime date) {
  try {
    DateTime.parse(date.toIso8601String());
    return true;
  } catch (e) {
    return false;
  }
}