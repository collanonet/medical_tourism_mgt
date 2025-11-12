// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'summary_list_model.dart';

class SummaryListScreen extends StatefulWidget {
  const SummaryListScreen({super.key});

  @override
  State<SummaryListScreen> createState() => _SummaryListScreenState();
}

class _SummaryListScreenState extends State<SummaryListScreen> {
  ValueNotifier<List<String>> selected = ValueNotifier([]);

  Future<void> _showExportFormatDialog(BuildContext context) async {
    final model = context.read<SummaryListModel>();
    final format = await showDialog<SummaryExportFormat>(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('出力形式を選択'),
        children: [
          SimpleDialogOption(
            onPressed: () =>
                Navigator.of(context).pop(SummaryExportFormat.word),
            child: const Text('Word (.doc)'),
          ),
          SimpleDialogOption(
            onPressed: () =>
                Navigator.of(context).pop(SummaryExportFormat.pdf),
            child: const Text('PDF (.pdf)'),
          ),
        ],
      ),
    );

    if (format != null) {
      await model.exportSummary(format: format);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: ValueListenableBuilder(
              valueListenable:
                  context.read<SummaryListModel>().fileSummaryListData,
              builder: (context, value, _) {
                return Column(
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
                          '文書名',
                          style: context.textTheme.bodySmall,
                        )),
                        Expanded(
                            child: Text(
                          '発行日',
                          style: context.textTheme.bodySmall,
                        )),
                        Expanded(
                            child: Text(
                          '共有',
                          style: context.textTheme.bodySmall,
                        )),
                        Expanded(
                            child: Text(
                          'エージェントへ開示',
                          style: context.textTheme.bodySmall,
                        )),
                      ],
                    ),
                    const Divider(),
                    ValueListenableBuilder(
                      valueListenable:
                          context.read<SummaryListModel>().fileSummaryListData,
                      builder: (context, value, _) {
                        return ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children:
                              List.generate(value.data?.length ?? 0, (index) {
                            var item = value.data![index];
                            return InkWell(
                              onTap: () {
                                openUrlInBrowser(fileName: item.pathFile ?? '');
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Row(
                                  children: [
                                    ValueListenableBuilder(
                                      valueListenable: selected,
                                      builder: (context, sels, _) {
                                        return Checkbox(
                                          value: sels.contains(item.id),
                                          onChanged: (sel) {
                                            if (sel != null) {
                                              if (sel) {
                                                selected.value = [
                                                  ...sels,
                                                  item.id
                                                ];
                                              } else {
                                                selected.value = [
                                                  ...sels.where(
                                                      (e) => e != item.id)
                                                ];
                                              }
                                            }
                                          },
                                        );
                                      },
                                    ),
                                    Expanded(
                                        child: Row(
                                      children: [
                                        Flexible(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 6,
                                                  vertical: 2,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  border: Border.all(
                                                    color: context
                                                        .appTheme.primaryColor,
                                                  ),
                                                ),
                                                child: Text(
                                                  '通常版',
                                                  style: context
                                                      .textTheme.bodySmall
                                                      ?.copyWith(
                                                    color: context
                                                        .appTheme.primaryColor,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              Expanded(
                                                child: Text(
                                                  item.documentName ?? '',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                                    Expanded(
                                      child: Text(item.publicationDate == null
                                          ? ''
                                          : Dates.formShortDate(
                                              item.publicationDate)),
                                    ),
                                    Expanded(
                                        child: Row(
                                      children: [
                                        if (item.share == '○')
                                          Icon(
                                            Icons.person,
                                            color:
                                                context.appTheme.primaryColor,
                                          ),
                                      ],
                                    )),
                                    Expanded(
                                        child: Row(
                                      children: [
                                        Text(item.disclosureToAgent ?? ''),
                                      ],
                                    )),
                                  ],
                                ),
                              ),
                            );
                          }),
                        );
                      },
                    ),
                    SizedBox(
                      height: context.appTheme.spacing.marginMedium,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        ValueListenableBuilder(
            valueListenable: selected,
            builder: (context, sels, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ValueListenableListener(
                    valueListenable: context.read<SummaryListModel>().delete,
                    onListen: () {
                      var delete =
                          context.read<SummaryListModel>().delete.value;

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
                            context.read<SummaryListModel>().delete,
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
                                                  .read<SummaryListModel>(),
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
                                                    child: const Text('キャンセル'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      context
                                                          .read<
                                                              SummaryListModel>()
                                                          .deleteDomesticMedical(
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
                                  style: context.textTheme.labelLarge?.copyWith(
                                      color: context.appTheme.primaryColor),
                                ),
                              ));
                        }),
                  ),
                  SizedBox(
                    width: context.appTheme.spacing.marginMedium,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (sels.isEmpty) {
                        snackBarWidget(
                          message: 'ファイルが選択されていません',
                          backgroundColor: Colors.red,
                          prefixIcon: const Icon(
                            Icons.error,
                            color: Colors.white,
                          ),
                        );
                        return;
                      }

                      final files = context
                          .read<SummaryListModel>()
                          .fileSummaryListData
                          .value
                          .data
                          ?.where((item) => sels.contains(item.id))
                          .map((item) => item.pathFile)
                          .whereType<String>()
                          .toList();

                      if (files == null || files.isEmpty) {
                        snackBarWidget(
                          message: 'ダウンロード可能なファイルがありません',
                          backgroundColor: Colors.red,
                          prefixIcon: const Icon(
                            Icons.error,
                            color: Colors.white,
                          ),
                        );
                        return;
                      }

                      for (final file in files) {
                        try {
                          final fileName = file.split('/').last;
                          await downloadFile(
                            fileName: file,
                            downloadName: fileName,
                          );
                        } catch (_) {
                          snackBarWidget(
                            message: 'ファイルのダウンロードに失敗しました',
                            backgroundColor: Colors.red,
                            prefixIcon: const Icon(
                              Icons.error,
                              color: Colors.white,
                            ),
                          );
                          break;
                        }
                      }
                    },
                    child: const Text(
                      'ダウンロードする',
                      style: TextStyle(
                        fontFamily: 'NotoSansJP',
                        package: 'core_ui',
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: context.appTheme.spacing.marginMedium,
                  ),
                  ValueListenableListener(
                    valueListenable:
                        context.read<SummaryListModel>().exportSummaryState,
                    onListen: () {
                      final value = context
                          .read<SummaryListModel>()
                          .exportSummaryState
                          .value;

                      if (value.hasData) {
                        snackBarWidget(
                          message: 'サマリーを出力しました',
                          prefixIcon: const Icon(
                            Icons.check_circle,
                            color: Colors.white,
                          ),
                        );
                      }

                      if (value.hasError) {
                        snackBarWidget(
                          message: 'サマリーの出力に失敗しました',
                          backgroundColor: Colors.red,
                          prefixIcon: const Icon(
                            Icons.error,
                            color: Colors.white,
                          ),
                        );
                      }
                    },
                    child: ValueListenableBuilder(
                      valueListenable:
                          context.read<SummaryListModel>().exportSummaryState,
                      builder: (context, value, _) {
                        return ElevatedButton(
                          onPressed: value.loading
                              ? null
                              : () {
                                  _showExportFormatDialog(context);
                                },
                          child: WithLoadingButton(
                            isLoading: value.loading,
                            child: const Text(
                              '出力する',
                              style: TextStyle(
                                fontFamily: 'NotoSansJP',
                                package: 'core_ui',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: context.appTheme.spacing.marginMedium,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      var ids = context
                          .read<SummaryListModel>()
                          .fileSummaryListData
                          .value;
                      var list =
                          ids.data!.where((e) => sels.contains(e.id)).toList();
                      showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              content: ViewAndPrintFileWidget(list
                                  .map((e) =>
                                      '${GetIt.I<String>(instanceName: 'fileUrl')}${e.pathFile}')
                                  .toList()),
                            );
                          });
                    },
                    child: const Text(
                      '印刷する',
                      style: TextStyle(
                        fontFamily: 'NotoSansJP',
                        package: 'core_ui',
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              );
            }),
      ],
    );
  }
}
