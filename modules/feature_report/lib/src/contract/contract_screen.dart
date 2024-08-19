import 'package:auto_route/auto_route.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../feature_report.gm.dart';
import 'contract_model.dart';

class ContractScreen extends StatelessWidget {
  const ContractScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ColumnSeparated(
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
              Text('契約書ひな形検索', style: context.textTheme.titleMedium),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('契約書名'),
                      IntrinsicWidth(
                        stepWidth: 300,
                        child: ReactiveTextField(
                          formControlName: 'agreementName',
                        ),
                      )
                    ],
                  )
                ],
              ),
              RowSeparated(
                separatorBuilder: (context, index) =>
                    SizedBox(width: context.appTheme.spacing.marginMedium),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('甲'),
                      IntrinsicWidth(
                        stepWidth: 200,
                        child: ValueListenableBuilder(
                          valueListenable: context.read<ContractModel>().listA,
                          builder: (context, value, _) {
                            return ReactiveDropdownFormField(
                              formControlName: 'contractA',
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
                          valueListenable: context.read<ContractModel>().listB,
                          builder: (context, value, _) {
                            return ReactiveDropdownFormField(
                              formControlName: 'contractB',
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
                          valueListenable:
                              context.read<ContractModel>().listFasteningMethod,
                          builder: (context, value, _) {
                            return ReactiveDropdownFormField(
                              formControlName: 'fastening_method',
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
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('　検索　'),
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
                        separatorBuilder: (context, index) => SizedBox(
                          height: context.appTheme.spacing.marginMedium,
                        ),
                        children: [
                          ColumnSeparated(
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(height: 16);
                            },
                            children: List.generate(
                              10,
                              (index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: index.isEven
                                        ? context.appTheme.primaryColor
                                            .withOpacity(0.1)
                                        : Colors.white,
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: RowSeparated(
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return const SizedBox(width: 16);
                                    },
                                    children: [
                                      boxRequired(
                                          enabled: index.isEven ? true : false,
                                          label: '見積書'),
                                      const SizedBox(width: 20),
                                      boxRequired(
                                          enabled: index.isEven ? true : false,
                                          label: '患者'),
                                      const SizedBox(width: 20),
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          '【医療滞在ビザのみ契約書 日本語】医療滞在ビザ身元保証　契約書',
                                          style: context.textTheme.bodySmall,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          '2020/04/22',
                                          style: context.textTheme.bodyMedium,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          'MS法人',
                                          style: context.textTheme.bodyMedium,
                                        ),
                                      ),
                                      boxRequired(enabled: true, label: '電子契約'),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                
              ],
            ),
          ),
        )
      ],
    );
  }
}
