
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class TelemedicineMenuSection extends StatefulWidget {
  const TelemedicineMenuSection({super.key});

  @override
  State<TelemedicineMenuSection> createState() =>
      _TelemedicineMenuSectionState();
}

class _TelemedicineMenuSectionState extends State<TelemedicineMenuSection> {
  @override
  Widget build(BuildContext context) {
    final formArray = (ReactiveForm.of(context) as FormGroup)
        .control('telemedicineMenu') as FormArray;
    return ColumnSeparated(
      crossAxisAlignment: CrossAxisAlignment.start,
      separatorBuilder: (context, index) => SizedBox(
        height: context.appTheme.spacing.marginExtraSmall,
      ),
      children: [
        Text(
          '遠隔診療メニュー',
          style: context.textTheme.bodyLarge,
        ),
        RowSeparated(
            separatorBuilder: (context, index) => SizedBox(
                  width: context.appTheme.spacing.formSpacing,
                ),
            children: [
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),
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
            ]),
        ReactiveFormArray(
          formArrayName: 'telemedicineMenu',
          builder: (context, formArray, child) {
            final rows = formArray.controls
                .map((control) => ReactiveForm(
                    formGroup: control as FormGroup,
                    child: RowSeparated(
                        separatorBuilder: (context, index) => SizedBox(
                              width: context.appTheme.spacing.formSpacing,
                            ),
                        children: [
                          Expanded(
                              flex: 3,
                              child: ReactiveTextField(
                                  formControlName: 'project')),
                          Expanded(
                            flex: 2,
                            child: ReactiveTextField(
                              formControlName: 'treatingCostExcludingTax',
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: ReactiveTextField(
                              formControlName: 'treatingCostIncludingTax',
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: ReactiveTextField(
                              formControlName: 'remarks',
                            ),
                          ),
                          MaterialButton(
                            onPressed: () => formArray
                                .removeAt(formArray.controls.indexOf(control)),
                            child: Icon(
                              Icons.remove_circle,
                              color: context.appTheme.primaryColor,
                            ),
                          )
                        ])))
                .toList();
            return ColumnSeparated(
              separatorBuilder: (BuildContext context, int index) => SizedBox(
                height: context.appTheme.spacing.marginMedium,
              ),
              children: rows.toList(),
            );
          },
        ),
        InkWell(
          onTap: () => formArray.add(FormGroup({
            'project': FormControl<String>(),
            'treatingCostExcludingTax': FormControl<String>(),
            'treatingCostIncludingTax': FormControl<String>(),
            'remarks': FormControl<String>(),
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
    );
  }
}
