// Flutter imports:
import 'package:core_l10n/l10n.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Project imports:
import '../../feature_report.gm.dart';
import 'contract_form.dart';
import 'contract_model.dart';

class ContractScreen extends StatelessWidget {
  const ContractScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ContractModel>(
      builder: (context, value, _) {
        return ReactiveFormConfig(
          validationMessages: validationMessages,
          child: ReactiveFormBuilder(
            form: () => contractForm(),
            builder: (context, formGroup, child) {
              return Skeletonizer(
                enabled: value.filterData.value.loading,
                child: ColumnSeparated(
                  separatorBuilder: (context, index) =>
                      SizedBox(height: context.appTheme.spacing.marginMedium),
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 280,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: ColumnSeparated(
                        separatorBuilder: (context, index) => SizedBox(
                          height: context.appTheme.spacing.marginMedium,
                        ),
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('契約書ひな形検索',
                              style: context.textTheme.titleMedium),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('契約書名'),
                                  IntrinsicWidth(
                                    stepWidth: 300,
                                    child: ReactiveTextField(
                                      formControlName: 'documentName',
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          RowSeparated(
                            separatorBuilder: (context, index) => SizedBox(
                                width: context.appTheme.spacing.marginMedium),
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('甲'),
                                  IntrinsicWidth(
                                    stepWidth: 200,
                                    child: ValueListenableBuilder(
                                      valueListenable:
                                          context.read<ContractModel>().listA,
                                      builder: (context, value, _) {
                                        return ReactiveDropdownFormField(
                                          formControlName: 'first',
                                          items: value
                                              .map((e) => DropdownMenuItem(
                                                    value: e.item,
                                                    child: Text(
                                                      e.item,
                                                    ),
                                                  ))
                                              .toList(),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('乙'),
                                  IntrinsicWidth(
                                    stepWidth: 200,
                                    child: ValueListenableBuilder(
                                      valueListenable:
                                          context.read<ContractModel>().listB,
                                      builder: (context, value, _) {
                                        return ReactiveDropdownFormField(
                                          formControlName: 'second',
                                          items: value
                                              .map((e) => DropdownMenuItem(
                                                    value: e.item,
                                                    child: Text(
                                                      e.item,
                                                    ),
                                                  ))
                                              .toList(),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('締結方法'),
                                  IntrinsicWidth(
                                    stepWidth: 200,
                                    child: ValueListenableBuilder(
                                      valueListenable: context
                                          .read<ContractModel>()
                                          .listFasteningMethod,
                                      builder: (context, value, _) {
                                        return ReactiveDropdownFormField(
                                          formControlName: 'methodOfConclusion',
                                          items: value
                                              .map((e) => DropdownMenuItem(
                                                    value: e.item,
                                                    child: Text(
                                                      e.item,
                                                    ),
                                                  ))
                                              .toList(),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Expanded(
                                child: RowSeparated(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const SizedBox(width: 16);
                                  },
                                  children: [
                                    OutlinedButton(
                                      onPressed: () {
                                        formGroup.reset();
                                        value.contractFilter();
                                      },
                                      child: Text(
                                        context.l10n.actionClear,
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        value.contractFilter(
                                            formGroup: formGroup);
                                      },
                                      child: Text(context.l10n.actionSearch),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            context.router.push(const ContractDetailRoute());
                          },
                          child: const Text('新規登録'),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                SizedBox(width: 50),
                                Expanded(
                                  flex: 1,
                                  child: Text('甲'),
                                ),
                                Expanded(
                                  child: Text('乙'),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text('書類名'),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text('更新日'),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text('病院との契約先'),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text('締結方法'),
                                ),
                              ],
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.all(20),
                                  child: ColumnSeparated(
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return const SizedBox(height: 16);
                                      },
                                      children: [
                                        ListView.separated(
                                          shrinkWrap: true,
                                          itemCount: value.filterData.value.data
                                                  ?.length ??
                                              0,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            var respone = value
                                                .filterData.value.data![index];
                                            return Container(
                                              decoration: BoxDecoration(
                                                color: index.isEven
                                                    ? context
                                                        .appTheme.primaryColor
                                                        .withOpacity(0.1)
                                                    : Colors.white,
                                              ),
                                              padding: const EdgeInsets.all(10),
                                              child: RowSeparated(
                                                separatorBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return const SizedBox(
                                                      width: 16);
                                                },
                                                children: [
                                                  box(
                                                      context.appTheme
                                                          .successColor,
                                                      '自社'),
                                                  const SizedBox(width: 20),
                                                  box(
                                                      respone.second == '患者'
                                                          ? Colors.purple
                                                          : respone.first ==
                                                                  'AG'
                                                              ? Colors.pink
                                                              : Colors.blue,
                                                      respone.second == '患者'
                                                          ? '患者'
                                                          : respone.second ==
                                                                  'AG'
                                                              ? 'AG'
                                                              : '病院'),
                                                  const SizedBox(width: 20),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Text(
                                                      respone.documentName ??
                                                          '--//--',
                                                      style: context
                                                          .textTheme.bodySmall,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                      respone.updateDate != null
                                                          ? Dates.formatFullDate(
                                                              respone
                                                                  .updateDate!)
                                                          : '--//--',
                                                      style: context
                                                          .textTheme.bodyMedium,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      respone.methodOfConclusion ??
                                                          '--//--',
                                                      style: context
                                                          .textTheme.bodyMedium,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    child: respone.user == true
                                                        ? Container(
                                                            width: 80,
                                                            height: 30,
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    vertical: 5,
                                                                    horizontal:
                                                                        10),
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              border:
                                                                  Border.all(
                                                                color: const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    6,
                                                                    235,
                                                                    216),
                                                              ),
                                                            ),
                                                            child: const Center(
                                                              child:
                                                                  Text('運用中'),
                                                            ),
                                                          )
                                                        : const SizedBox(),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                          separatorBuilder: (context, index) {
                                            return const Divider(
                                              thickness: 0.5,
                                            );
                                          },
                                        )
                                      ]),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}

Widget box(Color color, String text) {
  return Container(
    width: 80,
    height: 30,
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(5),
    ),
    child: Center(
      child: Text(text),
    ),
  );
}
