// Flutter imports:
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:equatable/equatable.dart';

// Project imports:
import 'currency_formatter.dart';

final formatter = CurrencyFormatter();

class AmountEditingValue with EquatableMixin {
  const AmountEditingValue({
    required this.amount,
    required this.currency,
  });

  final String amount;
  final CurrencySettings currency;

  String get text {
    return formatter.formatSymbol(
      double.tryParse(amount) ?? 0,
      currency.code.value,
    );
  }

  AmountEditingValue copyWith({
    String? amount,
    CurrencySettings? currency,
  }) {
    return AmountEditingValue(
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
    );
  }

  @override
  List<Object?> get props => [amount, currency];
}

class AmountEditingController extends ValueNotifier<AmountEditingValue> {
  AmountEditingController(super._value);

  void append(String input) {
    //Avoid adding fraction point in the adding text function
    if (input == '.') {
      fraction();
      return;
    }

    String amount = value.amount;
    if (amount == '0') {
      amount = input;
    } else {
      amount = amount + input;
    }

    value = value.copyWith(amount: amount);
  }

  void backspace() {
    String amount = value.amount;

    if (amount.isNotEmpty) {
      amount = amount.substring(0, amount.length - 1);
      if (amount.endsWith('.')) {
        amount = amount.substring(0, amount.length - 1);
      }
    }

    if (amount.isEmpty) amount = '0';

    value = value.copyWith(amount: amount);
  }

  void fraction() {
    if (value.currency.minimumFractionDigits == 0) return;
    if (value.amount.contains('.')) return;

    value = value.copyWith(amount: '${value.amount}.');
  }

  void setCurrency(CurrencyCode code) {
    value = value.copyWith(currency: CurrencySettings.fromCode(code));
  }
}
