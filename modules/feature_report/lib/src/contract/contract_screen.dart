import 'package:auto_route/auto_route.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
          padding: EdgeInsets.all(16),
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
                      Text('契約書名'),
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
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('　検索　'),
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
              child: Text('新規登録'),
            ),
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(16),
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
                    flex: 1,
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
              RowSeparated(
                separatorBuilder: (context, index) =>
                    SizedBox(height: context.appTheme.spacing.marginMedium),
                children: [
                  Column(
                    children: List.generate(5, (index) {
                      return RowSeparated(
                        separatorBuilder: (context, index) => SizedBox(
                            height: context.appTheme.spacing.marginMedium),
                        children: [
                          Expanded(
                            child: Container(
                              width: 75,
                              height: 35,
                              decoration: BoxDecoration(
                                color: Colors.green[400],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 5),
                              child: Center(child: Text('自社')),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: 75,
                              height: 35,
                              decoration: BoxDecoration(
                                color: Colors.purple[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 5),
                              child: Center(child: Text('患者')),
                            ),
                          ),
                          Expanded(
                            child: Text('【医療滞在ビザのみ契約書 日本語】医療滞在ビザ身元保証　契約書'),
                          ),
                          Expanded(
                            child: Text('2020/04/22'),
                          ),
                          Expanded(child: Text('MS法人')),
                          Expanded(
                            child: Container(
                              width: 75,
                              height: 35,
                              decoration: BoxDecoration(
                                color: Colors.purple[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 5),
                              child: Center(
                                child: Text('電子契約'),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
