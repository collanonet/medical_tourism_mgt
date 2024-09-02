// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/entities.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'contract_form.dart';
import 'contract_model.dart';
import 'contrant_file.dart';

class ContractScreen extends StatefulWidget {
  const ContractScreen({super.key, required this.id});
  final String id;
  @override
  State<ContractScreen> createState() => _ContractScreenState();
}

class _ContractScreenState extends State<ContractScreen> {
  ValueNotifier<List<String>> selected = ValueNotifier([]);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: context.read<ContractModel>().contrantData,
        builder: (context, value, _) {
          return Column(
            children: [
              Expanded(
                child: Column(
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
                          color: Colors.white,
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
                                  '契約書をここにドラッグ＆ドロップ',
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
                                        showCreateWithFileDialog(
                                            context, value);
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
                    SizedBox(
                      height: context.appTheme.spacing.marginMedium,
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
                        const Expanded(flex: 2, child: Text('書類名')),
                        const Expanded(child: Text('締結日')),
                      ],
                    ),
                    SizedBox(
                      height: context.appTheme.spacing.marginMedium,
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemCount: value.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          final data = value.data?[index];

                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                ValueListenableBuilder(
                                    valueListenable: selected,
                                    builder: (context, sels, _) {
                                      return Checkbox(
                                        value: sels.contains(data?.id),
                                        onChanged: (sel) {
                                          if (sel != null) {
                                            if (sel) {
                                              selected.value = [
                                                ...sels,
                                                data?.id ?? ''
                                              ];
                                            } else {
                                              selected.value = [
                                                ...sels
                                                    .where((e) => e != data?.id)
                                              ];
                                            }
                                          }
                                        },
                                      );
                                    }),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                      value.requireData[index].fileName ?? ''),
                                ),
                                Expanded(
                                  child: Text(value
                                              .requireData[index].updatedAt ==
                                          null
                                      ? ''
                                      : Dates.formShortDate(
                                          value.requireData[index].updatedAt)),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider(
                            color: Colors.grey,
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ValueListenableBuilder(
                  valueListenable: selected,
                  builder: (context, sels, _) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ValueListenableListener(
                          valueListenable: context.read<ContractModel>().delete,
                          onListen: () {
                            var delete =
                                context.read<ContractModel>().delete.value;

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
                              valueListenable:
                                  context.read<ContractModel>().delete,
                              builder: (context, value, _) {
                                return OutlinedButton(
                                    onPressed: sels.isEmpty || value.loading
                                        ? null
                                        : () {
                                            showDialog(
                                                context: context,
                                                builder: (_) {
                                                  return Provider.value(
                                                    value: context
                                                        .read<ContractModel>(),
                                                    child: AlertDialog(
                                                      title: const Text('削除確認'),
                                                      content: const Text(
                                                          '選択した書類を削除しますか？'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: const Text(
                                                              'キャンセル'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            context
                                                                .read<
                                                                    ContractModel>()
                                                                .deleteContractAgent(
                                                                    sels);
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: const Text(
                                                              '削除する'),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                });
                                          },
                                    child: WithLoadingButton(
                                      isLoading: value.loading,
                                      loadingColor:
                                          context.appTheme.primaryColor,
                                      child: Text(
                                        '削除する',
                                        style: context.textTheme.labelLarge
                                            ?.copyWith(
                                                color: context
                                                    .appTheme.primaryColor),
                                      ),
                                    ));
                              }),
                        ),
                        SizedBox(
                          width: context.appTheme.spacing.marginMedium,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('印刷する'),
                        )
                      ],
                    );
                  })
            ],
          );
        });
  }

  void showCreateWithFileDialog(BuildContext context, FileSelect file) {
    showDialog(
      context: context,
      builder: (_) => Provider.value(
        value: context.read<ContractModel>(),
        child: AlertDialog(
          content: ReactiveFormConfig(
            validationMessages: validationMessages,
            child: ReactiveFormBuilder(
              form: () => contractForm(agentRecordId: widget.id, file: file)
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
