// Package imports:
import 'package:reactive_forms/reactive_forms.dart';

FormGroup saleManagementForm() {
  return FormGroup(
    {
      'head_info': FormGroup(
        {
          'medical_expense_deposit': FormControl<int>(value: 12333),
          'paymentDay': FormControl<DateTime>(),
          'actual_cost': FormControl<int>(),
          'settlement_day': FormControl<DateTime>(),
          'actual_cost_breakdown': FormControl<String>(),
          'Refund_amount': FormControl<int>(),
        },
      ),
      'serviceFee': FormGroup(
        {
          'serviceItem': FormArray(
            [
              FormGroup(
                {
                  'item': FormControl<String>(),
                  'quantity': FormControl<int>(),
                  'unit': FormControl<String>(),
                  'unitPrice': FormControl<int>(),
                  'amountOfMoney': FormControl<int>(),
                  'cost': FormControl<int>(),
                  'profit': FormControl<int>(),
                  'invoiceNo': FormControl<int>(),
                  'paymentDocumentNo': FormControl<int>(),
                },
              ),
            ],
          ),
          'amountOfMoneyTotalSale': FormControl<int>(),
          'amountOfMoneyTotalTax': FormControl<int>(),
          'amountOfMoneyTotalAmount': FormControl<int>(),
          'costSale': FormControl<int>(),
          'costTax': FormControl<int>(),
          'costAmount': FormControl<int>(),
          'profitSale': FormControl<int>(),
          'profitTax': FormControl<int>(),
          'profitAmount': FormControl<int>(),
          'tax': FormControl<String>(),
          'taxExcluded': FormControl<String>(),
          'taxExempt': FormControl<String>(),
        },
      ),
      'expenses': FormGroup(
        {
          'majorItems': FormControl<String>(),
          'subitems': FormArray([
            FormGroup({
              'submit': FormControl<String>(),
            }),
          ]),
          'quantity': FormControl<int>(),
          'unit': FormControl<String>(),
          'unitPrice': FormControl<int>(),
          'amountOfMoney': FormControl<int>(),
          'paymentDocument': FormControl<int>(),
          'totalExpenses': FormControl<int>(),
          'totalExpensesTax': FormControl<int>(),
          'totalExpensesAmount': FormControl<int>(),
          'typeOfTax': FormControl<String>(),
        },
      ),
      'total': FormGroup(
        {
          'totalSales': FormControl<int>(),
          'totalSaleTax': FormControl<int>(),
          'totalCost': FormControl<String>(),
          'totalCostTax': FormControl<String>(),
          'grossProfit': FormControl<String>(),
          'grossProfitTax': FormControl<String>(),
          'taxIncluded': FormControl<String>(),
          'taxExcluded': FormControl<String>(),
          'taxExempt': FormControl<String>(),
          'grossProfitTax2': FormControl<String>(),
        },
      ),
    },
  );
}
