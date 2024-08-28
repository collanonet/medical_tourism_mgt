// Project imports:
import '../core_utils.dart';

class InputAmountController {
  final zero = '0';

  final CurrencyFormatter _formatter = CurrencyFormatter();

  String _currentAmount = '0';

  String get currentAmount => _currentAmount;

  String _displayAmount = '';

  String get displayAmount => _displayAmount;

  String _defaultCurrency = 'USD';

  set defaultCurrency(String currency) {
    _defaultCurrency = currency;
    _display(_currentAmount);
  }

  void add(String input) {
    //Avoid adding fraction point in the adding text function
    if (input == '.') {
      fraction();
      return;
    }

    var amountStr = _currentAmount;
    if (_currentAmount == zero) {
      amountStr = input;
    } else {
      amountStr = amountStr + input;
    }
    _display(amountStr);
  }

  void delete() {
    var amountStr = _currentAmount;
    if (amountStr.isNotEmpty) {
      amountStr = amountStr.substring(0, amountStr.length - 1);
      if (amountStr.endsWith('.')) {
        amountStr = amountStr.substring(0, amountStr.length - 1);
      }
    }
    if (amountStr.isEmpty) {
      amountStr = zero;
    }
    _display(amountStr);
  }

  void fraction() {
    if (_defaultCurrency == 'KHR') {
      return;
    }
    var amountStr = _currentAmount;
    if (amountStr.contains('.')) {
      return;
    }
    amountStr = '$amountStr.';
    _display(amountStr);
  }

  bool get hasFractionZero => (double.parse(_currentAmount) % 1) == 0;

  _display(String amountStr) {
    _currentAmount = amountStr;
    _displayAmount = _formatter.formatSymbol(
      double.parse(amountStr),
      _defaultCurrency,
    );
  }
}
