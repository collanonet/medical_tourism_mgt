import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class BankAccountFormatter {
  final formatter = MaskTextInputFormatter(
    mask: '########-###-#',
    type: MaskAutoCompletionType.eager,
  );

  bool isValidLength(String input) => input.length == 14;

  bool validate(String input) {
    return isValidLength(maskText(input));
  }

  String maskText(String text) {
    return formatter.maskText(text);
  }

  String unmaskText(String text) {
    return formatter.unmaskText(text);
  }
}
