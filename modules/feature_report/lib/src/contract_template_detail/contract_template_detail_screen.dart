// Flutter imports:
import 'package:core_utils/async.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Project imports:

import 'contract_template_detail_head.dart';
import 'contract_template_detail_list.dart';
import 'contract_template_detail_model.dart';

class ContractDetailScreen extends StatefulWidget {
  const ContractDetailScreen({super.key});

  @override
  State<ContractDetailScreen> createState() => _ContractDetailScreenState();
}

class _ContractDetailScreenState extends State<ContractDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final formGroup = ReactiveForm.of(context) as FormGroup;
    return ValueListenableBuilder(
      valueListenable: context
          .watch<ContractTemplateModel>()
          .submitContracTemplateBasicInfoData,
      builder: (context, value, _) {
        return Skeletonizer(
          enabled: value.loading,
          child: Column(
            children: [
              const ContractHead(),
              const ContractList(),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ValueListenableListener(
                    valueListenable: context
                        .read<ContractTemplateModel>()
                        .submitContracTemplateBasicInfoData,
                    onListen: () {
                      final value = context
                          .read<ContractTemplateModel>()
                          .submitContracTemplateBasicInfoData
                          .value;
                      if (value.hasData) {
                        logger.d('loading');
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
                          prefixIcon:
                              const Icon(Icons.error, color: Colors.white),
                        );
                      }
                    },
                    child: ValueListenableBuilder(
                        valueListenable: context
                            .watch<ContractTemplateModel>()
                            .submitContracTemplateBasicInfoData,
                        builder: (context, value, _) {
                          return ReactiveFormConsumer(
                            builder: (context, form, _) {
                              return ElevatedButton(
                                  onPressed: () {
                                    context
                                        .read<ContractTemplateModel>()
                                        .submitContracTemplateBasicInfo(
                                            formGroup);
                                  },
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
          ),
        );
      },
    );
  }

  // void showCreateWithFileDialog(BuildContext context, FileSelect file) {
  //   showDialog(
  //     context: context,
  //     builder: (_) => Provider.value(
  //       value: context.read<ContractTemplateModel>(),
  //       child: AlertDialog(
  //         content: ReactiveFormConfig(
  //           validationMessages: validationMessages,
  //           child: ReactiveFormBuilder(
  //             form: () => contractTemplateform(file)..markAllAsTouched(),
  //             builder: (context, formGroup, child) {
  //               return const Popup();
  //             },
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
