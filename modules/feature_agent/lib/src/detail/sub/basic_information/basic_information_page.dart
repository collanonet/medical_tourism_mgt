// Flutter imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import '../../../../feature_agent.dart';
import '../../agent_detail_model.dart';
import 'basic_information_form.dart';
import 'basic_information_model.dart';
import 'basic_information_screen.dart';

class BasicInformationPage extends StatelessWidget {
  const BasicInformationPage({super.key, this.id});
  final String? id;
  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: validationMessages,
      child: ReactiveFormBuilder(
        form: () => formBasicInformation()..markAllAsTouched(),
        builder: (context, formGroup, child) {
          return Provider(
            create: (context) => GetIt.I<AgentBasicInformationModel>()
              ..init(
                id: id,
                formGroup: formGroup,
              ),
            child: Builder(builder: (context) {
              return ValueListenableBuilder(
                  valueListenable:
                      context.read<AgentBasicInformationModel>().agent,
                  builder: (context, value, _) {
                    return ColumnSeparated(
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 10);
                      },
                      children: [
                        const Expanded(child: AgentBasicInformationScreen()),
                        const SizedBox(height: 16),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ValueListenableListener(
                              valueListenable: context
                                  .read<AgentBasicInformationModel>()
                                  .deleteAgent,
                              onListen: () {
                                final value = context
                                    .read<AgentBasicInformationModel>()
                                    .deleteAgent
                                    .value;
                                if (value.hasData) {
                                  context.router
                                      .replaceAll([const AgentsRoute()]);
                                  snackBarWidget(
                                    message: '正常に保存されました',
                                    prefixIcon: const Icon(Icons.check_circle,
                                        color: Colors.white),
                                  );
                                }

                                if (value.hasError) {
                                  snackBarWidget(
                                    message: '保存できませんでした。 もう一度試してください。',
                                    backgroundColor: Colors.red,
                                    prefixIcon: const Icon(Icons.error,
                                        color: Colors.white),
                                  );
                                }
                              },
                              child: ValueListenableBuilder(
                                valueListenable: context
                                    .watch<AgentBasicInformationModel>()
                                    .agent,
                                builder: (context, value, child) {
                                  return value.hasData
                                      ? ValueListenableBuilder(
                                          valueListenable: context
                                              .watch<
                                                  AgentBasicInformationModel>()
                                              .deleteAgent,
                                          builder: (context, value, child) {
                                            return ElevatedButton(
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (_) {
                                                      return Provider.value(
                                                        value: context.read<
                                                            AgentBasicInformationModel>(),
                                                        child: AlertDialog(
                                                          title: const Text(
                                                              'エージェント情報を消去しますか？'),
                                                          content: const Text(
                                                              'この操作は取り消すことができません。'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () {
                                                                context.router
                                                                    .pop();
                                                              },
                                                              child: const Text(
                                                                  'キャンセル'),
                                                            ),
                                                            ValueListenableBuilder(
                                                                valueListenable: context
                                                                    .watch<
                                                                        AgentBasicInformationModel>()
                                                                    .deleteAgent,
                                                                builder:
                                                                    (context,
                                                                        value,
                                                                        child) {
                                                                  return TextButton(
                                                                    onPressed:
                                                                        () {
                                                                      context
                                                                          .read<
                                                                              AgentBasicInformationModel>()
                                                                          .deleteAgentData();
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    },
                                                                    child:
                                                                        WithLoadingButton(
                                                                      isLoading:
                                                                          value
                                                                              .loading,
                                                                      child: const Text(
                                                                          '消去'),
                                                                    ),
                                                                  );
                                                                }),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.red,
                                                ),
                                                child: WithLoadingButton(
                                                  isLoading: value.loading,
                                                  child: const Text(
                                                    '消去',
                                                  ),
                                                ));
                                          })
                                      : const SizedBox();
                                },
                              ),
                            ),
                            ValueListenableListener(
                              valueListenable: context
                                  .read<AgentBasicInformationModel>()
                                  .agent,
                              onListen: () {
                                var data = context
                                    .read<AgentBasicInformationModel>()
                                    .agent
                                    .value;

                                if (data.hasData) {
                                  context
                                      .read<AgentDetailModel>()
                                      .insertData(data.requireData);
                                }
                              },
                              child: ValueListenableListener(
                                valueListenable: context
                                    .read<AgentBasicInformationModel>()
                                    .submit,
                                onListen: () {
                                  var data = context
                                      .read<AgentBasicInformationModel>()
                                      .submit
                                      .value;

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
                                      prefixIcon: const Icon(Icons.error,
                                          color: Colors.white),
                                    );
                                  }
                                },
                                child: ValueListenableBuilder(
                                    valueListenable: context
                                        .read<AgentBasicInformationModel>()
                                        .submit,
                                    builder: (context, value, child) {
                                      return ReactiveFormConsumer(
                                          builder: (context, formGroup, child) {
                                        // var form = formGroup.control(
                                        //         'basicInformationAgent')
                                        //     as FormGroup;
                                        return value.hasData
                                            ? ElevatedButton(
                                                onPressed: formGroup.invalid
                                                    ? null
                                                    : () {
                                                        context
                                                            .read<
                                                                AgentBasicInformationModel>()
                                                            .createOrUpdateAgent(
                                                                formGroup);
                                                      },
                                                child: const Text('保存する'),
                                              )
                                            : ElevatedButton(
                                                onPressed: !value.loading &&
                                                        formGroup.valid
                                                    ? () {
                                                        context
                                                            .read<
                                                                AgentBasicInformationModel>()
                                                            .createOrUpdateAgent(
                                                                formGroup);
                                                      }
                                                    : null,
                                                child: const Text('保存する'),
                                              );
                                      });
                                    }),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  });
            }),
          );
        },
      ),
    );
  }
}
