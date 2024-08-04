import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../g_and_a_model.dart';

class QAndAListSection extends StatefulWidget {
  const QAndAListSection({super.key});

  @override
  State<QAndAListSection> createState() => _QAndAListSectionState();
}

class _QAndAListSectionState extends State<QAndAListSection> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final formGroup = (ReactiveForm.of(context) as FormGroup)
        .control('listSection') as FormGroup;
    return ReactiveForm(
        formGroup: formGroup,
        child: ColumnSeparated(
            crossAxisAlignment: CrossAxisAlignment.start,
            separatorBuilder: (context, index) => SizedBox(
                  height: context.appTheme.spacing.formSpacing,
                ),
            children: [
              RowSeparated(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  separatorBuilder: (context, index) => SizedBox(
                        width: context.appTheme.spacing.formSpacing,
                      ),
                  children: [
                    Text(
                      'Q＆A一覧',
                      style: context.textTheme.bodyLarge,
                    ),
                    RowSeparated(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        separatorBuilder: (context, index) => SizedBox(
                              width: context.appTheme.spacing.formSpacing,
                            ),
                        children: [
                          ColumnSeparated(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              separatorBuilder: (context, index) => SizedBox(
                                    height: context
                                        .appTheme.spacing.marginExtraSmall,
                                  ),
                              children: [
                                Text(
                                  '分類',
                                  style: context.textTheme.bodyMedium,
                                ),
                                IntrinsicWidth(
                                  stepWidth:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: ReactiveDropdownField(
                                    formControlName: 'classification',
                                    items: const [
                                      DropdownMenuItem(
                                        value: '予約方法について',
                                        child: Text('予約方法について'),
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                          IntrinsicWidth(
                            stepWidth: MediaQuery.of(context).size.width * 0.2,
                            child: ReactiveTextField(
                              formControlName: 'enterKeyword',
                              decoration:
                                  const InputDecoration(hintText: 'キーワードを入力'),
                            ),
                          ),
                          ReactiveFormConsumer(builder: (context, form, _) {
                            return ElevatedButton(
                              onPressed: () {
                                context.read<QAndAModel>().fetchDataAndSearch(
                                      classification: formGroup
                                          .control('classification')
                                          .value,
                                      search: formGroup
                                          .control('enterKeyword')
                                          .value,
                                    );
                              },
                              child: const Text(
                                '保存する',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            );
                          }),
                        ])
                  ]),
              ValueListenableBuilder(
                valueListenable:
                    context.read<QAndAModel>().newRegistrationHospitalData,
                builder: (context, value, child) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: value.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: ExpansionTile(
                            collapsedBackgroundColor:
                                context.appTheme.primaryBackgroundColor,
                            title: Text(
                              value.requireData[index].question.toString(),
                              style: context.textTheme.bodyMedium!.copyWith(
                                  color: context.appTheme.primaryColor),
                            ),
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Text(
                                      // '更新日：${value.requireData[index].updatedDate.toString()}　更新者：${value.requireData[index].updatedBy}',
                                      '更新日：${value.requireData[index].updatedDate == null ? '' : Dates.formatFullDate(value.requireData[index].updatedDate!)}　更新者：${value.requireData[index].updatedBy}',
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Text(
                                      value.requireData[index].answer ?? '',
                                      softWrap: true,
                                    ),
                                  ),
                                  RowSeparated(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                            width: context
                                                .appTheme.spacing.formSpacing,
                                          ),
                                      children: [
                                        ValueListenableListener(
                                          valueListenable: context
                                              .read<QAndAModel>()
                                              .newRegistrationHospitalData,
                                          onListen: () {
                                            var value = context
                                                .read<QAndAModel>()
                                                .delete
                                                .value;

                                            if (value.hasError) {
                                              snackBarWidget(
                                                message: '削除に失敗しました',
                                                backgroundColor: Colors.red,
                                                prefixIcon: const Icon(
                                                    Icons.error,
                                                    color: Colors.white),
                                              );
                                            }

                                            if (value.hasData) {
                                              snackBarWidget(
                                                message: '削除しました',
                                                prefixIcon: const Icon(
                                                    Icons.check_circle,
                                                    color: Colors.white),
                                              );
                                            }
                                          },
                                          child: ValueListenableBuilder(
                                              valueListenable: context
                                                  .read<QAndAModel>()
                                                  .newRegistrationHospitalData,
                                              builder: (context, value, _) {
                                                return OutlinedButton(
                                                    onPressed: () {
                                                      context
                                                          .read<QAndAModel>()
                                                          .deleteData(
                                                              value.requireData[
                                                                  index]);
                                                    },
                                                    child: WithLoadingButton(
                                                        isLoading:
                                                            value.loading,
                                                        color: context.appTheme
                                                            .primaryColor,
                                                        child: Text(
                                                          "削除する",
                                                          style: context
                                                              .textTheme
                                                              .labelLarge
                                                              ?.copyWith(
                                                                  color: context
                                                                      .appTheme
                                                                      .primaryColor),
                                                        )));
                                              }),
                                        ),
                                        OutlinedButton(
                                            onPressed: () {},
                                            child: Text(
                                              "編集する",
                                              style: context
                                                  .textTheme.labelLarge
                                                  ?.copyWith(
                                                      color: context.appTheme
                                                          .primaryColor),
                                            )),
                                        ElevatedButton(
                                          onPressed: () {},
                                          child: const Text(
                                            'コピーする',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ]),
                                  SizedBox(
                                    height: 10,
                                  )
                                ],
                              )
                            ]),
                      );
                    },
                  );
                },
              ),
            ]));
  }
}
