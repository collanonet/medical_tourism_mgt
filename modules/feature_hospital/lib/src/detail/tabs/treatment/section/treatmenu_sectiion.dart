// Flutter imports:
import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../treatment_model.dart';

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
        (ReactiveForm.of(context) as FormGroup).control('tax') as FormArray;

    return ValueListenableBuilder(
        valueListenable: context.read<TreatmentModel>().treatmentMenuData,
        builder: (context, value, _) {
          return Padding(
            padding: const EdgeInsets.only(right: 32),
            child: Skeletonizer(
              enabled: value.loading,
              child: ColumnSeparated(
                crossAxisAlignment: CrossAxisAlignment.start,
                separatorBuilder: (context, index) => SizedBox(
                  height: context.appTheme.spacing.formSpacing,
                ),
                children: [
                  Text(
                    '治療メニュー',
                    style: context.textTheme.bodyLarge,
                  ),
                  //header
                  header(context),
                  //body
                  listForm(taxRateFormArray),
                  ValueListenableBuilder(
                      valueListenable: addIncludeTax,
                      builder: (context, value, _) {
                        return InkWell(
                          onTap: () {
                            formArray.add(
                              FormGroup({
                                '_id': FormControl<String>(),
                                'hospitalId': FormControl<String>(
                                    value: widget.hospitalId),
                                'project': FormControl<String>(),
                                'treatmentCostExcludingTax':
                                    FormControl<double>(),
                                'treatmentCostTaxIncluded':
                                    FormControl<double>(),
                                'remark': FormControl<String>(),
                                'treatmentCostTax': FormArray([
                                  FormGroup({
                                    'cost': FormControl<double>(
                                      value: 0,
                                    ),
                                    'tax': FormControl<int>(value: 15),
                                  }),
                                  ...List.generate(value - 1, (index) {
                                    return FormGroup({
                                      'cost': FormControl<double>(
                                        value: 0,
                                      ),
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
                                '行を追加',
                                style: TextStyle(
                                    color: context.appTheme.primaryColor),
                              )
                            ],
                          ),
                        );
                      }),
                ],
              ),
            ),
          );
        });
  }

  Row listForm(FormArray<dynamic> taxRateFormArray) {
    return Row(
      children: [
        Expanded(
          child: RowSeparated(
            separatorBuilder: (context, index) => SizedBox(
              width: context.appTheme.spacing.marginMedium,
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
                                  decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                  ),
                                  valueAccessor: DoubleValueAccessor(),
                                  inputFormatters: [
                                    CustomCurrencyFormatter(),
                                    // FilteringTextInputFormatter.allow(
                                    //     RegExp(r'[0-9]')),
                                  ],
                                  formControlName: 'treatmentCostExcludingTax',
                                )),
                            Expanded(
                                flex: 1,
                                child: ReactiveTextField<double>(
                                  keyboardType: TextInputType.number,
                                  valueAccessor: DoubleValueAccessor(),
                                  inputFormatters: [
                                    CustomCurrencyFormatter(),
                                    // FilteringTextInputFormatter.allow(
                                    //     RegExp(r'[0-9]')),
                                  ],
                                  formControlName: 'treatmentCostTaxIncluded',
                                )),
                            ReactiveFormArray(
                              formArrayName: 'treatmentCostTax',
                              builder: (context, formArray, child) {
                                final row = formArray.controls
                                    .map((control) => control as FormGroup)
                                    .map(
                                      (currentForm) => SizedBox(
                                        width: 100,
                                        child: ReactiveForm(
                                          formGroup: currentForm,
                                          child: ReactiveTextField(
                                            keyboardType: TextInputType.number,
                                            valueAccessor:
                                                DoubleValueAccessor(),
                                            inputFormatters: [
                                              CustomCurrencyFormatter(),
                                              // FilteringTextInputFormatter.allow(
                                              //     RegExp(r'[0-9]')),
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
                                        'cost': FormControl<double>(value: 0),
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
            ],
          ),
        ),
        SizedBox(
            width: 50,
            child: ValueListenableBuilder<int>(
              valueListenable: addIncludeTax,
              builder: (context, value, _) {
                final isDisabled = value >= 3;
                return InkWell(
                  onTap: isDisabled
                      ? null
                      : () {
                          addIncludeTax.value += 1;
                          taxRateFormArray.add(
                            FormGroup({
                              'tax': FormControl<int>(
                                value: 0,
                              ),
                            }),
                          );
                        },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.add_circle,
                        color: isDisabled
                            ? Colors.grey
                            : context.appTheme.primaryColor,
                      ),
                      SizedBox(
                        height: context.appTheme.spacing.marginSmall,
                      ),
                      RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          '行を追加',
                          style: TextStyle(
                            color: isDisabled
                                ? Colors.grey
                                : context.appTheme.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            )),
        SizedBox(
          width: 350,
          child: ReactiveFormArray(
              formArrayName: 'treatmentMenu',
              builder: (context, formArray, child) {
                final rows = formArray.controls.map((control) => ReactiveForm(
                    formGroup: control as FormGroup,
                    child: RowSeparated(
                      separatorBuilder: (context, index) => SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                      children: [
                        Expanded(
                          child: ReactiveTextField(
                            formControlName: 'remark',
                          ),
                        ),
                        if (formArray.controls.indexOf(control) == 0)
                          const SizedBox(
                            width: 25,
                          ),
                        if (formArray.controls.indexOf(control) != 0)
                          SizedBox(
                            width: 25,
                            child: IconButton(
                              icon: const Icon(
                                Icons.remove_circle,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                formArray.removeAt(
                                    formArray.controls.indexOf(control));
                              },
                            ),
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
    );
  }

  Row header(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RowSeparated(
            separatorBuilder: (context, index) => SizedBox(
              width: context.appTheme.spacing.marginMedium,
            ),
            children: [
              Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('項目', style: context.textTheme.bodyMedium),
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: Text('治療費用（税別）', style: context.textTheme.bodyMedium)),
              Expanded(
                  flex: 1,
                  child: Text('治療費用（税込）', style: context.textTheme.bodyMedium)),
              ReactiveFormArray(
                  formArrayName: 'tax',
                  builder: (context, formArray, child) {
                    final row = formArray.controls
                        .map((control) => control as FormGroup)
                        .map(
                          (currentForm) => IntrinsicWidth(
                            stepWidth: 100,
                            child: ReactiveForm(
                              formGroup: currentForm,
                              child: SizedBox(
                                width: 65,
                                child: ReactiveTextField(
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]')),
                                  ],
                                  formControlName: 'tax',
                                  decoration: const InputDecoration(
                                    prefixText: 'R ',
                                    suffixText: ' %',
                                    contentPadding: EdgeInsets.all(4),
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
          width: 50,
        ),
        IntrinsicWidth(
            stepWidth: 350,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('備考', style: context.textTheme.bodyMedium),
              ],
            ))
      ],
    );
  }
}
