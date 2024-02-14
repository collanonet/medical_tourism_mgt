import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../basic_info_model.dart';

class MedicalRecordTravelGroupSection extends StatelessWidget {
  const MedicalRecordTravelGroupSection({super.key});

  @override
  Widget build(BuildContext context) {
    final formArray = ((ReactiveForm.of(context) as FormGroup)
            .control('travelGroup') as FormGroup)
        .control('travelGroup') as FormArray;
    return ValueListenableBuilder(
      valueListenable:
          context.read<BasicInformationModel>().medicalRecordTravelGroups,
      builder: (context, value, _) => Skeletonizer(
        enabled: value.loading,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'グループ', // TODO: l10n 対応 (グループ) (group)
              style: context.textTheme.titleMedium,
            ),
            Row(
              children: [
                const Text('グループリーダーに'),
                SizedBox(
                  width: context.appTheme.spacing.marginMedium,
                ),
                ReactiveValueListenableBuilder(
                    formControlName: 'travelGroup.toGroupLeader',
                    builder: (context, control, _) {
                      return AnimatedToggleSwitch<String>.size(
                          textDirection: TextDirection.rtl,
                          current: control.value == true ? 'する' : 'しない',
                          values: const ['する', 'しない'],
                          iconList: [
                            Text('しない'),
                            Text('する'),
                          ],
                          indicatorSize: const Size.fromWidth(100),
                          borderWidth: 4.0,
                          iconAnimationType: AnimationType.onHover,
                          style: ToggleStyle(
                            borderColor: Colors.transparent,
                            borderRadius: BorderRadius.circular(10.0),
                            backgroundColor: Colors.white,
                            indicatorColor: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: Offset(0, 1.5),
                              ),
                            ],
                          ),
                          styleBuilder: (i) => ToggleStyle(
                                indicatorColor: context.appTheme.primaryColor,
                                backgroundColor: Colors.white,
                              ),
                          onChanged: (i) {
                            control.value = i == 'する';
                          });
                    }),
              ],
            ),
            SizedBox(
              height: context.appTheme.spacing.marginMedium,
            ),
            ReactiveFormArray(
              formArrayName: 'travelGroup.travelGroup',
              builder: (context, formArray, child) {
                final rows = formArray.controls
                    .map((control) => control as FormGroup)
                    .map(
                      (currentForm) => ReactiveForm(
                        formGroup: currentForm,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '病院名',
                              style: context.textTheme.bodyMedium,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: ReactiveTextField(
                                    formControlName: 'name',
                                    decoration: InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.search,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                Expanded(
                                    child: Row(
                                  children: [
                                    if (formArray.controls
                                            .indexOf(currentForm) !=
                                        0)
                                      IconButton(
                                          onPressed: () {
                                            formArray.removeAt(formArray
                                                .controls
                                                .indexOf(currentForm));
                                          },
                                          icon: Icon(
                                            Icons.delete_forever,
                                            color: Colors.red,
                                          )),
                                  ],
                                ))
                              ],
                            ),
                          ],
                        ),
                      ),
                    );

                return ColumnSeparated(
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                    height: context.appTheme.spacing.marginMedium,
                  ),
                  children: rows.toList(),
                );
              },
            ),
            SizedBox(
              height: context.appTheme.spacing.marginMedium,
            ),
            InkWell(
              onTap: () => formArray.add(FormGroup({
                'name': FormControl<String?>(),
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
                    '患者を追加',
                    style: TextStyle(color: context.appTheme.primaryColor),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
