import 'package:auto_route/auto_route.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../feature_agent.gm.dart';
import 'filter_agent.dart';

class AgentScreen extends StatelessWidget {
  const AgentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ColumnSeparated(
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 16);
      },
      children: [
        AgentFilter(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {
                context.router.push(const AgentDetailRoute());
              },
              child: Text('新規登録'),
            ),
          ],
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            child: ColumnSeparated(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 8);
              },
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RowSeparated(
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(width: 16);
                      },
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            '担当者名',
                            style: context.textTheme.bodyMedium,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            '会社名',
                            style: context.textTheme.bodyMedium,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '国',
                            style: context.textTheme.bodyMedium,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '過去実績案件数',
                            style: context.textTheme.bodyMedium,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '連絡方法１',
                            style: context.textTheme.bodyMedium,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '連絡方法２',
                            style: context.textTheme.bodyMedium,
                          ),
                        ),
                      ]),
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: 40,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              context.router.push(const AgentDetailRoute());
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: index.isEven
                                    ? context.appTheme.primaryColor
                                        .withOpacity(0.1)
                                    : Colors.white,
                              ),
                              padding: const EdgeInsets.all(8.0),
                              child: RowSeparated(
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const SizedBox(width: 16);
                                  },
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'LIU　WEIQIANG ',
                                            style: context.textTheme.bodyMedium,
                                          ),
                                          Text(
                                            '刘 伟强 / 劉 偉強',
                                            style: context.textTheme.bodySmall,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        '大瀚人力资源集团',
                                        style: context.textTheme.bodyMedium,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        '中国',
                                        style: context.textTheme.bodyMedium,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        '2',
                                        style: context.textTheme.bodyMedium,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'WeChat',
                                        style: context.textTheme.bodyMedium,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'LINE',
                                        style: context.textTheme.bodyMedium,
                                      ),
                                    ),
                                  ]),
                            ),
                          );
                        })),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
