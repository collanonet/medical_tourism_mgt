import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

class StatementScreenForm extends StatelessWidget {
  const StatementScreenForm({super.key});

  @override
  Widget build(BuildContext context) {
    final form = ReactiveForm.of(context) as FormGroup;

    return ColumnSeparated(
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: context.appTheme.spacing.formSpacing);
      },
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(' 求 書', style: context.textTheme.titleLarge),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('柳在順　様', style: context.textTheme.titleMedium),
          ],
        ),
        RowSeparated(
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(width: context.appTheme.spacing.formSpacing);
          },
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('請求書番号'),
                const SizedBox(width: 38),
                IntrinsicWidth(
                  stepWidth: 250,
                  child: ReactiveTextField<String>(
                    formControlName: 'invoiceNumber',
                    // decoration: InputDecoration(labelText: 'Invoice Number'),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('請求日'),
                const SizedBox(width: 38),
                IntrinsicWidth(
                  stepWidth: 250,
                  child: ReactiveDatePicker<DateTime>(
                    formControlName: 'paymentDeadline',
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    builder: (BuildContext context,
                        ReactiveDatePickerDelegate<dynamic> picker,
                        Widget? child) {
                      return Stack(
                        children: [
                          ReactiveTextField<DateTime>(
                            formControlName: 'invoiceDate',
                            readOnly: true,
                            onTap: (value) async {
                              final date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                              );
                              if (date != null) {
                                form.control('invoiceDate').value = date;
                              }
                            },
                            valueAccessor: DateTimeValueAccessor(
                              dateTimeFormat: DateFormat('yyyy/MM/dd'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                onPressed: () => picker.showPicker(),
                                icon: Icon(
                                  Icons.calendar_month,
                                  color: context.appTheme.disableButtonColor,
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        RowSeparated(
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(width: context.appTheme.spacing.formSpacing);
          },
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('件名'),
                const SizedBox(width: 38),
                IntrinsicWidth(
                  stepWidth: 250,
                  child: ReactiveTextField<String>(
                    formControlName: 'subject',
                    // decoration: InputDecoration(labelText: 'Subject'),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('登録番号'),
                IntrinsicWidth(
                  stepWidth: 250,
                  child: ReactiveTextField<String>(
                    formControlName: 'registrationNumber',
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('担当者'),
                IntrinsicWidth(
                  stepWidth: 250,
                  child: ReactiveTextField<String>(
                    formControlName: 'contact',
                  ),
                )
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ご請求額'),
            IntrinsicWidth(
              stepWidth: 250,
              child: ReactiveTextField<double>(
                formControlName: 'amountBilled',
                // decoration: InputDecoration(labelText: 'Amount Billed'),
              ),
            )
          ],
        ),
        Text('税率毎合計', style: context.textTheme.titleMedium),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(255, 23, 189, 222)),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(10),
          child: ColumnSeparated(
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: context.appTheme.spacing.formSpacing);
            },
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  SizedBox(width: 200),
                  Expanded(
                    child: Text('税率'),
                  ),
                  Expanded(
                    child: Text('税抜金額（円）'),
                  ),
                  Expanded(
                    child: Text('消費税額（円）'),
                  ),
                ],
              ),
              // Payment Details FormArray
              ReactiveFormArray(
                formArrayName: 'totalPayment',
                builder: (context, formArray, child) {
                  return ColumnSeparated(
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                          height: context.appTheme.spacing.formSpacing);
                    },
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...formArray.controls
                          .map((control) => control as FormGroup)
                          .map(
                            (currentForm) => ReactiveForm(
                              formGroup: currentForm,
                              child: RowSeparated(
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(
                                      width:
                                          context.appTheme.spacing.formSpacing);
                                },
                                children: [
                                  Expanded(
                                    child: ReactiveTextField<double>(
                                      formControlName: 'taxRate',
                                      decoration: const InputDecoration(
                                          labelText: 'Tax Rate'),
                                    ),
                                  ),
                                  Expanded(
                                    child: ReactiveTextField<double>(
                                      formControlName:
                                          'amountExcludingTaxInYen',
                                      decoration: const InputDecoration(
                                          labelText:
                                              'Amount Excluding Tax (Yen)'),
                                    ),
                                  ),
                                  Expanded(
                                    child: ReactiveTextField<double>(
                                      formControlName:
                                          'consumptionTaxAmountInYen',
                                      decoration: const InputDecoration(
                                          labelText:
                                              'Consumption Tax Amount (Yen)'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      IntrinsicWidth(
                        child: InkWell(
                          onTap: () {
                            formArray.add(FormGroup({
                              'taxRate': FormControl<double>(),
                              'amountExcludingTaxInYen': FormControl<double>(),
                              'consumptionTaxAmountInYen':
                                  FormControl<double>(),
                            }));
                          },
                          child: Row(
                            children: [
                              Icon(Icons.add_circle_outline,
                                  color: context.appTheme.primaryColor),
                              Text('Add More Payment',
                                  style: TextStyle(
                                      color: context.appTheme.primaryColor)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('支払期限'),
            IntrinsicWidth(
              stepWidth: 250,
              child: ReactiveDatePicker<DateTime>(
                formControlName: 'paymentDeadline',
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                builder: (BuildContext context,
                    ReactiveDatePickerDelegate<dynamic> picker, Widget? child) {
                  return Stack(
                    children: [
                      ReactiveTextField<DateTime>(
                        formControlName: 'paymentDeadline',
                        readOnly: true,
                        onTap: (value) async {
                          final date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                          );
                          if (date != null) {
                            form.control('paymentDeadline').value = date;
                          }
                        },
                        valueAccessor: DateTimeValueAccessor(
                          dateTimeFormat: DateFormat('yyyy/MM/dd'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            onPressed: () => picker.showPicker(),
                            icon: Icon(
                              Icons.calendar_month,
                              color: context.appTheme.disableButtonColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('お振込先'),
            IntrinsicWidth(
              stepWidth: 250,
              child: ReactiveTextField(
                formControlName: 'bankTransferInformation',
                // decoration:
                //     InputDecoration(labelText: 'Bank Transfer Information'),
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('備考'),
            IntrinsicWidth(
              stepWidth: 250,
              child: ReactiveTextField<String>(
                formControlName: 'remarks',
                // decoration: InputDecoration(labelText: 'Remarks'),
              ),
            )
          ],
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: Color.fromARGB(255, 52, 194, 222).withOpacity(0.5)),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(10),
          child: ColumnSeparated(
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: context.appTheme.spacing.formSpacing);
            },
            children: [
              const Row(
                children: [
                  SizedBox(width: 80),
                  Expanded(
                    child: Text('取引日'),
                  ),
                  Expanded(
                    child: Text('内訳'),
                  ),
                  Expanded(
                    child: Text('数量'),
                  ),
                  Expanded(
                    child: Text('単位'),
                  ),
                  Expanded(
                    child: Text('単価'),
                  ),
                  Expanded(
                    child: Text('金額'),
                  ),
                  Expanded(
                    child: Text('税率'),
                  ),
                ],
              ),
              // Item Details FormArray
              ReactiveFormArray(
                formArrayName: 'item',
                builder: (context, formArray, child) {
                  return ColumnSeparated(
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                          height: context.appTheme.spacing.formSpacing);
                    },
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
                                        width: context
                                            .appTheme.spacing.formSpacing);
                                  },
                                  children: [
                                    Text(
                                        '${formArray.controls.indexOf(currentForm) + 1}'),
                                    Expanded(
                                      child: ReactiveDatePicker<DateTime>(
                                        formControlName: 'transactionDate',
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2100),
                                        builder: (BuildContext context,
                                            ReactiveDatePickerDelegate<dynamic>
                                                picker,
                                            Widget? child) {
                                          return Stack(
                                            children: [
                                              ReactiveTextField<DateTime>(
                                                formControlName:
                                                    'transactionDate',
                                                readOnly: true,
                                                onTap: (value) async {
                                                  final date =
                                                      await showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(2000),
                                                    lastDate: DateTime(2100),
                                                  );
                                                  if (date != null) {
                                                    form
                                                        .control(
                                                            'transactionDate')
                                                        .value = date;
                                                  }
                                                },
                                                valueAccessor:
                                                    DateTimeValueAccessor(
                                                  dateTimeFormat:
                                                      DateFormat('yyyy/MM/dd'),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 6),
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: IconButton(
                                                    onPressed: () =>
                                                        picker.showPicker(),
                                                    icon: Icon(
                                                      Icons.calendar_month,
                                                      color: context.appTheme
                                                          .disableButtonColor,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: ReactiveTextField<String>(
                                        formControlName: 'details',
                                        decoration: InputDecoration(
                                            labelText: 'Details'),
                                      ),
                                    ),
                                    Expanded(
                                      child: ReactiveTextField<double>(
                                        formControlName: 'quantity',
                                        decoration: InputDecoration(
                                            labelText: 'Quantity'),
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
                                        decoration: InputDecoration(
                                            labelText: 'Unit Price'),
                                      ),
                                    ),
                                    Expanded(
                                      child: ReactiveTextField<double>(
                                        formControlName: 'amount',
                                        decoration: InputDecoration(
                                            labelText: 'Amount'),
                                      ),
                                    ),
                                    Expanded(
                                      child: ReactiveTextField<double>(
                                        formControlName: 'taxRate',
                                        decoration: InputDecoration(
                                            labelText: 'Tax Rate'),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                      IntrinsicWidth(
                        child: InkWell(
                          onTap: () {
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
                          child: Row(
                            children: [
                              Icon(Icons.add_circle_outline,
                                  color: context.appTheme.primaryColor),
                              Text('Add More Payment',
                                  style: TextStyle(
                                      color: context.appTheme.primaryColor)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
