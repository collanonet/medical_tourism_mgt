import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:intl/intl.dart';

class SaleScreen extends StatefulWidget {
  const SaleScreen({super.key});

  @override
  State<SaleScreen> createState() => _SaleScreenState();
}

class _SaleScreenState extends State<SaleScreen> {
  final form = FormGroup({
    'estimatedCost': FormControl<int>(value: 1820000),
    'actualCost': FormControl<int>(value: 1500000),
    'paymentAmount': FormControl<String>(),
    'additionalCost': FormControl<int>(value: 320000),
    'entryDate': FormControl<DateTime>(value: DateTime(2030, 6, 29)),
    'exitDate': FormControl<DateTime>(value: DateTime(2030, 6, 29)),
    'services': FormArray([
      FormGroup({
        'item': FormControl<String>(),
        'quantity': FormControl<int>(),
        'unit': FormControl<String>(),
        'unitPrice': FormControl<int>(),
        'amount': FormControl<int>(),
        'profit': FormControl<int>(),
      }),
      // Add more service FormGroups here...
    ]),
    'salesTotal': FormControl<int>(value: 1655300),
    'cost': FormControl<int>(value: 595300),
    'profit': FormControl<int>(value: 1230300),
    'tax10Percent': FormControl<int>(value: 165530),
    'taxCost': FormControl<int>(value: 59530),
    'taxProfit': FormControl<int>(value: 123030),
    'taxType1': FormControl<String>(value: '内税'),
    'taxType2': FormControl<String>(value: '外税'),
    'taxType3': FormControl<String>(value: '非課税'),
    'totalAmount': FormControl<int>(value: 1805300),
    'totalCost': FormControl<int>(value: 660530),
    'totalProfit': FormControl<int>(value: 1540030),
  });

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: form,
      child: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ReactiveTextField<int>(
            formControlName: 'estimatedCost',
            decoration: InputDecoration(
              labelText: 'Estimated Cost (¥)',
              filled: true,
              fillColor: Colors.yellow[100],
            ),
            valueAccessor: IntValueAccessor(),
            readOnly: true,
          ),
          SizedBox(height: 8),
          ReactiveTextField<int>(
            formControlName: 'actualCost',
            decoration: InputDecoration(
              labelText: 'Actual Cost (¥)',
              filled: true,
              fillColor: Colors.yellow[100],
            ),
            valueAccessor: IntValueAccessor(),
            readOnly: true,
          ),
          SizedBox(height: 8),
          ReactiveTextField<String>(
            formControlName: 'paymentAmount',
            decoration: InputDecoration(
              labelText: 'Payment Amount',
              filled: true,
              fillColor: Colors.green[100],
            ),
            minLines: 3,
            maxLines: 5,
          ),
          SizedBox(height: 8),
          ReactiveTextField<int>(
            formControlName: 'additionalCost',
            decoration: InputDecoration(
              labelText: 'Additional Cost (¥)',
              filled: true,
              fillColor: Colors.blue[100],
            ),
            valueAccessor: IntValueAccessor(),
            readOnly: true,
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                  child: ReactiveDatePicker<DateTime>(
                      formControlName: 'entryDate',
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                      builder: (context, picker, child) {
                        return ReactiveTextField<DateTime>(
                          formControlName: 'entryDate',
                          valueAccessor: DateTimeValueAccessor(
                            dateTimeFormat: DateFormat('yyyy/MM/dd'),
                          ),
                          decoration: InputDecoration(
                            label: Text(
                              'Entry Date',
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            suffixIcon: IconButton(
                              icon: const Icon(
                                CupertinoIcons.calendar,
                                color: Colors.grey,
                              ),
                              onPressed: picker.showPicker,
                            ),
                          ),
                        );
                      })),
              SizedBox(width: 16),
              Expanded(
                  child: ReactiveDatePicker<DateTime>(
                      formControlName: 'exitDate',
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                      builder: (context, picker, child) {
                        return ReactiveTextField<DateTime>(
                          formControlName: 'exitDate',
                          valueAccessor: DateTimeValueAccessor(
                            dateTimeFormat: DateFormat('yyyy/MM/dd'),
                          ),
                          decoration: InputDecoration(
                            label: Text(
                              'Exit Date',
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            suffixIcon: IconButton(
                              icon: const Icon(
                                CupertinoIcons.calendar,
                                color: Colors.grey,
                              ),
                              onPressed: picker.showPicker,
                            ),
                          ),
                        );
                      })),
            ],
          ),
          ReactiveFormArray(
            formArrayName: 'services',
            builder: (context, formArray, child) {
              final rows =
                  formArray.controls.map((control) => control as FormGroup).map(
                        (currentForm) => ReactiveForm(
                          formGroup: currentForm,
                          child: ServiceItem(
                            formGroup: currentForm,
                          ),
                        ),
                      );

              return ColumnSeparated(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: context.appTheme.spacing.marginMedium,
                  );
                },
                children: [
                  ColumnSeparated(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: context.appTheme.spacing.marginMedium,
                      );
                    },
                    children: rows.toList(),
                  ),
                  Container(
                    padding: EdgeInsets.all(
                      context.appTheme.spacing.marginMedium,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          context.appTheme.spacing.borderRadiusMedium),
                      color: Colors.grey[200],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(
                        context.appTheme.spacing.marginMedium,
                      ),
                      child: InkWell(
                        onTap: () => formArray.add(
                          FormGroup({
                            'item': FormControl<String>(),
                            'quantity': FormControl<int>(),
                            'unit': FormControl<String>(),
                            'unitPrice': FormControl<int>(),
                            'amount': FormControl<int>(),
                            'profit': FormControl<int>(),
                          }),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_circle,
                              color: context.appTheme.primaryColor,
                            ),
                            SizedBox(
                              width: context.appTheme.spacing.marginSmall,
                            ),
                            Text(
                              '患者を追加',
                              style: TextStyle(
                                  color: context.appTheme.primaryColor),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          SizedBox(height: 16),
          buildSummaryField('salesTotal', '売上合計'),
          Row(
            children: [
              buildCostProfitField('cost', '原価'),
              buildCostProfitField('profit', '利益'),
            ],
          ),
          buildSummaryField('tax10Percent', '消費税 (10%)'),
          Row(
            children: [
              buildCostProfitField('taxCost', '原価'),
              buildCostProfitField('taxProfit', '利益'),
            ],
          ),
          Row(
            children: [
              buildDropdownField('taxType1'),
              buildDropdownField('taxType2'),
              buildDropdownField('taxType3'),
            ],
          ),
          buildSummaryField('totalAmount', '合計金額'),
          Row(
            children: [
              buildCostProfitField('totalCost', '原価'),
              buildCostProfitField('totalProfit', '利益'),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSummaryField(String formControlName, String label) {
    return ReactiveTextField<int>(
      formControlName: formControlName,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.grey[300],
      ),
      valueAccessor: IntValueAccessor(),
      readOnly: true,
    );
  }

  Widget buildCostProfitField(String formControlName, String label) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ReactiveTextField<int>(
          formControlName: formControlName,
          decoration: InputDecoration(
            labelText: label,
            filled: true,
            fillColor: Colors.grey[300],
          ),
          valueAccessor: IntValueAccessor(),
          readOnly: true,
        ),
      ),
    );
  }

  Widget buildDropdownField(String formControlName) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ReactiveDropdownField<String>(
          formControlName: formControlName,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[300],
          ),
          items: [
            DropdownMenuItem(value: '内税', child: Text('内税')),
            DropdownMenuItem(value: '外税', child: Text('外税')),
            DropdownMenuItem(value: '非課税', child: Text('非課税')),
          ],
        ),
      ),
    );
  }
}

class ServiceItem extends StatelessWidget {
  final FormGroup formGroup;

  ServiceItem({super.key, required this.formGroup});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReactiveTextField<String>(
          formControlName: 'item',
          decoration: InputDecoration(
            labelText: 'Item',
          ),
        ),
        ReactiveTextField<int>(
          formControlName: 'quantity',
          decoration: InputDecoration(
            labelText: 'Quantity',
          ),
          valueAccessor: IntValueAccessor(),
        ),
        ReactiveTextField<String>(
          formControlName: 'unit',
          decoration: InputDecoration(
            labelText: 'Unit',
          ),
        ),
        ReactiveTextField<int>(
          formControlName: 'unitPrice',
          decoration: InputDecoration(
            labelText: 'Unit Price (¥)',
          ),
          valueAccessor: IntValueAccessor(),
        ),
        ReactiveTextField<int>(
          formControlName: 'amount',
          decoration: InputDecoration(
            labelText: 'Amount (¥)',
          ),
          valueAccessor: IntValueAccessor(),
        ),
        ReactiveTextField<int>(
          formControlName: 'profit',
          decoration: InputDecoration(
            labelText: 'Profit (¥)',
          ),
          valueAccessor: IntValueAccessor(),
        ),
        Divider(),
      ],
    );
  }
}
