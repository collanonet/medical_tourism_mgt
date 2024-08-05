import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:reactive_forms/reactive_forms.dart';

class TreatmentMenuSection extends StatefulWidget {
  const TreatmentMenuSection({super.key, required this.hospitalId});
  final String hospitalId;
  @override
  State<TreatmentMenuSection> createState() => _TreatmentMenuSectionState();
}

class _TreatmentMenuSectionState extends State<TreatmentMenuSection> {
  ValueNotifier<int> addIncludeTax = ValueNotifier(1);

  @override
  Widget build(BuildContext context) {
    final formArray = (ReactiveForm.of(context) as FormGroup)
        .control('treatmentMenu') as FormArray;

    final taxRateFormArray =
        (ReactiveForm.of(context) as FormGroup).control('cost') as FormArray;

    return ColumnSeparated(
      crossAxisAlignment: CrossAxisAlignment.start,
      separatorBuilder: (context, index) => SizedBox(
        height: context.appTheme.spacing.formSpacing,
      ),
      children: [
        Text(
          '治療メニュー',
          style: context.textTheme.bodyLarge,
        ),
        RowSeparated(
            separatorBuilder: (context, index) => SizedBox(
                  width: context.appTheme.spacing.formSpacing,
                ),
            children: [
              Expanded(
                child: RowSeparated(
                  separatorBuilder: (context, index) => SizedBox(
                    width: context.appTheme.spacing.formSpacing,
                  ),
                  children: [
                    Expanded(
                        flex: 2,
                        child: Text('項目', style: context.textTheme.bodyMedium)),
                    Expanded(
                        flex: 1,
                        child: Text('治療費用（税別）',
                            style: context.textTheme.bodyMedium)),
                    Expanded(
                        flex: 1,
                        child: Text('治療費用（税込）',
                            style: context.textTheme.bodyMedium)),
                    ReactiveFormArray(
                        formArrayName: 'cost',
                        builder: (context, formArray, child) {
                          final row = formArray.controls
                              .map((control) => control as FormGroup)
                              .map(
                                (currentForm) => IntrinsicWidth(
                                  stepWidth: 80,
                                  child: ReactiveForm(
                                    formGroup: currentForm,
                                    child: SizedBox(
                                      width: 80,
                                      child: ReactiveTextField(
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'[0-9]')),
                                        ],
                                        formControlName: 'cost',
                                        decoration: const InputDecoration(
                                          prefixText: 'R ',
                                          suffixText: ' %',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                          return RowSeparated(
                            separatorBuilder: (context, index) => SizedBox(
                              width: context.appTheme.spacing.formSpacing,
                            ),
                            children: row.toList(),
                          );
                        })
                  ],
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              IntrinsicWidth(
                  stepWidth: 250,
                  child: Text('準備検査', style: context.textTheme.bodyMedium))
            ]),
        RowSeparated(
          separatorBuilder: (context, index) => SizedBox(
            width: context.appTheme.spacing.formSpacing,
          ),
          children: [
            Expanded(
              child: ReactiveFormArray(
                formArrayName: 'treatmentMenu',
                builder: (context, formArray, child) {
                  final row = formArray.controls.map(
                    (control) => ReactiveForm(
                      formGroup: control as FormGroup,
                      child: RowSeparated(
                        separatorBuilder: (context, index) => SizedBox(
                          width: context.appTheme.spacing.formSpacing,
                        ),
                        children: [
                          Expanded(
                            flex: 2,
                            child: ReactiveTextField(
                              formControlName: 'project',
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: ReactiveTextField<double>(
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                ],
                                formControlName: 'treatmentCostExcludingTax',
                              )),
                          Expanded(
                              flex: 1,
                              child: ReactiveTextField<double>(
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                ],
                                formControlName: 'treatmentCostTaxIncluded',
                              )),
                          ReactiveFormArray(
                            formArrayName: 'treatmentCostTax',
                            builder: (context, formArray, child) {
                              final row = formArray.controls
                                  .map((control) => control as FormGroup)
                                  .map(
                                    (currentForm) => IntrinsicWidth(
                                      stepWidth: 70,
                                      child: ReactiveForm(
                                        formGroup: currentForm,
                                        child: ReactiveTextField(
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                                RegExp(r'[0-9]')),
                                          ],
                                          formControlName: 'cost',
                                        ),
                                      ),
                                    ),
                                  );

                              return ValueListenableListener(
                                valueListenable: addIncludeTax,
                                onListen: () {
                                  // add into row of treatment
                                  formArray.add(
                                    FormGroup({
                                      'cost': FormControl<double>(),
                                      'tax': FormControl<int>(value: 15),
                                    }),
                                  );
                                },
                                child: RowSeparated(
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                          width: context
                                              .appTheme.spacing.formSpacing),
                                  children: row.toList(),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  );
                  return ColumnSeparated(
                    separatorBuilder: (context, index) => SizedBox(
                      height: context.appTheme.spacing.formSpacing,
                    ),
                    children: row.toList(),
                  );
                },
              ),
            ),
            InkWell(
                onTap: () {
                  if (addIncludeTax.value <= 3) {
                    addIncludeTax.value += 1;
                    // add into header
                    taxRateFormArray.add(
                      FormGroup({
                        'cost': FormControl<int>(),
                      }),
                    );
                  }
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add_circle,
                        color: context.appTheme.primaryColor),
                    RotatedBox(quarterTurns: 1, child: Text('行を追加')),
                  ],
                )),
            IntrinsicWidth(
              stepWidth: 250,
              child: ReactiveFormArray(
                  formArrayName: 'treatmentMenu',
                  builder: (context, formArray, child) {
                    final rows =
                        formArray.controls.map((control) => ReactiveForm(
                            formGroup: control as FormGroup,
                            child: RowSeparated(
                              separatorBuilder: (context, index) => SizedBox(
                                width: context.appTheme.spacing.formSpacing,
                              ),
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: ReactiveTextField(
                                    formControlName: 'remark',
                                  ),
                                ),
                                if (formArray.controls.indexOf(control) != 0)
                                  IconButton(
                                    icon: const Icon(
                                      Icons.remove_circle,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      formArray.removeAt(
                                          formArray.controls.indexOf(control));
                                    },
                                  ),
                              ],
                            )));
                    return ColumnSeparated(
                        separatorBuilder: (context, index) => SizedBox(
                              height: context.appTheme.spacing.formSpacing,
                            ),
                        children: rows.toList());
                  }),
            )
          ],
        ),
        ValueListenableBuilder(
            valueListenable: addIncludeTax,
            builder: (context, value, _) {
              return InkWell(
                onTap: () {
                  formArray.add(
                    FormGroup({
                      // todo: add id field
                      'hospitalId':
                          FormControl<String>(value: widget.hospitalId),
                      'project': FormControl<String>(),
                      'treatmentCostExcludingTax': FormControl<double>(),
                      'treatmentCostTaxIncluded': FormControl<double>(),
                      'remark': FormControl<String>(),
                      'treatmentCostTax': FormArray([
                        FormGroup({
                          'cost': FormControl<double>(),
                          'tax': FormControl<int>(value: 15),
                        }),
                        ...List.generate(value - 1, (index) {
                          return FormGroup({
                            'cost': FormControl<double>(),
                            'tax': FormControl<int>(),
                          });
                        })
                      ])
                    }),
                  );
                },
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
                      '担当者を追加',
                      style: TextStyle(color: context.appTheme.primaryColor),
                    )
                  ],
                ),
              );
            }),
      ],
    );
  }
}
