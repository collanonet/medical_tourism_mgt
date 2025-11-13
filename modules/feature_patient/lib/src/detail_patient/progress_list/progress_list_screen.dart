// Flutter imports:
import 'dart:ui';
import 'package:flutter/material.dart';

// Package imports:
import 'package:collection/collection.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Project imports:
import '../detail_patient_model.dart';
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

    return ValueListenableListener(
      valueListenable: context.read<ProgressListModel>().medicalRecord,
      onListen: () {
        final value = context.read<ProgressListModel>().medicalRecord.value;
        if (value.hasData) {
          context
              .read<DetailPatientModel>()
              .updateMedicalRecord(value.requireData);
        }
      },
      child: Column(
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
                    final latest =
                        context.read<ProgressListModel>().medicalRecord.value;
                    if (latest.hasData) {
                      context
                          .read<DetailPatientModel>()
                          .updateMedicalRecord(latest.requireData);
                    }
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
      ),
    );
  }

  Widget section(FormGroup formGroup) {
    return ReactiveFormArray(
      formArrayName: 'progressList',
      builder: (context, formArray, child) {
        final rows =
            formArray.controls.map((control) => control as FormGroup).toList();
        final model = context.read<ProgressListModel>();

        return ColumnSeparated(
          crossAxisAlignment: CrossAxisAlignment.start,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          children: [
            for (final (sectionIndex, sectionForm) in rows.indexed)
              ReactiveForm(
                formGroup: sectionForm,
                child: listOfItemInSection(sectionForm, sectionIndex),
              ),
            InkWell(
              onTap: () async {
                final template = await _selectSectionTemplate(context);
                if (template == null) return;
                setState(() {
                  formArray.add(model.createSectionFormGroup(template));
                  formArray.markAsDirty();
                });
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

  Future<ProgressSectionTemplate?> _selectSectionTemplate(
      BuildContext context) async {
    final templates = context.read<ProgressListModel>().sectionTemplates;
    if (templates.isEmpty) return null;
    return showModalBottomSheet<ProgressSectionTemplate>(
      context: context,
      builder: (context) {
        String selectedId = templates.first.id;
        return SafeArea(
          child: StatefulBuilder(
            builder: (context, setStateSB) {
              final selectedTemplate = templates.firstWhereOrNull(
                (template) => template.id == selectedId,
              );
              return FractionallySizedBox(
                heightFactor: 0.6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Text(
                        'セクションを選択',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    const Divider(height: 1),
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        children: templates
                            .map(
                              (template) => RadioListTile<String>(
                                title: Text(template.title),
                                value: template.id,
                                groupValue: selectedId,
                                onChanged: (value) {
                                  if (value == null) return;
                                  setStateSB(() {
                                    selectedId = value;
                                  });
                                },
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    const Divider(height: 1),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('キャンセル'),
                          ),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: selectedTemplate == null
                                ? null
                                : () => Navigator.of(context)
                                    .pop(selectedTemplate),
                            child: const Text('決定'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget listOfItemInSection(FormGroup sectionGroup, int index) {
    return ReactiveFormArray(
      formArrayName: 'progress',
      builder: (context, formArray, child) {
        final model = context.read<ProgressListModel>();
        final sectionType = sectionGroup.contains('sectionType')
            ? sectionGroup.control('sectionType').value as String?
            : null;
        final template =
            model.resolveTemplateById(sectionType, fallbackIndex: index);

        return ColumnSeparated(
            crossAxisAlignment: CrossAxisAlignment.start,
            separatorBuilder: (BuildContext context, int index) => SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                ),
            children: [
              Text(
                template.displayTitle,
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
                  SizedBox(
                    width: 160,
                    child: Text(
                      '完了日',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
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
                  setState(() {
                    formArray.add(
                      FormGroup({
                        '_id': FormControl<String>(),
                        'completed': FormControl<bool>(value: false),
                        'key': FormControl<String>(value: template.id),
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
                        'type':
                            FormControl<String>(value: template.serverType),
                        'order':
                            FormControl<int>(value: formArray.controls.length),
                      }),
                    );
                    formArray.markAsDirty();
                  });
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