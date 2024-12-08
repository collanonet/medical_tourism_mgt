// Flutter imports:
import 'package:core_utils/async.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'estimate_master_model.dart';

class EstimateMasterScreen extends StatefulWidget {
  const EstimateMasterScreen({super.key});

  @override
  State<EstimateMasterScreen> createState() => _EstimateMasterScreenState();
}

class _EstimateMasterScreenState extends State<EstimateMasterScreen> {
  @override
  Widget build(BuildContext context) {
    return ColumnSeparated(
      separatorBuilder: (context, index) => SizedBox(
        height: context.appTheme.spacing.marginMedium,
      ),
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '見積マスタ',
                style: TextStyle(
                  fontFamily: 'NotoSansJP',
                  package: 'core_ui',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: ColumnSeparated(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      separatorBuilder: (context, index) => SizedBox(
                          height: context.appTheme.spacing.marginMedium),
                      children: [
                        Row(
                          children: [
                            Expanded(child: SizedBox()),
                            SizedBox(
                              width: 316,
                              child: Center(
                                  child: const OutlinedButton(
                                      onPressed: null, child: Text('売値'))),
                            ),
                            SizedBox(
                              width: 316,
                              child: Center(
                                  child: const OutlinedButton(
                                      onPressed: null, child: Text('原価'))),
                            ),
                          ],
                        ),
                        RowSeparated(
                          separatorBuilder: (context, index) => SizedBox(
                            width: context.appTheme.spacing.marginMedium,
                          ),
                          children: const [
                            Expanded(
                              child: Center(child: Text('項目')),
                            ),
                            SizedBox(
                              width: 150,
                              child: Center(child: Text('単価')),
                            ),
                            SizedBox(
                              width: 150,
                              child: Center(child: Text('金額')),
                            ),
                            SizedBox(
                              width: 150,
                              child: Center(child: Text('単価')),
                            ),
                            SizedBox(
                              width: 150,
                              child: Center(child: Text('金額')),
                            )
                          ],
                        ),
                        ValueListenableBuilder2(
                            first: context
                                .watch<EstimateMasterModel>()
                                .estimateMasterData,
                            second: context.watch<EstimateMasterModel>().submit,
                            builder: (context, value, submit, child) {
                              {
                                return Skeletonizer(
                                  enabled: value.loading || submit.loading,
                                  child: ReactiveFormArray(
                                    formArrayName: 'arr',
                                    builder: (context, formArray, child) {
                                      var rows = formArray.controls
                                          .map((controll) =>
                                              controll as FormGroup)
                                          .map((currenForm) {
                                        return ReactiveForm(
                                          formGroup: currenForm,
                                          child: RowSeparated(
                                            separatorBuilder:
                                                (context, index) => SizedBox(
                                                    width: context.appTheme
                                                        .spacing.marginMedium),
                                            children: [
                                              Expanded(
                                                child: IntrinsicWidth(
                                                  stepWidth: 350,
                                                  child: ReactiveTextField(
                                                    formControlName: 'project',
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 150,
                                                child: ReactiveTextField(
                                                  formControlName:
                                                      'unitPriceSellingPrice',
                                                ),
                                              ),
                                              SizedBox(
                                                width: 150,
                                                child: ReactiveTextField(
                                                  formControlName:
                                                      'amountOfMoneySellingPrice',
                                                ),
                                              ),
                                              SizedBox(
                                                width: 150,
                                                child: ReactiveTextField(
                                                  formControlName:
                                                      'unitPriceCostPrice',
                                                ),
                                              ),
                                              SizedBox(
                                                width: 150,
                                                child: ReactiveTextField(
                                                  formControlName:
                                                      'amountOfMoneyCostPrice',
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }).toList();
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ColumnSeparated(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            separatorBuilder:
                                                (context, index) => SizedBox(
                                                    height: context.appTheme
                                                        .spacing.marginMedium),
                                            children: rows,
                                          ),
                                          const SizedBox(height: 20),
                                          InkWell(
                                            onTap: () {
                                              formArray.add(
                                                FormGroup({
                                                  '_id': FormControl<String>(),
                                                  'project':
                                                      FormControl<String>(),
                                                  'unitPriceSellingPrice':
                                                      FormControl<String>(),
                                                  'amountOfMoneySellingPrice':
                                                      FormControl<String>(),
                                                  'unitPriceCostPrice':
                                                      FormControl<String>(),
                                                  'amountOfMoneyCostPrice':
                                                      FormControl<String>(),
                                                }),
                                              );
                                            },
                                            child: IntrinsicWidth(
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.add_circle_rounded,
                                                    color: context
                                                        .appTheme.primaryColor,
                                                  ),
                                                  Text(
                                                    '行を追加',
                                                    style: TextStyle(
                                                      color: context.appTheme
                                                          .primaryColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                );
                              }
                            })
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ReactiveFormConsumer(builder: (context, form, _) {
                      return ValueListenableListener(
                        valueListenable:
                            context.watch<EstimateMasterModel>().submit,
                        onListen: () {
                          var submit =
                              context.read<EstimateMasterModel>().submit.value;

                          if (submit.hasError) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(submit.error.toString())));
                          }
                        },
                        child: ValueListenableBuilder(
                            valueListenable:
                                context.watch<EstimateMasterModel>().submit,
                            builder: (context, submit, child) {
                              {
                                return ElevatedButton(
                                  onPressed: form.valid && !submit.loading
                                      ? () {
                                          context
                                              .read<EstimateMasterModel>()
                                              .submitEstimatemasterReport(
                                                  form);
                                        }
                                      : null,
                                  child: WithLoadingButton(
                                    isLoading: submit.loading,
                                    child: const Text('作成する'),
                                  ),
                                );
                              }
                            }),
                      );
                    }),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
