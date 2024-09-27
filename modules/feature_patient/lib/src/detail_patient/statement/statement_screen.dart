// Flutter imports:
import 'package:core_utils/async.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'statement_model.dart';
import 'statement_screen_form.dart';

class StatementScreen extends StatelessWidget {
  const StatementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<List<String>> selected = ValueNotifier([]);
    return ValueListenableBuilder(
      valueListenable: context.watch<StatementModel>().medicalInvoiceData,
      builder: (context, value, _) {
        return Skeletonizer(
          enabled: value.loading,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                            },
                          ),
                          Expanded(
                              child: Text(
                            '書類番号', // Document Number
                            style: context.textTheme.bodySmall,
                          )),
                          Expanded(
                              child: Text(
                            '種別', // type
                            style: context.textTheme.bodySmall,
                          )),
                          Expanded(
                              child: Text(
                            '宛先', // address
                            style: context.textTheme.bodySmall,
                          )),
                          Expanded(
                              child: Text(
                            '発行日', // Issue date
                            style: context.textTheme.bodySmall,
                          )),
                          Expanded(
                              // flex: 2,
                              child: Text(
                            '件名', // subject
                            style: context.textTheme.bodySmall,
                          )),
                          Expanded(
                              child: Text(
                            'エージェントへ開示', // Disclosure to Agent
                            style: context.textTheme.bodySmall,
                          )),
                          Expanded(
                              child: Text(
                            '患者へ開示', // Disclosure to patients
                            style: context.textTheme.bodySmall,
                          )),
                          Expanded(
                              child: Text(
                            '実績反映', // Reflecting performance
                            style: context.textTheme.bodySmall,
                          )),
                          Expanded(
                              child: SizedBox(
                                  width:
                                      context.appTheme.spacing.marginMedium)),
                        ],
                      ),
                      const Divider(),
                      ListView.separated(
                        shrinkWrap: true,
                        itemCount: value.data?.length ?? 0,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          var data = value.data?[index];
                          return InkWell(
                            onTap: data?.fileNamePdfJP != null
                                ? () {
                                    openUrlInBrowser(
                                        fileName: data!.fileNamePdfJP!);
                                  }
                                : null,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
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
                                    },
                                  ),
                                  Expanded(
                                      child: Text(
                                    data?.invoiceNumber ?? '',
                                    style: context.textTheme.bodySmall,
                                  )),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: context.appTheme.spacing
                                                .marginExtraSmall,
                                            vertical: context.appTheme.spacing
                                                .marginExtraSmall,
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.blue,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                                context.appTheme.spacing
                                                    .borderRadiusMedium),
                                          ),
                                          child: Text(
                                            '精算書',
                                            style: context.textTheme.bodySmall
                                                ?.copyWith(
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                      child: Text(
                                    '--',
                                    style: context.textTheme.bodySmall,
                                  )),
                                  Expanded(
                                      child: Text(
                                    data?.invoiceDate != null
                                        ? Dates.formatFullDate(
                                            data!.invoiceDate!)
                                        : '',
                                    style: context.textTheme.bodySmall,
                                  )),
                                  Expanded(
                                      //flex: 2,
                                      child: Text(
                                    data?.subject ?? '',
                                    style: context.textTheme.bodySmall,
                                  )),
                                  Expanded(
                                      child: Text(
                                    '--',
                                    style: context.textTheme.bodySmall,
                                  )),
                                  Expanded(
                                      child: Text(
                                    '--',
                                    style: context.textTheme.bodySmall,
                                  )),
                                  Expanded(
                                      child: Text(
                                    '--',
                                    style: context.textTheme.bodySmall,
                                  )),
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: data?.fileNamePdfJP != null
                                          ? () {
                                              openUrlInBrowser(
                                                  fileName:
                                                      data!.fileNamePdfJP!);
                                            }
                                          : null,
                                      child: const Text(
                                        '請求書を発行する',
                                        style: TextStyle(fontSize: 10),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider(
                            thickness: 0.5,
                          );
                        },
                      ),
                      SizedBox(
                        height: context.appTheme.spacing.marginMedium,
                      ),
                      Divider(),
                      ValueListenableBuilder(
                        valueListenable: selected,
                        builder: (context, sels, _) {
                          return RowSeparated(
                            separatorBuilder: (context, index) => SizedBox(
                                width: context.appTheme.spacing.marginMedium),
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ValueListenableListener(
                                valueListenable:
                                    context.read<StatementModel>().delete,
                                onListen: () {
                                  var delete = context
                                      .read<StatementModel>()
                                      .delete
                                      .value;

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
                                      context.read<StatementModel>().delete,
                                  builder: (context, value, _) {
                                    return OutlinedButton(
                                      onPressed: sels.isEmpty || value.loading
                                          ? null
                                          : () {
                                              showDialog(
                                                  context: context,
                                                  builder: (_) {
                                                    return Provider.value(
                                                      value: context.read<
                                                          StatementModel>(),
                                                      child: AlertDialog(
                                                        title:
                                                            const Text('削除確認'),
                                                        content: const Text(
                                                            '選択したデータを削除しますか？'),
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
                                                                      StatementModel>()
                                                                  .deleteInvoice(
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
                                      ),
                                    );
                                  },
                                ),
                              ),
                              OutlinedButton(
                                onPressed: () {},
                                child: Text('CSV出力'),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text(
                                  'コピーして新規作成',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text(
                                  '新規作成',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      const StatementScreenForm(),
                      SizedBox(
                        height: context.appTheme.spacing.marginMedium,
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ValueListenableListener(
                    valueListenable: context.read<StatementModel>().submitData,
                    onListen: () {
                      var data =
                          context.read<StatementModel>().submitData.value;

                      if (data.hasData) {
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
                          prefixIcon:
                              const Icon(Icons.error, color: Colors.white),
                        );
                      }
                    },
                    child: ValueListenableBuilder(
                        valueListenable:
                            context.watch<StatementModel>().submitData,
                        builder: (context, value, _) {
                          return ReactiveFormConsumer(
                              builder: (context, formGroup, _) {
                            return ElevatedButton(
                              onPressed: value.loading
                                  ? null
                                  : () {
                                      context.read<StatementModel>().submit(
                                            formGroup: formGroup,
                                          );
                                    },
                              child: WithLoadingButton(
                                  isLoading: value.loading,
                                  child: const Text('保存')),
                            );
                          });
                        }),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
