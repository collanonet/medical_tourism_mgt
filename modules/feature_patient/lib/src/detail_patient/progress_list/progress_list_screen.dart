import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'progress_list_model.dart';
import 'progress_record_widget.dart';

class ProgressListScreen extends StatefulWidget {
  const ProgressListScreen({super.key});

  @override
  State<ProgressListScreen> createState() => _ProgressListScreenState();
}

class _ProgressListScreenState extends State<ProgressListScreen> {
  @override
  Widget build(BuildContext context) {
    final formGroup = ReactiveForm.of(context) as FormGroup;

    return Column(
      children: [
        const SizedBox(height: 16),
        Expanded(
          child: ValueListenableBuilder(
            valueListenable:
                context.read<ProgressListModel>().medicalRecordsProgress,
            builder: (context, value, child) => Skeletonizer(
              enabled: value.loading,
              child: SingleChildScrollView(
                child: section(formGroup),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ValueListenableListener(
              valueListenable: context.read<ProgressListModel>().submit,
              onListen: () {
                final value = context.read<ProgressListModel>().submit.value;
                if (value.hasData) {
                  snackBarWidget(
                    message: '正常に保存されました',
                    prefixIcon:
                        const Icon(Icons.check_circle, color: Colors.white),
                  );
                }

                if (value.hasError) {
                  snackBarWidget(
                    message: '保存できませんでした。 もう一度試してください。',
                    backgroundColor: Colors.red,
                    prefixIcon: const Icon(Icons.error, color: Colors.white),
                  );
                }
              },
              child: ValueListenableBuilder(
                  valueListenable: context.read<ProgressListModel>().submit,
                  builder: (context, value, child) {
                    return ReactiveFormConsumer(
                      builder: (context, form, _) {
                        return ElevatedButton(
                            onPressed: !value.loading && form.valid
                                ? () => context
                                    .read<ProgressListModel>()
                                    .submitData(form)
                                : null,
                            child: WithLoadingButton(
                              isLoading: value.loading,
                              child: Text('保存する'),
                            ));
                      },
                    );
                  }),
            )
          ],
        )
      ],
    );
  }

  ReactiveFormArray<Object?> section(FormGroup formGroup) {
    return ReactiveFormArray(
      formArrayName: 'progressList',
      builder: (context, formArray, child) {
        final rows =
            formArray.controls.map((control) => control as FormGroup).map(
                  (currentForm) => ReactiveForm(
                    formGroup: currentForm,
                    child: listOfItemInSection(
                        formArray.controls.indexOf(currentForm)),
                  ),
                );

        return ColumnSeparated(
          crossAxisAlignment: CrossAxisAlignment.start,
          separatorBuilder: (BuildContext context, int index) => Divider(),
          children: [
            ...rows,
            if (rows.length < 3)
              InkWell(
                onTap: () {
                  formArray.add(FormGroup({
                    'progress': FormArray([
                      // record of item
                      for (ItemProgress item
                          in context.read<ProgressListModel>().titleList) ...{
                        FormGroup({
                          'id': FormControl<String>(),
                          'completed': FormControl<bool>(value: false),
                          'key': FormControl<String>(),
                          'tag': FormControl<String>(
                            value: item.tag,
                          ),
                          'task': FormControl<String>(
                            value: item.task,
                            disabled: true,
                          ),
                          'completionDate': FormControl<DateTime>(validators: [
                            Validators.pattern(
                              ValidatorRegExp.date,
                            ),
                          ],),
                          'remarks': FormControl<String>(),
                          'medicalRecord': FormControl<String>(),
                          'type': FormControl<String>(
                            value: rows.length.toString(),
                          ),
                        }),
                      }
                    ]),
                  }));
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_box_rounded,
                      color: context.appTheme.primaryColor,
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginSmall,
                    ),
                    Text(
                      'さらにセクションを追加',
                      style: TextStyle(color: context.appTheme.primaryColor),
                    )
                  ],
                ),
              )
          ],
        );
      },
    );
  }

  ReactiveFormArray<Object?> listOfItemInSection(int index) {
    return ReactiveFormArray(
      formArrayName: 'progress',
      builder: (context, formArray, child) {
        final rows =
            formArray.controls.map((control) => control as FormGroup).map(
                  (currentForm) => ReactiveForm(
                    formGroup: currentForm,
                    child: const ProgressRecordWidget(),
                  ),
                );

        return ColumnSeparated(
            crossAxisAlignment: CrossAxisAlignment.start,
            separatorBuilder: (BuildContext context, int index) => SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                ),
            children: [
              Text(
                '訪日再生医療の流れ',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Row(
                children: [
                  SizedBox(
                    width: context.appTheme.spacing.marginMedium,
                  ),
                  Text('済/未', style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(
                    width: context.appTheme.spacing.marginExtraLarge * 2,
                  ),
                  SizedBox(
                    width: context.appTheme.spacing.marginExtraLarge,
                  ),
                  Expanded(
                      flex: 4,
                      child: Text('タスク',
                          style: Theme.of(context).textTheme.bodySmall)),
                  SizedBox(
                    width: context.appTheme.spacing.marginMedium,
                  ),
                  Expanded(
                      flex: 2,
                      child: Text('完了日',
                          style: Theme.of(context).textTheme.bodySmall)),
                  SizedBox(
                    width: context.appTheme.spacing.marginMedium,
                  ),
                  Expanded(
                      flex: 2,
                      child: Text('備考',
                          style: Theme.of(context).textTheme.bodySmall)),
                ],
              ),
              const Divider(),
              ...rows,
              InkWell(
                onTap: () {
                  formArray.add(
                    FormGroup({
                      'id': FormControl<String>(),
                      'completed': FormControl<bool>(value: false),
                      'key': FormControl<String>(),
                      'tag': FormControl<String>(),
                      'task': FormControl<String>(),
                      'completionDate': FormControl<DateTime>(validators: [
                        Validators.pattern(
                          ValidatorRegExp.date,
                        ),
                      ],),
                      'remarks': FormControl<String>(),
                      'medicalRecord': FormControl<String>(),
                      'type': FormControl<String>(value: index.toString()),
                    }),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_box_rounded,
                      color: context.appTheme.primaryColor,
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginSmall,
                    ),
                    Text(
                      'さらにアイテムを追加',
                      style: TextStyle(color: context.appTheme.primaryColor),
                    )
                  ],
                ),
              )
            ]);
      },
    );
  }
}
