import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

class EstimateScreenForm extends StatelessWidget {
  const EstimateScreenForm({super.key});

  @override
  Widget build(BuildContext context) {
    final form = ReactiveForm.of(context) as FormGroup;

    return ColumnSeparated(
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: context.appTheme.spacing.formSpacing);
      },
      children: [
        ReactiveTextField<String>(
          formControlName: 'quotationNumber',
          decoration: InputDecoration(labelText: 'Quotation Number'),
        ),
        ReactiveTextField<DateTime>(
          formControlName: 'quotationDate',
          decoration: InputDecoration(labelText: 'Quotation Date'),
          readOnly: true,
          valueAccessor: DateTimeValueAccessor(
            dateTimeFormat: DateFormat('yyyy/MM/dd'),
          ),
          onTap: (value) async {
            final date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );
            if (date != null) {
              form.control('quotationDate').value = date;
            }
          },
        ),
        ReactiveTextField<String>(
          formControlName: 'registrationNumber',
          decoration: InputDecoration(labelText: 'Registration Number'),
        ),
        ReactiveTextField<String>(
          formControlName: 'subject',
          decoration: InputDecoration(labelText: 'Subject'),
        ),
        ReactiveTextField<double>(
          formControlName: 'totalAmount',
          decoration: InputDecoration(labelText: 'Total Amount'),
        ),
        ReactiveTextField<DateTime>(
          formControlName: 'validityPeriod',
          decoration: InputDecoration(labelText: 'Validity Period'),
          readOnly: true,
          valueAccessor: DateTimeValueAccessor(
            dateTimeFormat: DateFormat('yyyy/MM/dd'),
          ),
          onTap: (value) async {
            final date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );
            if (date != null) {
              form.control('validityPeriod').value = date;
            }
          },
        ),
        ReactiveTextField<String>(
          formControlName: 'remarks',
          decoration: InputDecoration(labelText: 'Remarks'),
        ),
        // Payment Details FormArray
        ReactiveFormArray(
          formArrayName: 'totalPayment',
          builder: (context, formArray, child) {
            return Column(
              children: [
                ...formArray.controls
                    .map((control) => control as FormGroup)
                    .map((currentForm) => ReactiveForm(
                          formGroup: currentForm,
                          child: Row(
                            children: [
                              Expanded(
                                child: ReactiveTextField<double>(
                                  formControlName: 'taxRate',
                                  decoration:
                                      InputDecoration(labelText: 'Tax Rate'),
                                ),
                              ),
                              Expanded(
                                child: ReactiveTextField<double>(
                                  formControlName: 'amountExcludingTaxInYen',
                                  decoration: InputDecoration(
                                      labelText: 'Amount Excluding Tax (Yen)'),
                                ),
                              ),
                              Expanded(
                                child: ReactiveTextField<double>(
                                  formControlName: 'consumptionTaxAmountInYen',
                                  decoration: InputDecoration(
                                      labelText:
                                          'Consumption Tax Amount (Yen)'),
                                ),
                              ),
                            ],
                          ),
                        )),
                ElevatedButton(
                  onPressed: () {
                    formArray.add(FormGroup({
                      'taxRate': FormControl<double>(),
                      'amountExcludingTaxInYen': FormControl<double>(),
                      'consumptionTaxAmountInYen': FormControl<double>(),
                    }));
                  },
                  child: Text('Add More Payment'),
                ),
              ],
            );
          },
        ),

        // Item Details FormArray
        ReactiveFormArray(
          formArrayName: 'item',
          builder: (context, formArray, child) {
            return Column(
              children: [
                ...formArray.controls
                    .map((control) => control as FormGroup)
                    .map((currentForm) => ReactiveForm(
                          formGroup: currentForm,
                          child: Row(
                            children: [
                              Expanded(
                                child: ReactiveTextField<DateTime>(
                                  formControlName: 'transactionDate',
                                  decoration: const InputDecoration(
                                      labelText: 'Transaction Date'),
                                  readOnly: true,
                                  valueAccessor: DateTimeValueAccessor(
                                    dateTimeFormat: DateFormat('yyyy/MM/dd'),
                                  ),
                                  onTap: (value) async {
                                    final date = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2100),
                                    );
                                    if (date != null) {
                                      currentForm
                                          .control('transactionDate')
                                          .value = date;
                                    }
                                  },
                                ),
                              ),
                              Expanded(
                                child: ReactiveTextField<String>(
                                  formControlName: 'details',
                                  decoration:
                                      InputDecoration(labelText: 'Details'),
                                ),
                              ),
                              Expanded(
                                child: ReactiveTextField<double>(
                                  formControlName: 'quantity',
                                  decoration:
                                      InputDecoration(labelText: 'Quantity'),
                                ),
                              ),
                              Expanded(
                                child: ReactiveTextField<String>(
                                  formControlName: 'unit',
                                  decoration:
                                      InputDecoration(labelText: 'Unit'),
                                ),
                              ),
                              Expanded(
                                child: ReactiveTextField<double>(
                                  formControlName: 'unitPrice',
                                  decoration:
                                      InputDecoration(labelText: 'Unit Price'),
                                ),
                              ),
                              Expanded(
                                child: ReactiveTextField<double>(
                                  formControlName: 'amount',
                                  decoration:
                                      InputDecoration(labelText: 'Amount'),
                                ),
                              ),
                              Expanded(
                                child: ReactiveTextField<double>(
                                  formControlName: 'taxRate',
                                  decoration:
                                      InputDecoration(labelText: 'Tax Rate'),
                                ),
                              ),
                            ],
                          ),
                        )),
                ElevatedButton(
                  onPressed: () {
                    formArray.add(FormGroup({
                      'transactionDate': FormControl<DateTime>(),
                      'details': FormControl<String>(),
                      'quantity': FormControl<double>(),
                      'unit': FormControl<String>(),
                      'unitPrice': FormControl<double>(),
                      'amount': FormControl<double>(),
                      'taxRate': FormControl<double>(),
                    }));
                  },
                  child: Text('Add More Item'),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
