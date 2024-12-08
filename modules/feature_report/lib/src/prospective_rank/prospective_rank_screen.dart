// Flutter imports:
import 'package:core_utils/async.dart';
import 'package:feature_report/src/prospective_rank/prospective_rank_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_l10n/l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProspectivePankScreen extends StatefulWidget {
  const ProspectivePankScreen({super.key});

  @override
  State<ProspectivePankScreen> createState() => _ProspectivePankScreenState();
}

class _ProspectivePankScreenState extends State<ProspectivePankScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                '見込みランク',
                style: TextStyle(
                  fontFamily: 'NotoSansJP',
                  package: 'core_ui',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Column(
              children: [
                Expanded(
                  child: ColumnSeparated(
                    separatorBuilder: (context, index) =>
                        SizedBox(height: context.appTheme.spacing.marginMedium),
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        '見込みランク',
                        style: TextStyle(
                          fontFamily: 'NotoSansJP',
                          package: 'core_ui',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Row(
                        children: [
                          Text('見込みランク'),
                          SizedBox(width: 250),
                          Text('売上管理の見込に含めるか'),
                        ],
                      ),
                      ValueListenableBuilder2(
                          first: context
                              .read<ProspectiveRankModel>()
                              .prospectiveRankData,
                          second: context.read<ProspectiveRankModel>().submit,
                          builder: (context, value, submit, _) {
                            return Skeletonizer(
                              enabled: value.loading || submit.loading,
                              child: ReactiveFormArray(
                                formArrayName: 'data',
                                builder: (context, formArray, child) {
                                  var rows = formArray.controls
                                      .map((controll) => controll as FormGroup)
                                      .map((currenForm) {
                                    return ReactiveForm(
                                      formGroup: currenForm,
                                      child: Row(
                                        children: [
                                          IntrinsicWidth(
                                            stepWidth: 300,
                                            child: ReactiveTextField(
                                              formControlName: 'prospectRank',
                                            ),
                                          ),
                                          const SizedBox(width: 20),
                                          ReactiveValueListenableBuilder(
                                              formControlName:
                                                  'shouldItBeIncludedInSalesManagementEstimates',
                                              builder:
                                                  (context, controller, _) {
                                                return SegmentedButton<bool>(
                                                  showSelectedIcon: false,
                                                  style: ButtonStyle(
                                                    enableFeedback: true,
                                                    shape:
                                                        MaterialStatePropertyAll(
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          side: BorderSide(
                                                              color: context
                                                                  .appTheme
                                                                  .primaryColor)),
                                                    ),
                                                    foregroundColor:
                                                        MaterialStatePropertyAll(
                                                            context.appTheme
                                                                .primaryColor),
                                                    side:
                                                        MaterialStatePropertyAll(
                                                      BorderSide(
                                                          color: context
                                                              .appTheme
                                                              .primaryColor),
                                                    ),
                                                  ),
                                                  segments: <ButtonSegment<
                                                      bool>>[
                                                    ButtonSegment<bool>(
                                                      value: true,
                                                      label: Text(
                                                        '含める',
                                                        style: TextStyle(
                                                          color: controller
                                                                      .value ==
                                                                  true
                                                              ? Colors.white
                                                              : context.appTheme
                                                                  .primaryColor,
                                                          fontFamily:
                                                              'NotoSansJP',
                                                          package: 'core_ui',
                                                        ),
                                                      ),
                                                      tooltip: '含める',
                                                    ),
                                                    ButtonSegment<bool>(
                                                      value: false,
                                                      label: Text(
                                                        '含めない',
                                                        style: TextStyle(
                                                          color: controller
                                                                      .value ==
                                                                  false
                                                              ? Colors.white
                                                              : context.appTheme
                                                                  .primaryColor,
                                                          fontFamily:
                                                              'NotoSansJP',
                                                          package: 'core_ui',
                                                        ),
                                                      ),
                                                      tooltip: '含めない',
                                                    ),
                                                  ],
                                                  onSelectionChanged:
                                                      (Set<bool> newSelection) {
                                                    controller.value =
                                                        newSelection.first;
                                                  },
                                                  selected: {
                                                    controller.value == true
                                                  },
                                                );
                                              }),
                                        ],
                                      ),
                                    );
                                  }).toList();
                                  return ColumnSeparated(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return SizedBox(
                                          height: context
                                              .appTheme.spacing.marginMedium);
                                    },
                                    children: [
                                      ColumnSeparated(
                                        separatorBuilder: (context, index) =>
                                            SizedBox(
                                                height: context.appTheme.spacing
                                                    .marginMedium),
                                        children: rows.toList(),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          formArray.add(
                                            FormGroup({
                                              '_id': FormControl<String>(),
                                              'prospectRank':
                                                  FormControl<String>(
                                                validators: [
                                                  Validators.required,
                                                ],
                                              ),
                                              'shouldItBeIncludedInSalesManagementEstimates':
                                                  FormControl<bool>(
                                                value: false,
                                              ),
                                            }),
                                          );
                                        },
                                        child: IntrinsicWidth(
                                          child: Row(
                                            children: [
                                              Icon(Icons.add_circle,
                                                  color: context
                                                      .appTheme.primaryColor),
                                              Text(
                                                '行を追加',
                                                style: TextStyle(
                                                    color: context
                                                        .appTheme.primaryColor),
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
                          }),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ValueListenableBuilder(
                        valueListenable:
                            context.read<ProspectiveRankModel>().submit,
                        builder: (context, submit, _) {
                          return ReactiveFormConsumer(
                              builder: (context, form, child) {
                            return ElevatedButton(
                              onPressed: !submit.loading && form.valid
                                  ? () {
                                      context
                                          .read<ProspectiveRankModel>()
                                          .submitProspectiveRank(form);
                                    }
                                  : null,
                              child: WithLoadingButton(
                                isLoading: submit.loading,
                                child: Text(
                                  '作成する',
                                  style: TextStyle(
                                    fontFamily: 'NotoSansJP',
                                    package: 'core_ui',
                                  ),
                                ),
                              ),
                            );
                          });
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
