// Flutter imports:
import 'dart:ui';
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Project imports:
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
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ElevatedButton(
                                onPressed: !value.loading && form.valid
                                    ? () {
                                        logger.d('保存ボタンが押されました');
                                        logger.d('フォームの有効性: ${form.valid}');
                                        logger.d('フォームの値: ${form.value}');
                                        try {
                                          context
                                              .read<ProgressListModel>()
                                              .submitData(form);
                                        } catch (e) {
                                          logger.e('保存処理でエラーが発生: $e');
                                          snackBarWidget(
                                            message: '保存処理でエラーが発生しました: $e',
                                            backgroundColor: Colors.red,
                                            prefixIcon: const Icon(Icons.error,
                                                color: Colors.white),
                                          );
                                        }
                                      }
                                    : null,
                                child: WithLoadingButton(
                                  isLoading: value.loading,
                                  child: const Text('保存する'),
                                )),
                            if (!form.valid) ...[
                              const SizedBox(height: 8),
                              Text(
                                'フォームにエラーがあります: ${form.errors}',
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ],
                        );
                      },
                    );
                  }),
            )
          ],
        )
      ],
    );
  }

  Widget section(FormGroup formGroup) {
    return ReactiveFormArray(
      formArrayName: 'progressList',
      builder: (context, formArray, child) {
        final rows = formArray.controls
            .map((control) => control as FormGroup)
            .map(
              (currentForm) => ReactiveForm(
                formGroup: currentForm,
                child: listOfItemInSection(
                    formArray.controls.indexOf(currentForm)),
              ),
            )
            .toList();

        return ColumnSeparated(
          crossAxisAlignment: CrossAxisAlignment.start,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          children: [
            ...rows,
            if (rows.length < 3)
              InkWell(
                onTap: () {
                  formArray.add(FormGroup({
                    'progress': FormArray([
                    
                      for (var (i, item) in context
                          .read<ProgressListModel>()
                          .titleList
                          .indexed) ...{
                        FormGroup({
                          '_id': FormControl<String>(),
                          'completed': FormControl<bool>(value: false),
                          'key': FormControl<String>(),
                          'tag': FormControl<String>(
                            value: item.tag,
                          ),
                          'task': FormControl<String>(
                            value: item.task,
                          ),
                          'completionDate': FormControl<DateTime>(
                            validators: [
                              Validators.pattern(
                                ValidatorRegExp.date,
                              ),
                            ],
                          ),
                          'remarks': FormControl<String>(),
                          'medicalRecord': FormControl<String>(),
                          'type': FormControl<String>(
                            value: rows.length.toString(),
                          ),
                          'order': FormControl<int>(value: i),
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

  Widget listOfItemInSection(int index) {
    return ReactiveFormArray(
      formArrayName: 'progress',
      builder: (context, formArray, child) {
        return ColumnSeparated(
            crossAxisAlignment: CrossAxisAlignment.start,
            separatorBuilder: (BuildContext context, int index) => SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                ),
            children: [
              Text(
                index == 0 ? '訪日検診の流れ' : '訪日再生医療の流れ',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Row(
                children: [
                  // ドラッグハンドルの幅に合わせる
                  const SizedBox(width: 40), // Icon + Padding
                  Text('済/未', style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(width: context.appTheme.spacing.marginMedium),
                  SizedBox(
                    width: 100,
                    child: Text('作業者',
                        style: Theme.of(context).textTheme.bodySmall),
                  ),
                  SizedBox(width: context.appTheme.spacing.marginMedium),
                  Expanded(
                    flex: 4,
                    child: Text('タスク',
                        style: Theme.of(context).textTheme.bodySmall),
                  ),
                  SizedBox(width: context.appTheme.spacing.marginMedium),
                  Expanded(
                    flex: 1,
                    child: Text('完了日',
                        style: Theme.of(context).textTheme.bodySmall),
                  ),
                  SizedBox(width: context.appTheme.spacing.marginMedium),
                  Expanded(
                    flex: 2,
                    child: Text('備考',
                        style: Theme.of(context).textTheme.bodySmall),
                  ),
                ],
              ),
              const Divider(),
              ReorderableListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: formArray.controls.length,
                buildDefaultDragHandles: false,
                proxyDecorator:
                    (Widget child, int index, Animation<double> animation) {
                  return AnimatedBuilder(
                    animation: animation,
                    builder: (BuildContext context, Widget? child) {
                      final animValue =
                          Curves.easeInOut.transform(animation.value);
                      final elevation = lerpDouble(0, 8, animValue)!;
                      final scale = lerpDouble(1, 1.05, animValue)!;
                      return Transform.scale(
                        scale: scale,
                        child: Material(
                          elevation: elevation,
                          shadowColor: Colors.black54,
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(8),
                          child: child,
                        ),
                      );
                    },
                    child: child,
                  );
                },
                onReorder: (oldIndex, newIndex) {
                  setState(() {
                    if (oldIndex < newIndex) {
                      newIndex -= 1;
                    }
                    final item = formArray.controls.removeAt(oldIndex);
                    formArray.controls.insert(newIndex, item);

                    for (int i = 0; i < formArray.controls.length; i++) {
                      final formGroup = formArray.controls[i] as FormGroup;
                      // 'order'コントロールが存在するか確認してから値を設定
                      if (formGroup.contains('order')) {
                         formGroup.control('order').value = i;
                      }
                    }

                    formArray.markAsTouched();
                  });
                },
                itemBuilder: (context, itemIndex) {
                  final formGroup = formArray.controls[itemIndex] as FormGroup;
                  
                  // ReorderableListViewが期待する構造：
                  // トップレベルのウィジェットにキーを設定
                  return Container(
                    key: ObjectKey(formGroup),
                    margin: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      children: [
                        // ReorderableDragStartListenerをRowの子として配置
                        ReorderableDragStartListener(
                          index: itemIndex,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                            child: Icon(
                              Icons.drag_handle,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        // コンテンツ部分
                        Expanded(
                          child: ReactiveForm(
                            formGroup: formGroup,
                            child: ProgressRecordWidget(
                              onDelete: () {
                                setState(() {
                                  formArray.removeAt(itemIndex);
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              InkWell(
                onTap: () {
                  formArray.add(
                    FormGroup({
                      '_id': FormControl<String>(),
                      'completed': FormControl<bool>(value: false),
                      'key': FormControl<String>(),
                      'tag': FormControl<String>(value: '当社'),
                      'task': FormControl<String>(),
                      'completionDate': FormControl<DateTime>(
                        validators: [
                          Validators.pattern(
                            ValidatorRegExp.date,
                          ),
                        ],
                      ),
                      'remarks': FormControl<String>(),
                      'medicalRecord': FormControl<String>(),
                      'type': FormControl<String>(value: index.toString()),
                      'order': FormControl<int>(value: formArray.controls.length),
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