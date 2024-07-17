import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reactive_forms/reactive_forms.dart';

class EstimateMasterScreen extends StatefulWidget {
  const EstimateMasterScreen({super.key});

  @override
  State<EstimateMasterScreen> createState() => _EstimateMasterScreenState();
}

class _EstimateMasterScreenState extends State<EstimateMasterScreen> {
  @override
  Widget build(BuildContext context) {
    return ColumnSeparated(
      separatorBuilder: (context, index) => SizedBox(
        height: context.appTheme.spacing.marginMedium,
      ),
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '見積マスタ',
                style: TextStyle(
                  fontFamily: 'NotoSansJP',
                  package: 'core_ui',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: ColumnSeparated(
            separatorBuilder: (context, index) =>
                SizedBox(height: context.appTheme.spacing.marginMedium),
            children: [
              RowSeparated(
                separatorBuilder: (context, index) => SizedBox(
                  width: context.appTheme.spacing.marginMedium,
                ),
                children: const [
                  SizedBox(width: 150),
                  Expanded(
                    child: Text('項目'),
                  ),
                  Expanded(
                    child: Text('単価'),
                  ),
                  Expanded(
                    child: Text('金額'),
                  ),
                  Expanded(
                    child: Text('単価'),
                  ),
                  Expanded(
                    child: Text('金額'),
                  )
                ],
              ),
              ReactiveFormArray(
                formArrayName: 'arr',
                builder: (context, formArray, child) {
                  var rows = formArray.controls
                      .map((controll) => controll as FormGroup)
                      .map((currenForm) {
                    return ReactiveForm(
                      formGroup: currenForm,
                      child: RowSeparated(
                        separatorBuilder: (context, index) => SizedBox(
                            width: context.appTheme.spacing.marginMedium),
                        children: [
                         const SizedBox(width: 150),
                          Expanded(
                           
                            child: IntrinsicWidth(
                              stepWidth: 350,
                              child: ReactiveTextField(
                                formControlName: 'item',
                              ),
                            ),
                          ),
                          Expanded(
                            child: IntrinsicWidth(
                              stepWidth: 100,
                              child: ReactiveTextField(
                                formControlName: 'sell_unitPrice',
                              ),
                            ),
                          ),
                          Expanded(
                            child: IntrinsicWidth(
                              stepWidth: 100,
                              child: ReactiveTextField(
                                formControlName: 'sell_amountOfMoney',
                              ),
                            ),
                          ),
                          Expanded(
                            child: IntrinsicWidth(
                              stepWidth: 100,
                              child: ReactiveTextField(
                                formControlName: 'cost_unitPrice',
                              ),
                            ),
                          ),
                          Expanded(
                            child: IntrinsicWidth(
                              stepWidth: 100,
                              child: ReactiveTextField(
                                formControlName: 'cost_amountOfMoney',
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ColumnSeparated(
                        separatorBuilder: (context, index) => SizedBox(
                            height: context.appTheme.spacing.marginMedium),
                        children: rows,
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          formArray.add(
                            FormGroup({
                              'item': FormControl<String>(),
                              'sell_unitPrice': FormControl<String>(),
                              'sell_amountOfMoney': FormControl<String>(),
                              'cost_unitPrice': FormControl<String>(),
                              'cost_amountOfMoney': FormControl<String>(),
                            }),
                          );
                        },
                        child: IntrinsicWidth(
                          child: Row(
                            children: [
                              Icon(Icons.add_outlined,
                                  color: context.appTheme.primaryColor),
                              Text('行を追加',
                                  style: TextStyle(
                                      color: context.appTheme.primaryColor)),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
