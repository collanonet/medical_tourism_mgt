// Flutter imports:
import 'package:core_network/entities.dart';
import 'package:core_ui/resources.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'estimate_model.dart';
import 'estimate_screen_form.dart';

class EstimateScreen extends StatelessWidget {
  const EstimateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<List<String>> selected = ValueNotifier([]);
    final formGroup = ReactiveForm.of(context) as FormGroup;
    return ValueListenableBuilder(
      valueListenable: context.watch<EstimateModel>().medicalQuotationData,
      builder: (context, value, _) {
        return Skeletonizer(
          enabled: value.loading,
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
                        flex: 2,
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
                      '見込み', // Prospects
                      style: context.textTheme.bodySmall,
                    )),
                    Expanded(
                      child: SizedBox(
                        width: context.appTheme.spacing.marginLarge,
                      ),
                    ),
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
                      onTap: data?.fileNamePdfJP != null ||
                              data?.fileNamePdfEN != null ||
                              data?.fileNamePdfZH != null ||
                              data?.fileNamePdfZHTW != null ||
                              data?.fileNamePdfVN != null
                          ? () {
                              showDialog(
                                  context: context,
                                  builder: (_) {
                                    return AlertDialog(
                                      title: const Text('見積書'),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          if (data?.fileNamePdfJP != null)
                                            ListTile(
                                              title: const Text('日本語'),
                                              onTap: () {
                                                openUrlInBrowser(
                                                    fileName:
                                                        data?.fileNamePdfJP ??
                                                            '');
                                              },
                                            ),
                                          if (data?.fileNamePdfEN != null)
                                            ListTile(
                                              title: const Text('英語'),
                                              onTap: () {
                                                openUrlInBrowser(
                                                    fileName:
                                                        data?.fileNamePdfEN ??
                                                            '');
                                              },
                                            ),
                                          if (data?.fileNamePdfVN != null)
                                            ListTile(
                                              title: const Text('ベトナム語'),
                                              onTap: () {
                                                openUrlInBrowser(
                                                    fileName:
                                                        data?.fileNamePdfVN ??
                                                            '');
                                              },
                                            ),
                                          if (data?.fileNamePdfZH != null)
                                            ListTile(
                                              title: const Text('中国語'),
                                              onTap: () {
                                                openUrlInBrowser(
                                                    fileName:
                                                        data?.fileNamePdfZH ??
                                                            '');
                                              },
                                            ),
                                          if (data?.fileNamePdfZHTW != null)
                                            ListTile(
                                              title: const Text('繁体字'),
                                              onTap: () {
                                                openUrlInBrowser(
                                                    fileName:
                                                        data?.fileNamePdfZHTW ??
                                                            '');
                                              },
                                            ),
                                        ],
                                      ),
                                    );
                                  });
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
                                          ...sels.where((e) => e != data?.id)
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
                                      horizontal: context
                                          .appTheme.spacing.marginExtraSmall,
                                      vertical: context
                                          .appTheme.spacing.marginExtraSmall,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.red,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          context.appTheme.spacing
                                              .borderRadiusMedium),
                                    ),
                                    child: Text(
                                      '見積書',
                                      style:
                                          context.textTheme.bodySmall?.copyWith(
                                        color: Colors.red,
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
                                  ? Dates.formatFullDate(data!.invoiceDate!)
                                  : '',
                              style: context.textTheme.bodySmall,
                            )),
                            Expanded(
                                flex: 3,
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
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: data?.fileNamePdfJP != null ||
                                          data?.fileNamePdfEN != null ||
                                          data?.fileNamePdfZH != null ||
                                          data?.fileNamePdfZHTW != null ||
                                          data?.fileNamePdfVN != null
                                      ? () {
                                          showDialog(
                                              context: context,
                                              builder: (_) {
                                                return AlertDialog(
                                                  title: const Text('見積書'),
                                                  content: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      if (data?.fileNamePdfJP !=
                                                          null)
                                                        ListTile(
                                                          title:
                                                              const Text('日本語'),
                                                          onTap: () {
                                                            openUrlInBrowser(
                                                                fileName:
                                                                    data?.fileNamePdfJP ??
                                                                        '');
                                                          },
                                                        ),
                                                      if (data?.fileNamePdfEN !=
                                                          null)
                                                        ListTile(
                                                          title:
                                                              const Text('英語'),
                                                          onTap: () {
                                                            openUrlInBrowser(
                                                                fileName:
                                                                    data?.fileNamePdfEN ??
                                                                        '');
                                                          },
                                                        ),
                                                      if (data?.fileNamePdfVN !=
                                                          null)
                                                        ListTile(
                                                          title: const Text(
                                                              'ベトナム語'),
                                                          onTap: () {
                                                            openUrlInBrowser(
                                                                fileName:
                                                                    data?.fileNamePdfVN ??
                                                                        '');
                                                          },
                                                        ),
                                                      if (data?.fileNamePdfZH !=
                                                          null)
                                                        ListTile(
                                                          title:
                                                              const Text('中国語'),
                                                          onTap: () {
                                                            openUrlInBrowser(
                                                                fileName:
                                                                    data?.fileNamePdfZH ??
                                                                        '');
                                                          },
                                                        ),
                                                      if (data?.fileNamePdfZHTW !=
                                                          null)
                                                        ListTile(
                                                          title:
                                                              const Text('繁体字'),
                                                          onTap: () {
                                                            openUrlInBrowser(
                                                                fileName:
                                                                    data?.fileNamePdfZHTW ??
                                                                        '');
                                                          },
                                                        ),
                                                    ],
                                                  ),
                                                );
                                              });
                                        }
                                      : null,
                                  child: const Text(
                                    '言語を選択する',
                                    style: TextStyle(fontSize: 10),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
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
                          valueListenable: context.read<EstimateModel>().delete,
                          onListen: () {
                            var delete =
                                context.read<EstimateModel>().delete.value;

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
                                context.read<EstimateModel>().delete,
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
                                                    .read<EstimateModel>(),
                                                child: AlertDialog(
                                                  title: const Text('削除確認'),
                                                  content: const Text(
                                                      '選択したデータを削除しますか？'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child:
                                                          const Text('キャンセル'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        context
                                                            .read<
                                                                EstimateModel>()
                                                            .deleteInvoice(
                                                                sels);
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
                                ),
                              );
                            },
                          ),
                        ),
                        // OutlinedButton(
                        //   onPressed: () {},
                        //   child: Text('CSV出力'),
                        // ),
                        // ElevatedButton(
                        //   onPressed: () {},
                        //   child: const Text(
                        //     'コピーして新規作成',
                        //     style: TextStyle(
                        //       color: Colors.white,
                        //     ),
                        //   ),
                        // ),
                        // ElevatedButton(
                        //   onPressed: () {},
                        //   child: const Text(
                        //     '新規作成',
                        //     style: TextStyle(
                        //       color: Colors.white,
                        //     ),
                        //   ),
                        // ),
                      ],
                    );
                  },
                ),
                SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                ),
                const EstimateScreenForm(),
                SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ValueListenableListener(
                      valueListenable: context.read<EstimateModel>().submitData,
                      onListen: () {
                        var data =
                            context.read<EstimateModel>().submitData.value;

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
                              context.watch<EstimateModel>().submitData,
                          builder: (context, value, _) {
                            return ReactiveFormConsumer(
                                builder: (context, formGroup, _) {
                              return ElevatedButton(
                                onPressed: value.loading
                                    ? null
                                    : () {
                                        context.read<EstimateModel>().submit(
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
          ),
        );
      },
    );
  }
}
