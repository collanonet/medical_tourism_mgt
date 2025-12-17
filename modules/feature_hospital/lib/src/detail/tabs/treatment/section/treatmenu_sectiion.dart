// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Project imports:
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
                                'project': FormControl<String>(validators: [Validators.required]),
                                'treatmentCostExcludingTax':
                                    FormControl<double>(validators: [Validators.required]),
                                'treatmentCostTaxIncluded':
                                    FormControl<double>(validators: [Validators.required]),
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
                                  valueAccessor: CurrencyValueAccessor(),
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
                                  valueAccessor: CurrencyValueAccessor(),
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
                                                CurrencyValueAccessor(),
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
                                    final currentLen = formArray.controls.length;
                                    final targetLen = addIncludeTax.value;
                                    if (targetLen > currentLen) {
                                      // Add columns
                                      for (var i = 0;
                                          i < targetLen - currentLen;
                                          i++) {
                                        formArray.add(
                                          FormGroup({
                                            'cost':
                                                FormControl<double>(value: 0),
                                            'tax': FormControl<int>(value: 15),
                                          }),
                                        );
                                      }
                                    } else if (targetLen < currentLen) {
                                      // Remove columns
                                      for (var i = 0;
                                          i < currentLen - targetLen;
                                          i++) {
                                        formArray.removeAt(
                                            formArray.controls.length - 1);
                                      }
                                    }
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
          width: 120,
        ),
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
                                  final id =
                                      (control as FormGroup).control('_id').value;
                                  if (id != null) {
                                    final currentList = context
                                        .read<TreatmentModel>()
                                        .treatmentMenuId
                                        .value;
                                    context
                                        .read<TreatmentModel>()
                                        .treatmentMenuId
                                        .value = [...currentList, id];
                                  }
                                  formArray.remove(control);
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
      crossAxisAlignment: CrossAxisAlignment.end,
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
        SizedBox(
            width: 120,
            child: ValueListenableBuilder<int>(
              valueListenable: addIncludeTax,
              builder: (context, value, _) {
                final isAddDisabled = value >= 3;
                final isRemoveDisabled = value <= 1;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Add Column Button
                    InkWell(
                      onTap: isAddDisabled
                          ? null
                          : () {
                              addIncludeTax.value += 1;
                              final formArray =
                                  (ReactiveForm.of(context) as FormGroup)
                                      .control('tax') as FormArray;
                              formArray.add(
                                FormGroup({
                                  'tax': FormControl<int>(
                                    value: 0,
                                  ),
                                }),
                              );
                            },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_circle,
                            color: isAddDisabled
                                ? Colors.grey
                                : context.appTheme.primaryColor,
                          ),
                          SizedBox(
                            width: context.appTheme.spacing.marginSmall,
                          ),
                          Text(
                            '列を追加',
                            style: TextStyle(
                              color: isAddDisabled
                                  ? Colors.grey
                                  : context.appTheme.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: context.appTheme.spacing.marginSmall),
                    // Remove Column Button
                    InkWell(
                      onTap: isRemoveDisabled
                          ? null
                          : () {
                              addIncludeTax.value -= 1;
                              final formArray =
                                  (ReactiveForm.of(context) as FormGroup)
                                      .control('tax') as FormArray;
                              formArray.removeAt(formArray.controls.length - 1);
                            },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.remove_circle,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: context.appTheme.spacing.marginSmall,
                          ),
                          const Text(
                            '列を削除',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            )),
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
