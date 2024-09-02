// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'summary_list_model.dart';

class SummaryListScreen extends StatelessWidget {
  const SummaryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<List<String>> selected = ValueNotifier([]);
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: ValueListenableBuilder(
              valueListenable: context.read<SummaryListModel>().summaryListData,
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
                          context.read<SummaryListModel>().summaryListData,
                      builder: (context, value, _) {
                        return ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: List.generate(10, (index) {
                            // var item = value.data![index];
                            return InkWell(
                              onTap: () {},
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Row(
                                  children: [
                                    // ValueListenableBuilder(
                                    //   valueListenable: selected,
                                    //   builder: (context, sels, _) {
                                    //     return Checkbox(
                                    //       value: sels.contains(item.id),
                                    //       onChanged: (sel) {
                                    //         if (sel != null) {
                                    //           if (sel) {
                                    //             selected.value = [
                                    //               ...sels,
                                    //               item.id
                                    //             ];
                                    //           } else {
                                    //             selected.value = [
                                    //               ...sels.where(
                                    //                   (e) => e != item.id)
                                    //             ];
                                    //           }
                                    //         }
                                    //       },
                                    //     );
                                    //   },
                                    // ),
                                    Expanded(
                                        child: Row(
                                      children: [
                                        const Flexible(
                                            child: Text('診療データサマリー')),
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
                                    const Expanded(child: Text('2023/06/30')),
                                    Expanded(
                                        child: Row(
                                      children: [
                                        Icon(
                                          Icons.person,
                                          color: context.appTheme.primaryColor,
                                        ),
                                      ],
                                    )),
                                    Expanded(
                                        child: Row(
                                      children: [
                                        Icon(
                                          Icons.circle_outlined,
                                          color: context.appTheme.primaryColor,
                                        ),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            OutlinedButton(
              onPressed: () {},
              child: const Text(
                '削除する',
              ),
            ),
            SizedBox(
              width: context.appTheme.spacing.marginMedium,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                '共有する',
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
        ),
      ],
    );
  }
}
