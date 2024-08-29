// Package imports:
import 'package:reactive_forms/reactive_forms.dart';

FormGroup saleManagementForm() {
  return FormGroup({
    'head_info': FormGroup({
      'medical_expense_deposit': FormControl<int>(value: 12333),
      'paymentDay': FormControl<DateTime>(),
      'actual_cost': FormControl<int>(),
      'settlement_day': FormControl<DateTime>(),
      'actual_cost_breakdown': FormControl<String>(),
      'Refund_amount': FormControl<int>(),
    }),
    'service_fee': FormGroup({
      'service_item': FormArray([
        FormGroup(
          {
            'item': FormControl<String>(),
            'quantity': FormControl<int>(),
            'unit': FormControl<String>(),
            'unit_price': FormControl<int>(),
            'amount_of_money': FormControl<int>(),
            'cost': FormControl<int>(),
            'profit': FormControl<int>(),
            'invoice_no': FormControl<int>(),
            'payment_document_no': FormControl<int>(),
          },
        ),
      ]),
      'amount_of_money_total_sale': FormControl<int>(),
      'amount_of_money_total_tax': FormControl<int>(),
      'amount_of_money_total_amount': FormControl<int>(),
      'cost_sale': FormControl<int>(),
      'cost_tax': FormControl<int>(),
      'cost_amount': FormControl<int>(),
      'profit_sale': FormControl<int>(),
      'profit_tax': FormControl<int>(),
      'profit_amount': FormControl<int>(),
      'tax': FormControl<String>(),
      'tax_excluded': FormControl<String>(),
      'tax_exempt': FormControl<String>(),
    }),
    'expenses': FormGroup({
      'major_items': FormControl<String>(),
      'subitems': FormArray([
        FormGroup({
          'submit': FormControl<String>(),
        }),
      ]),
      'quantity': FormControl<int>(),
      'unit': FormControl<String>(),
      'unit_price': FormControl<int>(),
      'amount_of_money': FormControl<int>(),
      'payment_document': FormControl<int>(),
      'total_expenses': FormControl<int>(),
      'total_expenses_tax': FormControl<int>(),
      'total_expenses_amount': FormControl<int>(),
      'type_of_tax': FormControl<String>(),
    }),
    'total': FormGroup({
      'total_sales': FormControl<int>(),
      'total_sale_tax': FormControl<int>(),
      'total_cost': FormControl<String>(),
      'total_cost_tax': FormControl<String>(),
      'gross_profit': FormControl<String>(),
      'gross_profit_tax': FormControl<String>(),
      'tax_included': FormControl<String>(),
      'tax_excluded': FormControl<String>(),
      'tax_exempt': FormControl<String>(),
      'gross_profit_tax2': FormControl<String>(),
    }),
  });
}
