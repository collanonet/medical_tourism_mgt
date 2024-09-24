import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

class EstimateScreenForm extends StatelessWidget {
  const EstimateScreenForm({super.key});

  @override
  Widget build(BuildContext context) {
    final form = ReactiveForm.of(context) as FormGroup;

    return ColumnSeparated(
      crossAxisAlignment: CrossAxisAlignment.start,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: context.appTheme.spacing.formSpacing);
      },
      children: [
        RowSeparated(
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(width: context.appTheme.spacing.formSpacing);
          },
          children: [
            IntrinsicWidth(
              stepWidth: 250,
              child: ReactiveTextField<String>(
                formControlName: 'quotationNumber',
                decoration: InputDecoration(labelText: 'Quotation Number'),
              ),
            ),
            IntrinsicWidth(
              stepWidth: 250,
              child: ReactiveTextField<DateTime>(
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
            ),
            IntrinsicWidth(
              stepWidth: 250,
              child: ReactiveTextField<String>(
                formControlName: 'registrationNumber',
                decoration: InputDecoration(labelText: 'Registration Number'),
              ),
            ),
          ],
        ),
        RowSeparated(
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(width: context.appTheme.spacing.formSpacing);
          },
          children: [
            IntrinsicWidth(
              stepWidth: 250,
              child: ReactiveTextField<String>(
                formControlName: 'subject',
                decoration: InputDecoration(labelText: 'Subject'),
              ),
            ),
            IntrinsicWidth(
              stepWidth: 250,
              child: ReactiveTextField<double>(
                formControlName: 'totalAmount',
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                decoration: InputDecoration(labelText: 'Total Amount'),
              ),
            ),
            IntrinsicWidth(
              stepWidth: 250,
              child: ReactiveTextField<DateTime>(
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
            ),
          ],
        ),
        ReactiveTextField<String>(
          formControlName: 'remarks',
          minLines: 1,
          maxLines: 3,
          decoration: InputDecoration(labelText: 'Remarks'),
        ),
        // Payment Details FormArray
        Text('Payment Details'),
        ReactiveFormArray(
          formArrayName: 'totalPayment',
          builder: (context, formArray, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...formArray.controls
                    .map((control) => control as FormGroup)
                    .map((currentForm) => ReactiveForm(
                          formGroup: currentForm,
                          child: RowSeparated(
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                  width: context.appTheme.spacing.formSpacing);
                            },
                            children: [
                              IntrinsicWidth(
                                stepWidth: 250,
                                child: ReactiveTextField<double>(
                                  formControlName: 'taxRate',
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]')),
                                  ],
                                  decoration:
                                      InputDecoration(labelText: 'Tax Rate'),
                                ),
                              ),
                              IntrinsicWidth(
                                stepWidth: 250,
                                child: ReactiveTextField<double>(
                                  formControlName: 'amountExcludingTaxInYen',
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]')),
                                  ],
                                  decoration: InputDecoration(
                                      labelText: 'Amount Excluding Tax (Yen)'),
                                ),
                              ),
                              IntrinsicWidth(
                                stepWidth: 250,
                                child: ReactiveTextField<double>(
                                  formControlName: 'consumptionTaxAmountInYen',
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]')),
                                  ],
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
                      'taxRate': FormControl<double>(
                        validators: [
                          Validators.number,
                        ],
                      ),
                      'amountExcludingTaxInYen': FormControl<double>(
                        validators: [
                          Validators.number,
                        ],
                      ),
                      'consumptionTaxAmountInYen': FormControl<double>(
                        validators: [
                          Validators.number,
                        ],
                      ),
                    }));
                  },
                  child: Text('Add More Payment'),
                ),
              ],
            );
          },
        ),

        // Item Details FormArray
        Text('Item Details'),
        ReactiveFormArray(
          formArrayName: 'item',
          builder: (context, formArray, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...formArray.controls
                    .map((control) => control as FormGroup)
                    .map((currentForm) => ReactiveForm(
                          formGroup: currentForm,
                          child: RowSeparated(
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                  width: context.appTheme.spacing.formSpacing);
                            },
                            children: [
                              IntrinsicWidth(
                                stepWidth: 250,
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
                              IntrinsicWidth(
                                stepWidth: 250,
                                child: ReactiveTextField<String>(
                                  formControlName: 'details',
                                  decoration:
                                      InputDecoration(labelText: 'Details'),
                                ),
                              ),
                              IntrinsicWidth(
                                stepWidth: 250,
                                child: ReactiveTextField<double>(
                                  formControlName: 'quantity',
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]')),
                                  ],
                                  decoration:
                                      InputDecoration(labelText: 'Quantity'),
                                ),
                              ),
                              IntrinsicWidth(
                                stepWidth: 250,
                                child: ReactiveTextField<String>(
                                  formControlName: 'unit',
                                  decoration:
                                      InputDecoration(labelText: 'Unit'),
                                ),
                              ),
                              IntrinsicWidth(
                                stepWidth: 250,
                                child: ReactiveTextField<double>(
                                  formControlName: 'unitPrice',
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]')),
                                  ],
                                  decoration:
                                      InputDecoration(labelText: 'Unit Price'),
                                ),
                              ),
                              IntrinsicWidth(
                                stepWidth: 250,
                                child: ReactiveTextField<double>(
                                  formControlName: 'amount',
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]')),
                                  ],
                                  decoration:
                                      InputDecoration(labelText: 'Amount'),
                                ),
                              ),
                              IntrinsicWidth(
                                stepWidth: 250,
                                child: ReactiveTextField<double>(
                                  formControlName: 'taxRate',
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]')),
                                  ],
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
                      'transactionDate': FormControl<DateTime>(
                        value: DateTime.now(),
                      ),
                      'details': FormControl<String>(),
                      'quantity': FormControl<double>(
                        validators: [
                          Validators.number,
                        ],
                      ),
                      'unit': FormControl<String>(),
                      'unitPrice': FormControl<double>(
                        validators: [
                          Validators.number,
                        ],
                      ),
                      'amount': FormControl<double>(
                        validators: [
                          Validators.number,
                        ],
                      ),
                      'taxRate': FormControl<double>(
                        validators: [
                          Validators.number,
                        ],
                      ),
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
