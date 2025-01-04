// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import '../../../feature_patient.dart';
import 'basic_info_model.dart';
import 'basic_info_section.dart';

class BasicInformationScreen extends StatelessWidget {
  const BasicInformationScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Expanded(
          child: BasicInfoSection(),
        ),
        const SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ValueListenableListener(
              valueListenable:
                  context.read<BasicInformationModel>().deletePatient,
              onListen: () {
                final value =
                    context.read<BasicInformationModel>().deletePatient.value;
                if (value.hasData) {
                  context.router.replaceAll([const PatientsRoute()]);
                  snackBarWidget(
                    message: '正常に保存されました',
                    prefixIcon:
                        const Icon(Icons.check_circle, color: Colors.white),
                  );
                }

                if (value.hasError) {
                  snackBarWidget(
                    message: '保存できませんでした。 もう一度試してください。',
                    backgroundColor: Colors.red,
                    prefixIcon: const Icon(Icons.error, color: Colors.white),
                  );
                }
              },
              child: ValueListenableBuilder(
                valueListenable:
                    context.watch<BasicInformationModel>().patientData,
                builder: (context, value, child) {
                  return value.hasData
                      ? ValueListenableBuilder(
                          valueListenable: context
                              .watch<BasicInformationModel>()
                              .deletePatient,
                          builder: (context, value, child) {
                            return ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (_) {
                                      return Provider.value(
                                        value: context
                                            .read<BasicInformationModel>(),
                                        child: AlertDialog(
                                          title: const Text('患者情報削除すか？'),
                                          content:
                                              const Text('この操作は取り消すことができません。'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                context.router.pop();
                                              },
                                              child: const Text('キャンセル'),
                                            ),
                                            ValueListenableBuilder(
                                                valueListenable: context
                                                    .watch<
                                                        BasicInformationModel>()
                                                    .deletePatient,
                                                builder:
                                                    (context, value, child) {
                                                  return TextButton(
                                                    onPressed: () {
                                                      context
                                                          .read<
                                                              BasicInformationModel>()
                                                          .deletePatientData();
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: WithLoadingButton(
                                                      isLoading: value.loading,
                                                      child: const Text('削除'),
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
                                    '削除',
                                  ),
                                ));
                          })
                      : const SizedBox();
                },
              ),
            ),
            ValueListenableListener(
              valueListenable: context.read<BasicInformationModel>().loading,
              onListen: () {
                final value =
                    context.read<BasicInformationModel>().loading.value;
                if (value.hasData) {
                  logger.d('loading');
                  snackBarWidget(
                    message: '正常に保存されました',
                    prefixIcon:
                        const Icon(Icons.check_circle, color: Colors.white),
                  );
                }

                if (value.hasError) {
                  snackBarWidget(
                    message: '保存できませんでした。 もう一度試してください。',
                    backgroundColor: Colors.red,
                    prefixIcon: const Icon(Icons.error, color: Colors.white),
                  );
                }
              },
              child: ValueListenableBuilder(
                  valueListenable:
                      context.watch<BasicInformationModel>().loading,
                  builder: (context, value, child) {
                    return ReactiveFormConsumer(
                      builder: (context, form, _) {
                        return ElevatedButton(
                            onPressed: !value.loading && form.valid
                                ? () => context
                                    .read<BasicInformationModel>()
                                    .createUpdateAll(form)
                                : null,
                            child: WithLoadingButton(
                              isLoading: value.loading,
                              child: const Text('保存する'),
                            ));
                      },
                    );
                  }),
            )
          ],
        )
      ],
    );
  }
}
