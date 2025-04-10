// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Project imports:
import '../feature_agent.gm.dart';
import 'agent_model.dart';
import 'filter_agent.dart';

class AgentScreen extends StatelessWidget {
  const AgentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: context.read<AgentModel>().agents,
        builder: (context, value, _) {
          return ColumnSeparated(
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 16);
            },
            children: [
              const AgentFilter(),
              Expanded(
                child: Skeletonizer(
                  enabled: value.loading,
                  child: ColumnSeparated(
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 16);
                    },
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              context.router.push(AgentDetailRoute());
                            },
                            child: const Text('新規登録'),
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
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(height: 8);
                            },
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RowSeparated(
                                    separatorBuilder:
                                        (BuildContext context, int index) {
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
                                          '地域',
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
                                  itemCount: value.data?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    var data = value.data?[index];
                                    return InkWell(
                                      onTap: () {
                                        context.router.push(AgentDetailRoute(
                                            id: data?.id.toString()));
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
                                                (BuildContext context,
                                                    int index) {
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
                                                      data?.manager
                                                              ?.fullNameRomanji ??
                                                          '--',
                                                      style: context
                                                          .textTheme.bodyMedium
                                                          ?.copyWith(
                                                              color: context
                                                                  .appTheme
                                                                  .primaryColor),
                                                    ),
                                                    Text(
                                                      '${data?.manager?.fullNameChineseKanjiVietnameseNotation ?? '--'} / ${data?.manager?.fullNameJapaneseKanjiChineseOnly ?? '--'}',
                                                      style: context
                                                          .textTheme.bodySmall,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Text(
                                                  data?.companyName ?? '--',
                                                  style: context
                                                      .textTheme.bodyMedium,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Text(
                                                  data?.address ?? '--',
                                                  style: context
                                                      .textTheme.bodyMedium,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  data?.area ?? '--',
                                                  style: context
                                                      .textTheme.bodyMedium,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  data?.pastCasesNumber
                                                          ?.toString() ??
                                                      '--',
                                                  style: context
                                                      .textTheme.bodyMedium,
                                                ),
                                              ),
                                              Expanded(
                                                child: data
                                                            ?.manager
                                                            ?.contactMethods
                                                            ?.isNotEmpty ==
                                                        true
                                                    ? Text(
                                                        data
                                                                ?.manager
                                                                ?.contactMethods?[
                                                                    0]
                                                                .howToContact ??
                                                            '--',
                                                        style: context.textTheme
                                                            .bodyMedium,
                                                      )
                                                    : const Text('--//--'),
                                              ),
                                              Expanded(
                                                child: data
                                                            ?.manager
                                                            ?.contactMethods
                                                            ?.isNotEmpty ==
                                                        true
                                                    ? Text(
                                                        data
                                                                ?.manager
                                                                ?.contactMethods?[
                                                                    0]
                                                                .howToContactQrCode ??
                                                            '',
                                                        style: context.textTheme
                                                            .bodyMedium,
                                                      )
                                                    : const Text('--//--'),
                                              ),
                                            ]),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }
}
