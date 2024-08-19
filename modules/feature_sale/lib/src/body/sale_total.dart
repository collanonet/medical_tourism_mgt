import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../sale_model.dart';

class SaleTotal extends StatelessWidget {
  const SaleTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final form = ReactiveForm.of(context) as FormGroup;
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 14, 158, 194), width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      child: ReactiveForm(
        formGroup: form.control('total') as FormGroup,
        child: ColumnSeparated(
          separatorBuilder: (context, index) => SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          children: [
            const Row(
              children: [
                SizedBox(width: 350),
                Text('サービス費の【原価】と【経費】の合計'),
                SizedBox(width: 110),
                Text('【A】売上合計から【B】原価合計を引いた金額'),
              ],
            ),
            RowSeparated(
              separatorBuilder: (context, index) => SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              children: [
                boxStyle(context, 'A', '売上合計', '123456'),
                boxStyle(context, 'B', '原価合計', '123456'),
                boxStyle(context, 'C', '粗利額', '123456'),
              ],
            ),
            RowSeparated(
              separatorBuilder: (context, index) => SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              children: [
                boxStyleDis(context, '消費税（10%）', '12345'),
                boxStyleDis(context, '消費税（10%）', '12345'),
                boxStyleDis(context, '消費税（10%）', '12345'),
              ],
            ),
            RowSeparated(
              separatorBuilder: (context, index) => SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              children: [
                const SizedBox(width: 190),
                IntrinsicWidth(
                  stepWidth: 60,
                  child: ValueListenableBuilder(
                      valueListenable: context.read<SaleModel>().taxData,
                      builder: (context, value, _) {
                        return ReactiveDropdownFormField(
                          formControlName: 'tax_included',
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
                const SizedBox(width: 195),
                IntrinsicWidth(
                  stepWidth: 60,
                  child: ValueListenableBuilder(
                      valueListenable: context.read<SaleModel>().taxData,
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
                const SizedBox(width: 195),
                IntrinsicWidth(
                  stepWidth: 60,
                  child: ValueListenableBuilder(
                      valueListenable: context.read<SaleModel>().taxData,
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
            const SizedBox(height: 30),
            RowSeparated(
              separatorBuilder: (context, index) => SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              children: [
                const SizedBox(width: 680),
                boxStyleDis(context, '消費税（10%）', '12345'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget boxStyle(
      BuildContext context, String labelText, String title, String travelling) {
    return Container(
      width: 330,
      height: 45,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Container(
            width: 60,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 43, 206, 251),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                labelText,
                style: const TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ),
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
