import 'package:core_l10n/l10n.dart';
import 'package:core_network/entities.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'health_checkup_file.dart';
import 'health_checkup_form.dart';
import 'health_checkup_model.dart';

class HealthCheckupSection extends StatefulWidget {
  const HealthCheckupSection({super.key, required this.id});
  final String id;

  @override
  State<HealthCheckupSection> createState() => _HealthCheckupSectionState();
}

class _HealthCheckupSectionState extends State<HealthCheckupSection> {
  ValueNotifier<List<String>> selected = ValueNotifier([]);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: context.read<HealthModel>().healthData,
      builder: (context, value, child) {
        return ColumnSeparated(
          separatorBuilder: (context, index) => SizedBox(
            height: context.appTheme.spacing.formSpacing,
          ),
          children: [
            InkWell(
              onTap: () {
                filePicker().then((value) {
                  if (value != null) {
                    showCreateWithFileDialog(context, value);
                  }
                });
              },
              child: Container(
                padding: EdgeInsets.all(
                  context.appTheme.spacing.marginExtraLarge,
                ),
                decoration: BoxDecoration(
                  // color: Colors.blueGrey,
                  borderRadius: BorderRadius.all(Radius.circular(
                    context.appTheme.spacing.borderRadiusMedium,
                  )),
                  border: Border.all(
                    color: context.appTheme.primaryColor,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.copy_all_rounded,
                      size: 50,
                      color: context.appTheme.primaryColor,
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    Column(
                      children: [
                        Text(
                          'パンフレットや資料をここにドラッグ＆ドロップ',
                          style: context.textTheme.bodySmall?.copyWith(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: context.appTheme.spacing.marginMedium,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            filePicker().then((value) {
                              if (value != null) {
                                showCreateWithFileDialog(context, value);
                              }
                            });
                          },
                          child: const Text(
                            'またはファイルを選択する',
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Row(
              children: [
                ValueListenableBuilder(
                    valueListenable: selected,
                    builder: (context, ids, _) {
                      return Checkbox(
                        value: ids.isEmpty
                            ? false
                            : value.data?.length == ids.length,
                        onChanged: (select) {
                          if (select != null) {
                            if (select) {
                              if (value.hasData) {
                                selected.value = value.requireData
                                    .map((e) => e.id.toString())
                                    .toList();
                              }
                            } else {
                              selected.value = [];
                            }
                          }
                        },
                      );
                    }),
                const Expanded(flex: 2, child: Text('ファイル名ファイル名')),
                const Expanded(child: Text('更新日')),
                const Expanded(child: Text('')),
              ],
            ),
            Expanded(
              child: ListView.separated(
                itemCount: value.data?.length ?? 0,
                itemBuilder: (context, index) {
                  final data = value.data?[index];

                  return Row(
                    children: [
                      ValueListenableBuilder(
                          valueListenable: selected,
                          builder: (context, sels, _) {
                            return Checkbox(
                              value: sels.contains(data?.id),
                              onChanged: (sel) {
                                if (sel != null) {
                                  if (sel) {
                                    selected.value = [...sels, data?.id ?? ''];
                                  } else {
                                    selected.value = [
                                      ...sels.where((e) => e != data?.id)
                                    ];
                                  }
                                }
                              },
                            );
                          }),
                      Expanded(
                        flex: 2,
                        child: Text(data?.fileName ?? ''),
                      ),
                      Expanded(
                        child: Text(
                          data?.uploadDate == null
                              ? ''
                              : Dates.formShortDate(data?.uploadDate),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    color: Colors.grey,
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ValueListenableBuilder(
                  valueListenable: selected,
                  builder: (context, sels, _) {
                    return ValueListenableListener(
                      valueListenable: context.read<HealthModel>().delete,
                      onListen: () {
                        var delete = context.read<HealthModel>().delete.value;

                        if (delete.hasError) {
                          snackBarWidget(
                            message: '削除に失敗しました',
                            backgroundColor: Colors.red,
                            prefixIcon: const Icon(
                              Icons.error,
                              color: Colors.white,
                            ),
                          );
                        }

                        if (delete.hasData) {
                          selected.value = [];
                          snackBarWidget(
                            message: '削除しました',
                            prefixIcon: const Icon(
                              Icons.check_circle,
                              color: Colors.white,
                            ),
                          );
                        }
                      },
                      child: ValueListenableBuilder(
                          valueListenable: context.read<HealthModel>().delete,
                          builder: (context, value, _) {
                            return OutlinedButton(
                                onPressed: sels.isEmpty || value.loading
                                    ? null
                                    : () {
                                        showDialog(
                                            context: context,
                                            builder: (_) {
                                              return Provider.value(
                                                value:
                                                    context.read<HealthModel>(),
                                                child: AlertDialog(
                                                  title: const Text('削除確認'),
                                                  content:
                                                      const Text('選択した書類を削除しますか？'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: const Text('キャンセル'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        context
                                                            .read<HealthModel>()
                                                            .deleteHealth(sels);
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: const Text('削除する'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            });
                                      },
                                child: WithLoadingButton(
                                  isLoading: value.loading,
                                  loadingColor: context.appTheme.primaryColor,
                                  child: Text(
                                    '削除する',
                                    style: context.textTheme.labelLarge
                                        ?.copyWith(
                                            color:
                                                context.appTheme.primaryColor),
                                  ),
                                ));
                          }),
                    );
                  }),
            ),
          ],
        );
      },
    );
  }

  void showCreateWithFileDialog(BuildContext context, FileSelect file) {
    showDialog(
      context: context,
      builder: (_) => Provider.value(
        value: context.read<HealthModel>(),
        child: AlertDialog(
          content: ReactiveFormConfig(
            validationMessages: <String, ValidationMessageFunction>{
              ValidationMessage.required: (error) =>
                  context.l10n.mgsFieldRequired,
            },
            child: ReactiveFormBuilder(
              form: () =>
                  healthCheckupForm(hospitalRecordId: widget.id, file: file)
                    ..markAllAsTouched(),
              builder: (context, formGroup, child) {
                return const Popup();
              },
            ),
          ),
        ),
      ),
    );
  }
}
