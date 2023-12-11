import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

enum CurrencySymbol {
  dollar('\$'),
  riel('៛');

  const CurrencySymbol(this.value);

  final String value;
}

enum CurrencyCode {
  khr('KHR'),
  usd('USD');

  const CurrencyCode(this.value);

  final String value;
}

class CurrencySettings with EquatableMixin {
  const CurrencySettings._({
    required this.symbol,
    required this.code,
    required this.minimumFractionDigits,
  }) : assert(minimumFractionDigits >= 0);

  final CurrencySymbol symbol;
  final CurrencyCode code;
  final int minimumFractionDigits;

  factory CurrencySettings.khmerRiel() {
    return const CurrencySettings._(
      symbol: CurrencySymbol.riel,
      code: CurrencyCode.khr,
      minimumFractionDigits: 0,
    );
  }

  factory CurrencySettings.usDollar() {
    return const CurrencySettings._(
      symbol: CurrencySymbol.dollar,
      code: CurrencyCode.usd,
      minimumFractionDigits: 2,
    );
  }

  factory CurrencySettings.fromCode(CurrencyCode code) {
    switch (code) {
      case CurrencyCode.usd:
        return CurrencySettings.usDollar();
      case CurrencyCode.khr:
        return CurrencySettings.khmerRiel();
      default:
        throw UnsupportedError('$code is not supported');
    }
  }

  @override
  List<Object?> get props => [symbol, code, minimumFractionDigits];
}

class CurrencyFormatter {
  static const String defaultLocale = 'en-US';

  final _format = NumberFormat.decimalPattern(defaultLocale);

  static const khrCurrency = 'KHR';
  static const usdCurrency = 'USD';

  static const rielSymbol = '៛';
  static const dollarSymbol = '\$';

  String format(double amount, String currency) {
    if (_isValidCurrency(currency)) {
      _format.minimumFractionDigits = currency == 'USD' ? 2 : 0;
    }
    return _format.format(amount);
  }

  bool _isValidCurrency(String currency) {
    return currency.isNotEmpty &&
        (currency == khrCurrency || currency == usdCurrency);
  }

  String _symbol(String currency) =>
      currency == usdCurrency ? dollarSymbol : rielSymbol;

  /// e.g $2.00
  String formatSymbol(double amount, String currency) {
    if (!_isValidCurrency(currency)) {
      return _format.format(amount);
    }
    return '${_symbol(currency)}${format(amount, currency)}';
  }

  /// e.g USD 2.00
  String formatLeadingCurrency(double amount, String currency) {
    if (!_isValidCurrency(currency)) {
      return _format.format(amount);
    }
    return '$currency ${format(amount, currency)}';
  }

  /// e.g 2.00 USD
  String formatTrailingCurrency(double amount, String currency) {
    if (!_isValidCurrency(currency)) {
      return _format.format(amount);
    }
    return '${format(amount, currency)} $currency';
  }

  /// Default follow formatTrailingCurrency
  String formatCurrency(double amount, String currency) =>
      formatLeadingCurrency(amount, currency);
}
