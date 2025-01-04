// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Project imports:
import 'statement_model.dart';
import 'statement_screen_form.dart';
import 'statement_screen_list.dart';

class StatementScreen extends StatelessWidget {
  const StatementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: context.watch<StatementModel>().medicalInvoiceData,
      builder: (context, value, _) {
        return ValueListenableBuilder(
            valueListenable: context.watch<StatementModel>().editData,
            builder: (context, editData, _) {
              return Skeletonizer(
                enabled: value.loading,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (!editData.hasData) const StatementScreenList(),
                            if (!editData.hasData) const Divider(),
                            const StatementScreenForm(),
                            const Divider(),
                          ],
                        ),
                      ),
                    ),
                    RowSeparated(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                            width: context.appTheme.spacing.formSpacing);
                      },
                      children: [
                        ValueListenableBuilder(
                            valueListenable:
                                context.watch<StatementModel>().editData,
                            builder: (context, value, _) {
                              return value.hasData
                                  ? ElevatedButton(
                                      onPressed: () {
                                        context
                                            .read<StatementModel>()
                                            .resetEditData();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor: Colors.red,
                                      ),
                                      child: const Text('キャンセル'),
                                    )
                                  : const SizedBox();
                            }),
                        ValueListenableListener(
                          valueListenable:
                              context.read<StatementModel>().submitData,
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
                                prefixIcon: const Icon(Icons.error,
                                    color: Colors.white),
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
                                            context
                                                .read<StatementModel>()
                                                .submit(
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
            });
      },
    );
  }
}
