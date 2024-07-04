import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../sale_model.dart';

class SaleExpenses extends StatelessWidget {
  const SaleExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    final form = ReactiveForm.of(context) as FormGroup;
    var formArrays;
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(255, 14, 158, 194), width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10),
      child: ReactiveForm(
        formGroup: form.control('expenses') as FormGroup,
        child: ColumnSeparated(
          separatorBuilder: (context, index) => SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 120,
                ),
                Expanded(child: Text('大項目')),
                SizedBox(
                  width: 160,
                ),
                Expanded(child: Text('小項目')),
                SizedBox(
                  width: 120,
                ),
                Expanded(child: Text('数量')),
                SizedBox(
                  width: context.appTheme.spacing.marginMedium,
                ),
                Expanded(child: Text('単位')),
                Expanded(child: Text('単価')),
                Expanded(child: Text('金額')),
                Expanded(child: Text('支払書類No.')),
                SizedBox(
                  width: context.appTheme.spacing.marginMedium,
                ),
              ],
            ),
            ColumnSeparated(
              separatorBuilder: (context, index) => SizedBox(
                height: context.appTheme.spacing.marginMedium,
              ),
              children: List.generate(
                10,
                (index) {
                  return RowSeparated(
                    separatorBuilder: (context, index) => SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IntrinsicWidth(
                        stepWidth: 260,
                        child: ReactiveTextField(
                          formControlName: 'major_items',
                        ),
                      ),
                      ReactiveFormArray(
                        formArrayName: 'subitems',
                        builder: (context, formArray, child) {
                          formArrays = formArray;
                          final rows = formArray.controls
                              .map((controll) => controll as FormGroup)
                              .map((currenForm) {
                            return ReactiveForm(
                              formGroup: currenForm,
                              child: IntrinsicWidth(
                                stepWidth: 260,
                                child: ValueListenableBuilder(
                                    valueListenable:
                                        context.read<SaleModel>().submitData,
                                    builder: (context, value, _) {
                                      return ReactiveDropdownFormField(
                                        formControlName: 'submit',
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
                            );
                          }).toList();
                          return ColumnSeparated(
                            separatorBuilder: (context, index) => SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            children: rows.toList(),
                          );
                        },
                      ),
                      IconButton(
                        onPressed: () {
                          formArrays.add(
                            FormGroup({
                              'submit': FormControl<String>(),
                            }),
                          );
                        },
                        icon: Icon(Icons.add_box_rounded),
                      ),
                      IntrinsicWidth(
                        stepWidth: 60,
                        child: ReactiveTextField(
                          formControlName: 'quantity',
                        ),
                      ),
                      IntrinsicWidth(
                        stepWidth: 80,
                        child: ValueListenableBuilder(
                            valueListenable: context.read<SaleModel>().unitData,
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
                          formControlName: 'payment_document',
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Row(
              children: [
                const SizedBox(width: 610),
                boxStyleDis(context, '経費合計', '1234'),
              ],
            ),
            Row(
              children: [
                const SizedBox(width: 610),
                boxStyleDis(context, '消費税（10%）', '1234'),
              ],
            ),
            Row(
              children: [
                const SizedBox(width: 820),
                IntrinsicWidth(
                  stepWidth: 60,
                  child: ValueListenableBuilder(
                      valueListenable: context.read<SaleModel>().taxData,
                      builder: (context, value, _) {
                        return ReactiveDropdownFormField(
                          formControlName: 'type_of_tax',
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
            Row(
              children: [
                const SizedBox(width: 610),
                boxStyleDis(context, '合計金額', '1234'),
              ],
            )
          ],
        ),
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
