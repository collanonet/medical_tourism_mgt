import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'type_model.dart';

class ReportTypeScreen extends StatefulWidget {
  const ReportTypeScreen({super.key});

  @override
  State<ReportTypeScreen> createState() => _ReportTypeScreenState();
}

class _ReportTypeScreenState extends State<ReportTypeScreen> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: context.read<TypeModel>().data,
        builder: (context, value, _) {
          return Skeletonizer(
            enabled: value.loading,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.all(context.appTheme.spacing.gutter),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        context.appTheme.spacing.borderRadiusMedium),
                  ),
                  child: const Text(
                    '種別マスタ',
                    style: TextStyle(
                      fontFamily: 'NotoSansJP',
                      package: 'core_ui',
                    ),
                  ),
                ),
                SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(context.appTheme.spacing.gutter),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                          context.appTheme.spacing.borderRadiusMedium),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                            child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ReactiveFormArray(
                                  formArrayName: 'type',
                                  builder: (context, formArray, _) {
                                    final rows = formArray.controls
                                        .map((control) => control as FormGroup)
                                        .map((currentForm) {
                                      return ReactiveForm(
                                        formGroup: currentForm,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text('type'),
                                                SizedBox(
                                                  height: context.appTheme
                                                      .spacing.marginMedium,
                                                ),
                                                IntrinsicWidth(
                                                  stepWidth: 300,
                                                  child: ReactiveTextField(
                                                    formControlName: 'typeName',
                                                    decoration: InputDecoration(
                                                      labelText: '種別名',
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: context.appTheme.spacing
                                                  .marginMedium,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text('color'),
                                                SizedBox(
                                                  height: context.appTheme
                                                      .spacing.marginMedium,
                                                ),
                                                IntrinsicWidth(
                                                  stepWidth: 150,
                                                  child: ReactiveTextField(
                                                    formControlName: 'color',
                                                    decoration: InputDecoration(
                                                      labelText: '色',
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: context.appTheme.spacing
                                                  .marginMedium,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  SizedBox(
                                                    height: 35,
                                                  ),
                                                  if (formArray.controls
                                                          .indexOf(
                                                              currentForm) >
                                                      0)
                                                    IconButton(
                                                        onPressed: () {
                                                          if (formArray.controls
                                                                  .indexOf(
                                                                      currentForm) >
                                                              0) {
                                                            formArray.removeAt(
                                                                formArray
                                                                    .controls
                                                                    .indexOf(
                                                                        currentForm));
                                                          }
                                                        },
                                                        icon: Icon(
                                                          Icons.remove_circle,
                                                          color: Colors.red,
                                                        )),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    });

                                    return ColumnSeparated(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return SizedBox(
                                          height: context
                                              .appTheme.spacing.marginMedium,
                                        );
                                      },
                                      children: [
                                        ...rows,
                                        ElevatedButton(
                                          onPressed: () {
                                            formArray.add(
                                              FormGroup({
                                                'typeName': FormControl<String>(
                                                  validators: [
                                                    Validators.required
                                                  ],
                                                ),
                                                'color': FormControl<String>(
                                                  validators: [
                                                    Validators.required
                                                  ],
                                                ),
                                              }),
                                            );
                                          },
                                          child: const Text('さらに追加'),
                                        ),
                                      ],
                                    );
                                  })
                            ],
                          ),
                        )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                context.read<TypeModel>().createOrUpdate(
                                    (ReactiveForm.of(context) as FormGroup)
                                        .control('type') as FormArray);
                              },
                              child: const Text('保存する'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  // AlertDialog showColorPicker() {
  //   return AlertDialog(
  //     content: SizedBox(
  //       width: 200,
  //       height: 200,
  //       child: Padding(
  //         padding: const EdgeInsets.all(6),
  //         child: Card(
  //           elevation: 2,
  //           child: ColorPicker(
  //             color: currentForm.control('color').value == null
  //                 ? Colors.blue
  //                 : ColorUtils.stringToColor(
  //                     currentForm.control('color').value),
  //             onColorChanged: (Color color) {
  //               currentForm.control('color').value =
  //                   ColorUtils.stringToHexColor(color.toString());
  //             },
  //             width: 44,
  //             height: 44,
  //             borderRadius: 22,
  //             heading: Text(
  //               'Select color',
  //               style: Theme.of(context).textTheme.headlineSmall,
  //             ),
  //             subheading: Text(
  //               'Select color shade',
  //               style: Theme.of(context).textTheme.titleSmall,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
