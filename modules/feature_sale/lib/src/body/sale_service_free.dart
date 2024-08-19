import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../sale_model.dart';

class SaleServiceFree extends StatelessWidget {
  const SaleServiceFree({super.key});

  @override
  Widget build(BuildContext context) {
    final form = ReactiveForm.of(context) as FormGroup;
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(255, 14, 158, 194), width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10),
      child: ColumnSeparated(
        separatorBuilder: (context, index) {
          return SizedBox(
            height: context.appTheme.spacing.marginMedium,
          );
        },
        children: [
          const SizedBox(height: 16),
          Row(
            children: [
              const SizedBox(
                width: 120,
              ),
              Expanded(child: Text('項目')),
              SizedBox(
                width: context.appTheme.spacing.marginLarge,
              ),
              Expanded(child: Text('数量')),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              Expanded(child: Text('単位')),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              Expanded(child: Text('単価')),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              Expanded(child: Text('金額')),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              Expanded(child: Text('原価')),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              Expanded(child: Text('利益')),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              Expanded(child: Text('請求書No.')),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              Expanded(child: Text('支払書類No.')),
            ],
          ),
          ReactiveForm(
            formGroup: form.control('service_fee') as FormGroup,
            child: Column(
              children: [
                ReactiveFormArray(
                  formArrayName: 'service_item',
                  builder: (context, formArray, child) {
                    final rows = formArray.controls
                        .map((control) => control as FormGroup)
                        .map((currentForm) {
                      return ReactiveForm(
                        formGroup: currentForm,
                        child: RowSeparated(
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: context.appTheme.spacing.marginMedium,
                            );
                          },
                          children: [
                            Text(
                                '${formArray.controls.indexOf(currentForm) + 1}'),
                            Expanded(
                              child: ValueListenableBuilder(
                                  valueListenable:
                                      context.read<SaleModel>().itemData,
                                  builder: (context, value, _) {
                                    return ReactiveDropdownFormField(
                                      formControlName: 'item',
                                      items: value
                                          .map((e) => DropdownMenuItem(
                                                value: e.item,
                                                child: Text(
                                                  e.item,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ))
                                          .toList(),
                                    );
                                  }),
                            ),
                            IntrinsicWidth(
                              stepWidth: 30,
                              child: ReactiveTextField(
                                formControlName: 'quantity',
                              ),
                            ),
                            IntrinsicWidth(
                              stepWidth: 80,
                              child: ValueListenableBuilder(
                                  valueListenable:
                                      context.read<SaleModel>().unitData,
                                  builder: (context, value, _) {
                                    return ReactiveDropdownFormField(
                                      formControlName: 'unit',
                                      items: value
                                          .map((e) => DropdownMenuItem(
                                                value: e.item,
                                                child: Text(
                                                  e.item,
                                                ),
                                              ))
                                          .toList(),
                                    );
                                  }),
                            ),
                            IntrinsicWidth(
                              stepWidth: 120,
                              child: ReactiveTextField(
                                formControlName: 'unit_price',
                              ),
                            ),
                            IntrinsicWidth(
                              stepWidth: 120,
                              child: ReactiveTextField(
                                formControlName: 'amount_of_money',
                              ),
                            ),
                            IntrinsicWidth(
                              stepWidth: 120,
                              child: ReactiveTextField(
                                formControlName: 'cost',
                              ),
                            ),
                            IntrinsicWidth(
                              stepWidth: 120,
                              child: ReactiveTextField(
                                formControlName: 'profit',
                              ),
                            ),
                            IntrinsicWidth(
                              stepWidth: 120,
                              child: ReactiveTextField(
                                formControlName: 'invoice_no',
                              ),
                            ),
                            IntrinsicWidth(
                              stepWidth: 120,
                              child: ReactiveTextField(
                                formControlName: 'payment_document_no',
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList();
                    return Column(
                      children: [
                        ColumnSeparated(
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            );
                          },
                          children: rows,
                        ),
                        const SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            formArray.add(
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
                            );
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.add_box_rounded,
                                color: context.appTheme.primaryColor,
                              ),
                              Text(
                                '行を追加',
                                style: TextStyle(
                                    color: context.appTheme.primaryColor),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ColumnSeparated(
                      separatorBuilder: (context, index) => SizedBox(
                        height: context.appTheme.spacing.marginMedium,
                      ),
                      children: [
                        RowSeparated(
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: context.appTheme.spacing.marginMedium,
                            );
                          },
                          children: const [
                            SizedBox(width: 210),
                            Text('金額'),
                            SizedBox(width: 70),
                            Text('原価'),
                            SizedBox(width: 70),
                            Text('利益'),
                          ],
                        ),
                        RowSeparated(
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: context.appTheme.spacing.marginMedium,
                            );
                          },
                          children: [
                            //amount_of_money
                            boxStyleDis(context, '消費税（10%）', '165,530'),
                            IntrinsicWidth(
                              stepWidth: 120,
                              child: ReactiveTextField(
                                formControlName: 'cost_sale',
                              ),
                            ),
                            IntrinsicWidth(
                              stepWidth: 120,
                              child: ReactiveTextField(
                                formControlName: 'profit_sale',
                              ),
                            )
                          ],
                        ),
                        RowSeparated(
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: context.appTheme.spacing.marginMedium,
                            );
                          },
                          children: [
                            //amount_of_money
                            boxStyleDis(context, '消費税（10%）', '165,530'),
                            IntrinsicWidth(
                              stepWidth: 120,
                              child: ReactiveTextField(
                                formControlName: 'cost_tax',
                              ),
                            ),
                            IntrinsicWidth(
                              stepWidth: 120,
                              child: ReactiveTextField(
                                formControlName: 'profit_tax',
                              ),
                            )
                          ],
                        ),
                        RowSeparated(
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: context.appTheme.spacing.marginMedium,
                            );
                          },
                          children: [
                            const SizedBox(width: 200),
                            IntrinsicWidth(
                              stepWidth: 30,
                              child: ValueListenableBuilder(
                                  valueListenable:
                                      context.read<SaleModel>().taxData,
                                  builder: (context, value, _) {
                                    return ReactiveDropdownFormField(
                                      formControlName: 'tax',
                                      items: value
                                          .map((e) => DropdownMenuItem(
                                                value: e.tax,
                                                child: Text(
                                                  e.tax,
                                                ),
                                              ))
                                          .toList(),
                                    );
                                  }),
                            ),
                            IntrinsicWidth(
                              stepWidth: 30,
                              child: ValueListenableBuilder(
                                  valueListenable:
                                      context.read<SaleModel>().taxData,
                                  builder: (context, value, _) {
                                    return ReactiveDropdownFormField(
                                      formControlName: 'tax_excluded',
                                      items: value
                                          .map((e) => DropdownMenuItem(
                                                value: e.tax,
                                                child: Text(
                                                  e.tax,
                                                ),
                                              ))
                                          .toList(),
                                    );
                                  }),
                            ),
                            IntrinsicWidth(
                              stepWidth: 30,
                              child: ValueListenableBuilder(
                                  valueListenable:
                                      context.read<SaleModel>().taxData,
                                  builder: (context, value, _) {
                                    return ReactiveDropdownFormField(
                                      formControlName: 'tax_exempt',
                                      items: value
                                          .map((e) => DropdownMenuItem(
                                                value: e.tax,
                                                child: Text(
                                                  e.tax,
                                                ),
                                              ))
                                          .toList(),
                                    );
                                  }),
                            ),
                          ],
                        ),
                        RowSeparated(
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: context.appTheme.spacing.marginMedium,
                            );
                          },
                          children: [
                            //amount_of_money
                            boxStyleDis(context, '合計金額', '165,530'),
                            IntrinsicWidth(
                              stepWidth: 120,
                              child: ReactiveTextField(
                                formControlName: 'cost_amount',
                              ),
                            ),
                            IntrinsicWidth(
                              stepWidth: 120,
                              child: ReactiveTextField(
                                formControlName: 'profit_amount',
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget boxStyleDis(BuildContext context, String title, String travelling) {
    return Container(
      width: 330,
      height: 45,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          const SizedBox(width: 30),
          Text(title, style: context.textTheme.titleMedium),
          const SizedBox(width: 30),
          const Text('|'),
          const SizedBox(width: 30),
          Text(travelling, style: context.textTheme.titleMedium),
        ],
      ),
    );
  }
}
