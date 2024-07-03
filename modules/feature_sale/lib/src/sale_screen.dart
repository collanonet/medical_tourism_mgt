import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'sale_model.dart';

class SaleManagementScreen extends StatefulWidget {
  const SaleManagementScreen({super.key});

  @override
  State<SaleManagementScreen> createState() => _SaleManagementScreenState();
}

class _SaleManagementScreenState extends State<SaleManagementScreen> {
  @override
  Widget build(BuildContext context) {
    final form = ReactiveForm.of(context) as FormGroup;
    var formArrays;
    return SingleChildScrollView(
      child: ColumnSeparated(
        separatorBuilder: (context, index) {
          return SizedBox(height: context.appTheme.spacing.marginMedium);
        },
        children: [
          Container(
            padding: EdgeInsets.all(
              context.appTheme.spacing.marginMedium,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  context.appTheme.spacing.borderRadiusMedium,
                ),
                color: Colors.white),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(
                    context.appTheme.spacing.marginMedium,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        context.appTheme.spacing.borderRadiusMedium,
                      ),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      color: Colors.grey.withOpacity(0.1)),
                  child: Icon(
                    Icons.calculate_outlined,
                    color: context.appTheme.primaryColor,
                  ),
                ),
                SizedBox(
                  width: context.appTheme.spacing.marginMedium,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'LIU　WEIQIANG/母子健康視察ツアー  ',
                      style: context.textTheme.titleLarge,
                    ),
                    SizedBox(
                      height: context.appTheme.spacing.marginMedium,
                    ),
                    Text('刘 伟强  劉 偉強  リュウ イーチャン')
                  ],
                ),
                Spacer(),
                Text('種別'),
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blue),
                  ),
                  onPressed: () {},
                  child: Text('治療'),
                ),
                SizedBox(
                  width: context.appTheme.spacing.marginMedium,
                ),
                Text('ビザ'),
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 206, 195, 95)),
                  ),
                  onPressed: () {},
                  child: Text('医療ビザ'),
                ),
                SizedBox(
                  width: context.appTheme.spacing.marginMedium,
                ),
                Text('進捗'),
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 32, 171, 225)),
                  ),
                  onPressed: () {},
                  child: Text('受注'),
                ),
                SizedBox(
                  width: context.appTheme.spacing.marginMedium,
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(
              context.appTheme.spacing.marginMedium,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                context.appTheme.spacing.borderRadiusMedium,
              ),
              color: Colors.white,
            ),
            child: ColumnSeparated(
              crossAxisAlignment: CrossAxisAlignment.start,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                );
              },
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 20),
                        IntrinsicWidth(
                          stepWidth: 700,
                          child: ReactiveTextField(
                            formControlName: 'medical_expense_deposit',
                            decoration: const InputDecoration(
                              labelText: '医療費預り金',
                              fillColor: Color(0xF8F8D9),
                              suffixIcon: Align(
                                alignment: Alignment.centerRight,
                                child: Text('1,820,000円'),
                              ),
                            ),
                            valueAccessor: IntValueAccessor(),
                            readOnly: true,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('入金日'),
                        IntrinsicWidth(
                          stepWidth: 200,
                          child: ReactiveDatePicker<DateTime>(
                            formControlName: 'payment_day',
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                            builder: (BuildContext context,
                                ReactiveDatePickerDelegate<dynamic> picker,
                                Widget? child) {
                              return Stack(
                                children: [
                                  ReactiveTextField<DateTime>(
                                    formControlName: 'payment_day',
                                    readOnly: true,
                                    onTap: (value) => picker.showPicker(),
                                    valueAccessor: DateTimeValueAccessor(),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 6),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: IconButton(
                                        onPressed: () => picker.showPicker(),
                                        icon: Icon(
                                          Icons.calendar_month,
                                          color: context.appTheme.primaryColor,
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
                Row(
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 20),
                        IntrinsicWidth(
                          stepWidth: 700,
                          child: ReactiveTextField(
                            formControlName: 'actual_cost',
                            decoration: const InputDecoration(
                              labelText: '実費',
                              fillColor: Color(0xF8F8D9),
                              suffixIcon: Align(
                                alignment: Alignment.centerRight,
                                child: Text('1,520,000円'),
                              ),
                            ),
                            valueAccessor: IntValueAccessor(),
                            readOnly: true,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('精算日'),
                        IntrinsicWidth(
                          stepWidth: 200,
                          child: ReactiveDatePicker<DateTime>(
                            formControlName: 'settlement_day',
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                            builder: (BuildContext context,
                                ReactiveDatePickerDelegate<dynamic> picker,
                                Widget? child) {
                              return Stack(
                                children: [
                                  ReactiveTextField<DateTime>(
                                    formControlName: 'settlement_day',
                                    readOnly: true,
                                    onTap: (value) => picker.showPicker(),
                                    valueAccessor: DateTimeValueAccessor(),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 6),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: IconButton(
                                        onPressed: () => picker.showPicker(),
                                        icon: Icon(
                                          Icons.calendar_month,
                                          color: context.appTheme.primaryColor,
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
                IntrinsicWidth(
                  stepWidth: 700,
                  child: ReactiveTextField(
                    maxLines: 3,
                    formControlName: 'actual_cost',
                    decoration: const InputDecoration(
                      labelText: '実費内訳',
                      fillColor: Color(0xF8F8D9),
                    ),
                    valueAccessor: IntValueAccessor(),
                    readOnly: true,
                  ),
                ),
                IntrinsicWidth(
                  stepWidth: 700,
                  child: ReactiveTextField(
                    formControlName: 'Refund_amount',
                    decoration: const InputDecoration(
                      labelText: '実費',
                      fillColor: Color(0xF8F8D9),
                      suffixIcon: Align(
                        alignment: Alignment.centerRight,
                        child: Text('3,220,000円'),
                      ),
                    ),
                    valueAccessor: IntValueAccessor(),
                    readOnly: true,
                  ),
                ),
                Text('サービス費'),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromARGB(255, 14, 158, 194), width: 2),
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
                                          width: context
                                              .appTheme.spacing.marginMedium,
                                        );
                                      },
                                      children: [
                                        Text(
                                            '${formArray.controls.indexOf(currentForm) + 1}'),
                                        Expanded(
                                          child: ValueListenableBuilder(
                                              valueListenable: context
                                                  .read<SaleModel>()
                                                  .itemData,
                                              builder: (context, value, _) {
                                                return ReactiveDropdownFormField(
                                                  formControlName: 'item',
                                                  items: value
                                                      .map((e) =>
                                                          DropdownMenuItem(
                                                            value: e.item,
                                                            child: Text(
                                                              e.item,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
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
                                              valueListenable: context
                                                  .read<SaleModel>()
                                                  .unitData,
                                              builder: (context, value, _) {
                                                return ReactiveDropdownFormField(
                                                  formControlName: 'unit',
                                                  items: value
                                                      .map((e) =>
                                                          DropdownMenuItem(
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
                                            formControlName:
                                                'payment_document_no',
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
                                          height: context
                                              .appTheme.spacing.marginMedium,
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
                                              'amount_of_money':
                                                  FormControl<int>(),
                                              'cost': FormControl<int>(),
                                              'profit': FormControl<int>(),
                                              'invoice_no': FormControl<int>(),
                                              'payment_document_no':
                                                  FormControl<int>(),
                                            },
                                          ),
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.add_box_rounded,
                                            color:
                                                context.appTheme.primaryColor,
                                          ),
                                          Text(
                                            '行を追加',
                                            style: TextStyle(
                                                color: context
                                                    .appTheme.primaryColor),
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
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                    height:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                  children: [
                                    RowSeparated(
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                          width: context
                                              .appTheme.spacing.marginMedium,
                                        );
                                      },
                                      children: const [
                                        Text('金額'),
                                        SizedBox(width: 100),
                                        Text('原価'),
                                        SizedBox(width: 100),
                                        Text('利益'),
                                      ],
                                    ),
                                    RowSeparated(
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                          width: context
                                              .appTheme.spacing.marginMedium,
                                        );
                                      },
                                      children: [
                                        IntrinsicWidth(
                                          stepWidth: 200,
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
                                        )
                                      ],
                                    ),
                                    RowSeparated(
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                          width: context
                                              .appTheme.spacing.marginMedium,
                                        );
                                      },
                                      children: [
                                        IntrinsicWidth(
                                          stepWidth: 200,
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
                                        )
                                      ],
                                    ),
                                    RowSeparated(
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                          width: context
                                              .appTheme.spacing.marginMedium,
                                        );
                                      },
                                      children: [
                                        IntrinsicWidth(
                                          stepWidth: 80,
                                          child: ValueListenableBuilder(
                                              valueListenable: context
                                                  .read<SaleModel>()
                                                  .taxData,
                                              builder: (context, value, _) {
                                                return ReactiveDropdownFormField(
                                                  formControlName: 'tax',
                                                  items: value
                                                      .map((e) =>
                                                          DropdownMenuItem(
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
                                          stepWidth: 80,
                                          child: ValueListenableBuilder(
                                              valueListenable: context
                                                  .read<SaleModel>()
                                                  .taxData,
                                              builder: (context, value, _) {
                                                return ReactiveDropdownFormField(
                                                  formControlName: 'tax',
                                                  items: value
                                                      .map((e) =>
                                                          DropdownMenuItem(
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
                                          stepWidth: 80,
                                          child: ValueListenableBuilder(
                                              valueListenable: context
                                                  .read<SaleModel>()
                                                  .taxData,
                                              builder: (context, value, _) {
                                                return ReactiveDropdownFormField(
                                                  formControlName: 'tax',
                                                  items: value
                                                      .map((e) =>
                                                          DropdownMenuItem(
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
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text('サービス費'),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromARGB(255, 14, 158, 194), width: 2),
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
                                          .map((controll) =>
                                              controll as FormGroup)
                                          .map((currenForm) {
                                        return ReactiveForm(
                                          formGroup: currenForm,
                                          child: IntrinsicWidth(
                                            stepWidth: 260,
                                            child: ValueListenableBuilder(
                                                valueListenable: context
                                                    .read<SaleModel>()
                                                    .submitData,
                                                builder: (context, value, _) {
                                                  return ReactiveDropdownFormField(
                                                    formControlName: 'submit',
                                                    items: value
                                                        .map((e) =>
                                                            DropdownMenuItem(
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
                                        separatorBuilder:
                                            (context, index) => SizedBox(
                                          height: context.appTheme.spacing
                                              .marginMedium,
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
                                      formControlName: 'payment_document',
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text('合計'),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromARGB(255, 14, 158, 194), width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(10),
                  child: ReactiveForm(
                    formGroup: form.control('total') as FormGroup,
                    child: ColumnSeparated(
                      separatorBuilder: (context, index) => SizedBox(
                        height: context.appTheme.spacing.marginMedium,
                      ),
                      children: [
                        Row(
                          children: [
                            Text('サービス費の【原価】と【経費】の合計'),
                            Text('【A】売上合計から【B】原価合計を引いた金額'),
                          ],
                        ),
                        RowSeparated(
                          separatorBuilder: (context, index) => SizedBox(
                            width: context.appTheme.spacing.marginMedium,
                          ),
                          children: [
                            IntrinsicWidth(
                              stepWidth: 200,
                              child: ReactiveTextField(
                                formControlName: 'total_sales',
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  prefixIcon: Container(
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'A',
                                        style: TextStyle(fontSize: 30),
                                      ),
                                    ),
                                  ),
                                  suffixIcon: Text('123456'),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
