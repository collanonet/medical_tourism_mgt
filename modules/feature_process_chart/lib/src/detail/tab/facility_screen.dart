import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FacilityScreen extends StatefulWidget {
  const FacilityScreen({super.key});

  @override
  State<FacilityScreen> createState() => _FacilityScreenState();
}

class _FacilityScreenState extends State<FacilityScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ReactiveFormArray(
            formArrayName: 'Hotel',
            builder: (context, formArray, child) {
              final rows =
                  formArray.controls.map((control) => control as FormGroup).map(
                        (currentForm) => ReactiveForm(
                          formGroup: currentForm,
                          child: ColumnSeparated(
                            separatorBuilder: (BuildContext context, int index) {
                              return SizedBox(
                                height: context.appTheme.spacing.marginMedium,
                              );
                            },
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: ReactiveTextField(
                                      formControlName:
                                          'Person_in_charge_of_arrangements',
                                      decoration: InputDecoration(
                                        label: Text(
                                          '手配担当',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: context.appTheme.spacing.marginMedium,
                                  ),
                                 Expanded(child: SizedBox()),
                                  SizedBox(
                                    width: context.appTheme.spacing.marginMedium,
                                  ),
                                  Expanded(child: SizedBox()),
                                ],
                              ),

                            ],
                          ),
                        ),
                      );

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ColumnSeparated(
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: context.appTheme.spacing.marginMedium,
                      );
                    },
                    children: rows.toList(),
                  ),
                  SizedBox(
                    height: context.appTheme.spacing.marginMedium,
                  ),
                  InkWell(
                    onTap: () => formArray.add(
                      FormGroup({
                        'Person_in_charge_of_arrangements':
                            FormControl<String>(value: ''), // 手配担当
                        'Name_of_facility':
                            FormControl<String>(value: ''), // 施設名
                        'location': FormControl<String>(value: ''), // 所在地
                        'Person_in_charge_name':
                            FormControl<String>(value: ''), // 担当者名
                        'telephone_number':
                            FormControl<String>(value: ''), // 電話番号
                        'remarks': FormControl<String>(value: ''), // 備考
                        'Foreign_language_staff':
                            FormControl<String>(value: ''), // 外国語スタッフ
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
                          style:
                              TextStyle(color: context.appTheme.primaryColor),
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
