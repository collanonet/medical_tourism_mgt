import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(width: context.appTheme.spacing.formSpacing);
          },
          children: [
            SizedBox(
              width: 250,
              child: ReactiveTextField<String>(
                formControlName: 'invoiceNumber',
                decoration: InputDecoration(labelText: '見積番号 :'),
              ),
            ),
            SizedBox(
              width: 250,
              child: ReactiveTextField<DateTime>(
                formControlName: 'invoiceDate',
                decoration: InputDecoration(labelText: '見積日:'),
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
                    form.control('invoiceDate').value = date;
                  }
                },
              ),
            ),
            SizedBox(
              width: 250,
              child: ReactiveTextField<String>(
                formControlName: 'contact',
                decoration: InputDecoration(labelText: '担当者:'),
              ),
            ),
            SizedBox(
              width: 250,
              child: ReactiveTextField<String>(
                formControlName: 'registrationNumber',
                decoration: InputDecoration(labelText: '登録番号:'),
              ),
            ),
          ],
        ),
        RowSeparated(
          crossAxisAlignment: CrossAxisAlignment.start,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(width: context.appTheme.spacing.formSpacing);
          },
          children: [
            SizedBox(
              width: 250,
              child: ReactiveTextField<String>(
                formControlName: 'subject',
                decoration: InputDecoration(labelText: '件名'),
              ),
            ),
            SizedBox(
              width: 250,
              child: ReactiveTextField<double>(
                formControlName: 'amountBilled',
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                decoration: InputDecoration(
                  labelText: '合計金額',
                  suffixText: '円',
                ),
              ),
            ),
            SizedBox(
              width: 250,
              child: ReactiveTextField<DateTime>(
                formControlName: 'paymentDeadline',
                decoration: InputDecoration(labelText: '有効期限	'),
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
                    form.control('paymentDeadline').value = date;
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
          decoration: const InputDecoration(labelText: '備考	'),
        ),

        RowSeparated(
          crossAxisAlignment: CrossAxisAlignment.start,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(width: context.appTheme.spacing.formSpacing);
          },
          children: const [
            SizedBox(
              width: 250,
              child: Text('税率'),
            ),
            SizedBox(
              width: 250,
              child: Text('税抜金額（円）'),
            ),
            SizedBox(
              width: 250,
              child: Text('消費税(円)'),
            ),
          ],
        ),
        ReactiveFormArray(
          formArrayName: 'totalPayment',
          builder: (context, formArray, child) {
            return ColumnSeparated(
              crossAxisAlignment: CrossAxisAlignment.start,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: context.appTheme.spacing.formSpacing);
              },
              children: [
                ...formArray.controls
                    .map((control) => control as FormGroup)
                    .map((currentForm) => ReactiveForm(
                          formGroup: currentForm,
                          child: RowSeparated(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                  width: context.appTheme.spacing.formSpacing);
                            },
                            children: [
                              SizedBox(
                                width: 250,
                                child: ReactiveTextField<double>(
                                  formControlName: 'taxRate',
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]')),
                                  ],
                                  decoration: InputDecoration(
                                    labelText: '税率',
                                    suffixText: '%',
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 250,
                                child: ReactiveTextField<double>(
                                  formControlName: 'amountExcludingTaxInYen',
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]')),
                                  ],
                                  decoration: InputDecoration(
                                    labelText: '税抜金額（円）',
                                    suffixText: '円',
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 250,
                                child: ReactiveTextField<double>(
                                  formControlName: 'consumptionTaxAmountInYen',
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]')),
                                  ],
                                  decoration: InputDecoration(
                                    labelText: '消費税(円)',
                                    suffixText: '円',
                                  ),
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
                  child: Text('行を追加'),
                ),
              ],
            );
          },
        ),
        // header
        RowSeparated(
          crossAxisAlignment: CrossAxisAlignment.start,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(width: context.appTheme.spacing.formSpacing);
          },
          children: [
            SizedBox(
              width: 150,
              child: Text('取引日'),
            ),
            SizedBox(
              width: 300,
              child: Text('内訳'),
            ),
            SizedBox(
              width: 80,
              child: Text('数量'),
            ),
            SizedBox(
              width: 80,
              child: Text('单位'),
            ),
            SizedBox(
              width: 120,
              child: Text('単価'),
            ),
            SizedBox(
              width: 120,
              child: Text('金額'),
            ),
            SizedBox(
              width: 80,
              child: Text('税率'),
            ),
          ],
        ),
        ReactiveFormArray(
          formArrayName: 'item',
          builder: (context, formArray, child) {
            return ColumnSeparated(
              crossAxisAlignment: CrossAxisAlignment.start,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: context.appTheme.spacing.formSpacing);
              },
              children: [
                ...formArray.controls
                    .map((control) => control as FormGroup)
                    .map((currentForm) => ReactiveForm(
                          formGroup: currentForm,
                          child: RowSeparated(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                  width: context.appTheme.spacing.formSpacing);
                            },
                            children: [
                              SizedBox(
                                width: 150,
                                child: ReactiveTextField<DateTime>(
                                  formControlName: 'transactionDate',
                                  decoration:
                                      const InputDecoration(labelText: '取引日'),
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
                              SizedBox(
                                width: 300,
                                child: ReactiveTextField<String>(
                                  formControlName: 'details',
                                  decoration: InputDecoration(labelText: '内訳'),
                                ),
                              ),
                              SizedBox(
                                width: 80,
                                child: ReactiveTextField<double>(
                                  formControlName: 'quantity',
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]')),
                                  ],
                                  decoration: InputDecoration(labelText: '数量'),
                                ),
                              ),
                              SizedBox(
                                width: 80,
                                child: ReactiveTextField<String>(
                                  formControlName: 'unit',
                                  decoration: InputDecoration(labelText: '单位'),
                                ),
                              ),
                              SizedBox(
                                width: 120,
                                child: ReactiveTextField<double>(
                                  formControlName: 'unitPrice',
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]')),
                                  ],
                                  decoration: InputDecoration(
                                    labelText: '単価',
                                    suffixText: '円',
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 120,
                                child: ReactiveTextField<double>(
                                  formControlName: 'amount',
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]')),
                                  ],
                                  decoration: InputDecoration(
                                    labelText: '金額',
                                    suffixText: '円',
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 80,
                                child: ReactiveTextField<double>(
                                  formControlName: 'taxRate',
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]')),
                                  ],
                                  decoration: InputDecoration(
                                    labelText: '税率',
                                    suffixText: '%',
                                  ),
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
                  child: Text('行を追加'),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
