// Flutter imports:
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'estimate_model.dart';
import 'estimate_screen_form.dart';

class EstimateScreen extends StatelessWidget {
  const EstimateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: context.watch<EstimateModel>().medicalQuotationData,
        builder: (context, value, _) {
          return Skeletonizer(
            enabled: value.loading,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: context.appTheme.spacing.marginMedium,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side: const BorderSide(color: Colors.grey),
                        ),
                        checkColor: Colors.white,
                        value: false,
                        onChanged: (value) {},
                      ),
                      Expanded(
                          child: Text(
                        '書類番号', // Document Number
                        style: context.textTheme.bodySmall,
                      )),
                      Expanded(
                          child: Text(
                        '種別', // type
                        style: context.textTheme.bodySmall,
                      )),
                      Expanded(
                          child: Text(
                        '宛先', // address
                        style: context.textTheme.bodySmall,
                      )),
                      Expanded(
                          child: Text(
                        '発行日', // Issue date
                        style: context.textTheme.bodySmall,
                      )),
                      Expanded(
                          flex: 2,
                          child: Text(
                            '件名', // subject
                            style: context.textTheme.bodySmall,
                          )),
                      Expanded(
                          child: Text(
                        'エージェントへ開示', // Disclosure to Agent
                        style: context.textTheme.bodySmall,
                      )),
                      Expanded(
                          child: Text(
                        '患者へ開示', // Disclosure to patients
                        style: context.textTheme.bodySmall,
                      )),
                      Expanded(
                          child: Text(
                        '見込み', // Prospects
                        style: context.textTheme.bodySmall,
                      )),
                      Expanded(
                        child: SizedBox(
                          width: context.appTheme.spacing.marginMedium,
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: value.data?.length ?? 0,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      var data = value.data?[index];
                      return InkWell(
                        onTap: data?.fileName != null
                            ? () {
                                openUrlInBrowser(fileName: data!.fileName!);
                              }
                            : null,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            children: [
                              Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  side: const BorderSide(color: Colors.grey),
                                ),
                                checkColor: Colors.white,
                                value: false,
                                onChanged: (value) {},
                              ),
                              Expanded(
                                  child: Text(
                                data?.quotationNumber ?? '',
                                style: context.textTheme.bodySmall,
                              )),
                              Expanded(
                                  child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: context
                                          .appTheme.spacing.marginExtraSmall,
                                      vertical: context
                                          .appTheme.spacing.marginExtraSmall,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.red,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          context.appTheme.spacing
                                              .borderRadiusMedium),
                                    ),
                                    child: Text(
                                      '見積書',
                                      style:
                                          context.textTheme.bodySmall?.copyWith(
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                              Expanded(
                                  child: Text(
                                '大瀚人力资源集团',
                                style: context.textTheme.bodySmall,
                              )),
                              Expanded(
                                  child: Text(
                                data?.quotationDate != null
                                    ? Dates.formatFullDate(data!.quotationDate!)
                                    : '',
                                style: context.textTheme.bodySmall,
                              )),
                              Expanded(
                                  flex: 2,
                                  child: Text(
                                    data?.subject ?? '',
                                    style: context.textTheme.bodySmall,
                                  )),
                              Expanded(
                                  child: Text(
                                // '○',
                                '--',
                                style: context.textTheme.bodySmall,
                              )),
                              Expanded(
                                  child: Text(
                                // '×',
                                '--',
                                style: context.textTheme.bodySmall,
                              )),
                              Expanded(
                                  child: Text(
                                // 'A',
                                '--',
                                style: context.textTheme.bodySmall,
                              )),
                              Expanded(
                                child: Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: const Text('請求書を発行する'),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        thickness: 0.5,
                      );
                    },
                  ),
                  SizedBox(
                    height: context.appTheme.spacing.marginMedium,
                  ),
                  const EstimateScreenForm(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ValueListenableListener(
                        valueListenable:
                            context.read<EstimateModel>().submitData,
                        onListen: () {
                          var data =
                              context.read<EstimateModel>().submitData.value;

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
                              prefixIcon:
                                  const Icon(Icons.error, color: Colors.white),
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
                                          context.read<EstimateModel>().submit(
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
  }
}
