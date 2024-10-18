// Flutter imports:
import 'package:core_utils/async.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'estimate_model.dart';
import 'estimate_screen_form.dart';
import 'estimate_screen_list.dart';

class EstimateScreen extends StatelessWidget {
  const EstimateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: context.watch<EstimateModel>().medicalQuotationData,
      builder: (context, value, _) {
        return ValueListenableBuilder(
            valueListenable: context.watch<EstimateModel>().editData,
            builder: (context, editData, _) {
              return Skeletonizer(
                enabled: value.loading,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!editData.hasData) const EstimateScreenList(),
                      if (!editData.hasData) const Divider(),
                      const EstimateScreenForm(),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ValueListenableBuilder(
                              valueListenable:
                              context.watch<EstimateModel>().editData,
                              builder: (context, value, _) {
                                return value.hasData ? ElevatedButton(
                                  onPressed: (){
                                    context.read<EstimateModel>().resetEditData();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.red,
                                  ),
                                  child: const Text('キャンセル'),
                                ) : const SizedBox();
                              }),
                          ValueListenableListener(
                            valueListenable:
                                context.read<EstimateModel>().submitData,
                            onListen: () {
                              var data = context
                                  .read<EstimateModel>()
                                  .submitData
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
                                valueListenable:
                                    context.watch<EstimateModel>().submitData,
                                builder: (context, value, _) {
                                  return ReactiveFormConsumer(
                                      builder: (context, formGroup, _) {
                                    return ElevatedButton(
                                      onPressed: value.loading
                                          ? null
                                          : () {
                                              context
                                                  .read<EstimateModel>()
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
                ),
              );
            });
      },
    );
  }
}
