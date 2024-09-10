// Flutter imports:
import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../treatment_model.dart';

class TelemedicineMenuSection extends StatefulWidget {
  const TelemedicineMenuSection({super.key, required this.hospitalId});

  final String hospitalId;

  @override
  State<TelemedicineMenuSection> createState() =>
      _TelemedicineMenuSectionState();
}

class _TelemedicineMenuSectionState extends State<TelemedicineMenuSection> {
  @override
  Widget build(BuildContext context) {
    final formArray = (ReactiveForm.of(context) as FormGroup)
        .control('telemedicineMenu') as FormArray;
    return ValueListenableBuilder(
        valueListenable: context.read<TreatmentModel>().treatmentMenuTeleData,
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
                    '遠隔診療メニュー',
                    style: context.textTheme.bodyLarge,
                  ),
                  RowSeparated(
                      separatorBuilder: (context, index) => SizedBox(
                            width: context.appTheme.spacing.marginMedium,
                          ),
                      children: [
                        Expanded(
                            flex: 3,
                            child: Text(
                              '項目',
                              style: context.textTheme.bodyMedium,
                            )),
                        Expanded(
                            flex: 2,
                            child: Text(
                              '治療費用（税別）',
                              style: context.textTheme.bodyMedium,
                            )),
                        Expanded(
                            flex: 2,
                            child: Text(
                              '治療費用（税込）',
                              style: context.textTheme.bodyMedium,
                            )),
                        Expanded(
                            flex: 3,
                            child: Text(
                              '備考',
                              style: context.textTheme.bodyMedium,
                            )),
                        SizedBox(
                          width: context.appTheme.spacing.marginMedium,
                        ),
                      ]),
                  ReactiveFormArray(
                    formArrayName: 'telemedicineMenu',
                    builder: (context, formArray, child) {
                      final rows = formArray.controls
                          .map(
                            (control) => ReactiveForm(
                              formGroup: control as FormGroup,
                              child: RowSeparated(
                                  separatorBuilder: (context, index) => SizedBox(
                                        width:
                                            context.appTheme.spacing.marginMedium,
                                      ),
                                  children: [
                                    Expanded(
                                        flex: 3,
                                        child: ReactiveTextField(
                                            formControlName: 'project')),
                                    Expanded(
                                      flex: 2,
                                      child: ReactiveTextField(
                                        formControlName:
                                            'treatmentCostExcludingTax',
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'[0-9]')),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: ReactiveTextField(
                                        formControlName:
                                            'treatmentCostTaxIncluded',
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'[0-9]')),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: ReactiveTextField(
                                        formControlName: 'remark',
                                      ),
                                    ),
                                    if (formArray.controls.indexOf(control) == 0)
                                      SizedBox(
                                        width:
                                            context.appTheme.spacing.marginMedium,
                                      ),
                                    if (formArray.controls.indexOf(control) != 0)
                                      SizedBox(
                                        width:
                                            context.appTheme.spacing.marginMedium,
                                        child: IconButton(
                                          icon: const Icon(
                                            Icons.remove_circle,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {
                                            FormGroup formGroup = control;
                                            if (formGroup.control('_id').value !=
                                                null) {
                                              context
                                                  .read<TreatmentModel>()
                                                  .treatmentMenuTeleId
                                                  .value
                                                  .add(formGroup
                                                      .control('_id')
                                                      .value);
                                            }

                                            formArray.removeAt(formArray.controls
                                                .indexOf(control));
                                          },
                                        ),
                                      ),
                                  ]),
                            ),
                          )
                          .toList();
                      return ColumnSeparated(
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(
                          height: context.appTheme.spacing.marginMedium,
                        ),
                        children: rows.toList(),
                      );
                    },
                  ),
                  InkWell(
                    onTap: () => formArray.add(FormGroup({
                      '_id': FormControl<String>(),
                      'project': FormControl<String>(),
                      'hospital': FormControl<String>(value: widget.hospitalId),
                      'treatmentCostExcludingTax': FormControl<double>(),
                      'treatmentCostTaxIncluded': FormControl<double>(),
                      'remark': FormControl<String>(),
                    })),
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
                  ),
                ],
              ),
            ),
          );
        });
  }
}
