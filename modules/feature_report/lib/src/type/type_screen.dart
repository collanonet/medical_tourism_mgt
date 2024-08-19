import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
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
                                            IntrinsicWidth(
                                              stepWidth: 300,
                                              child: ReactiveTextField(
                                                formControlName: 'typeName',
                                              ),
                                            ),
                                            SizedBox(
                                              width: context.appTheme.spacing
                                                  .marginMedium,
                                            ),
                                            ReactiveValueListenableBuilder<
                                                    String>(
                                                formControlName: 'color',
                                                builder: (context, control, _) {
                                                  return InkWell(
                                                    onTap: () {
                                                      showColorPicker(
                                                          currentForm, control);
                                                    },
                                                    child: Container(
                                                      width: 45,
                                                      height: 45,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                          color: Colors.black,
                                                        ),
                                                        color: ColorUtils
                                                            .stringToColor(
                                                          control.value!,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                            SizedBox(
                                              width: context.appTheme.spacing
                                                  .marginMedium,
                                            ),
                                            if (formArray.controls
                                                        .indexOf(currentForm) >
                                                    0 &&
                                                currentForm
                                                        .control('id')
                                                        .value ==
                                                    null)
                                              IconButton(
                                                  onPressed: () {
                                                    if (formArray.controls
                                                            .indexOf(
                                                                currentForm) >
                                                        0) {
                                                      formArray.removeAt(
                                                          formArray.controls
                                                              .indexOf(
                                                                  currentForm));
                                                    }
                                                  },
                                                  icon: Icon(
                                                    Icons.remove_circle,
                                                    color: Colors.red,
                                                  ))
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
                                                'id': FormControl<String>(),
                                                'typeName': FormControl<String>(
                                                  validators: [
                                                    Validators.required
                                                  ],
                                                ),
                                                'color': FormControl<String>(
                                                  value: 'FFFFFF',
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
                        ValueListenableListener(
                          valueListenable: context.read<TypeModel>().submitData,
                          onListen: () {
                            final data =
                                context.read<TypeModel>().submitData.value;

                            if (data.hasData) {
                              logger.d('loading');
                              snackBarWidget(
                                message: '正常に保存されました',
                                prefixIcon: const Icon(Icons.check_circle,
                                    color: Colors.white),
                              );
                            }

                            if (data.hasError) {
                              snackBarWidget(
                                message: '保存できませんでした。 もう一度試してください。',
                                backgroundColor: Colors.red,
                                prefixIcon: const Icon(Icons.error,
                                    color: Colors.white),
                              );
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  context.read<TypeModel>().createOrUpdate(
                                      ReactiveForm.of(context) as FormGroup);
                                },
                                child: const Text('保存する'),
                              ),
                            ],
                          ),
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

  void showColorPicker(FormGroup currentForm, AbstractControl control) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                margin: EdgeInsets.zero,
                elevation: 2,
                child: ColorPicker(
                  pickersEnabled: const <ColorPickerType, bool>{
                    ColorPickerType.both: false,
                    ColorPickerType.primary: false,
                    ColorPickerType.accent: false,
                    ColorPickerType.wheel: true,
                  },
                  pickerTypeLabels: const <ColorPickerType, String>{
                    ColorPickerType.both: 'Both',
                    ColorPickerType.primary: 'Primary',
                    ColorPickerType.accent: 'Accent',
                    ColorPickerType.wheel: 'Any',
                  },
                  color: ColorUtils.stringToColor(control.value),
                  onColorChanged: (Color color) {
                    control.value = color.hex;
                  },
                  width: 44,
                  height: 44,
                  borderRadius: 22,
                  title: const Text('色の選択'),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('キャンセル'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
