import 'package:reactive_forms/reactive_forms.dart';

FormGroup saleManagementForm() {
  return FormGroup({
    'medical_expense_deposit': FormControl<int>(),
    'payment_day': FormControl<DateTime>(),
    'actual_cost': FormControl<int>(),
    'settlement_day': FormControl<DateTime>(),
    'actual_cost_breakdown': FormControl<String>(),
    'Refund_amount': FormControl<int>(),
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
      'amount_of_money' : FormControl<int>(),
      'cost' : FormControl<int>(),
      'profit' : FormControl<int>(),
      'tax' : FormControl<String>(),
    }),
    'expenses' : FormGroup({
      'major_items' : FormControl<String>()
    }),
    'total' : FormGroup({
      'total_sales' : FormControl<int>(),
      'total_cost' : FormControl<String>(),
      'gross_profit' : FormControl<String>(),
    }),
  });

}
