// Flutter imports:
import 'dart:math';

import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'summary_list_model.dart';

class SummaryListScreen extends StatefulWidget {
  const SummaryListScreen({super.key});

  @override
  State<SummaryListScreen> createState() => _SummaryListScreenState();
}

class _SummaryListScreenState extends State<SummaryListScreen> {
  ValueNotifier<List<String>> selected = ValueNotifier([]);

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
                                            child:
                                                Text(item.documentName ?? '')),
                                        const Spacer(),
                                        Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            border: Border.all(
                                                color: context
                                                    .appTheme.primaryColor),
                                          ),
                                          child: Text(
                                            '通常版',
                                            style: context.textTheme.bodySmall
                                                ?.copyWith(
                                                    color: context
                                                        .appTheme.primaryColor),
                                          ),
                                        )
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
                    onPressed: () {},
                    child: const Text(
                      '閲覧する',
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
                  ElevatedButton(
                    onPressed: () {},
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
