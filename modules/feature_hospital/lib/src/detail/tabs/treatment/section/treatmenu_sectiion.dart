import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        (ReactiveForm.of(context) as FormGroup).control('taxRate') as FormArray;

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
                    Expanded(
                      flex: 3,
                      child: ReactiveFormArray(
                          formArrayName: 'taxRate',
                          builder: (context, formArray, child) {
                            final row = formArray.controls
                                .map((control) => control as FormGroup)
                                .map(
                                  (currentForm) => ReactiveForm(
                                    formGroup: currentForm,
                                    child: Expanded(
                                      child: RowSeparated(
                                        separatorBuilder: (context, index) =>
                                            SizedBox(
                                          width: context.appTheme.spacing
                                              .marginExtraSmall,
                                        ),
                                        children: [
                                          Text(
                                            'R',
                                            style: context.textTheme.bodyMedium,
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: ReactiveTextField(
                                              formControlName: 'taxRate',
                                            ),
                                          ),
                                          Text(
                                            '%',
                                            style: context.textTheme.bodyMedium,
                                          )
                                        ],
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
                          }),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(child: Text('準備検査', style: context.textTheme.bodyMedium))
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
                              child: ReactiveTextField(
                                formControlName: 'treatmentCostExcludingTax',
                              )),
                          Expanded(
                              flex: 1,
                              child: ReactiveTextField(
                                formControlName: 'treatmentCostTaxIncluded',
                              )),
                          Expanded(
                            flex: 4,
                            child: ReactiveFormArray(
                              formArrayName: 'treatmentCostTax',
                              builder: (context, formArray, child) {
                                final row = formArray.controls
                                    .map((control) => control as FormGroup)
                                    .map(
                                      (currentForm) => ReactiveForm(
                                        formGroup: currentForm,
                                        child: Expanded(
                                          flex: 1,
                                          child: ReactiveTextField(
                                            formControlName: 'tax',
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
                                        'tax': FormControl<double>(),
                                        'taxRate': FormControl<int>(value: 15),
                                      }),
                                    );
                                    // add into header
                                    taxRateFormArray.add(
                                      FormGroup({
                                        'taxRate': FormControl<int>(),
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
                            ),
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
                  addIncludeTax.value += 1;
                },
                child: Column(
                  children: [
                    Icon(Icons.add_circle,
                        color: context.appTheme.primaryColor),
                    Text('行を追加'),
                  ],
                )),
            Expanded(
                flex: 1,
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
                                ],
                              )));
                      return ColumnSeparated(
                          separatorBuilder: (context, index) => SizedBox(
                                height: context.appTheme.spacing.formSpacing,
                              ),
                          children: rows.toList());
                    }))
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
                          'tax': FormControl<double>(),
                          'taxRate': FormControl<int>(value: 15),
                        }),
                        ...List.generate(value - 1, (index) {
                          return FormGroup({
                            'tax': FormControl<double>(),
                            'taxRate': FormControl<int>(),
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
