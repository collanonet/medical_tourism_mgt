// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'statement_model.dart';
import 'statement_screen_form.dart';

class StatementScreen extends StatelessWidget {
  const StatementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: context.watch<StatementModel>().medicalInvoiceData,
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
                        '書類番号',
                        style: context.textTheme.bodySmall,
                      )),
                      Expanded(
                          child: Text(
                        '種別',
                        style: context.textTheme.bodySmall,
                      )),
                      Expanded(
                          child: Text(
                        '宛先',
                        style: context.textTheme.bodySmall,
                      )),
                      Expanded(
                          child: Text(
                        '発行日',
                        style: context.textTheme.bodySmall,
                      )),
                      Expanded(
                          flex: 2,
                          child: Text(
                            '件名',
                            style: context.textTheme.bodySmall,
                          )),
                      Expanded(
                          child: Text(
                        'エージェントへ開示',
                        style: context.textTheme.bodySmall,
                      )),
                      Expanded(
                          child: Text(
                        '患者へ開示',
                        style: context.textTheme.bodySmall,
                      )),
                      Expanded(
                          child: Text(
                        '実績反映',
                        style: context.textTheme.bodySmall,
                      )),
                      Expanded(
                          child: SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      )),
                    ],
                  ),
                  const Divider(),
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: value.data?.length ?? 0,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) => InkWell(
                      onTap: () {},
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
                              '19Y−0630−1',
                              style: context.textTheme.bodySmall,
                            )),
                            Expanded(
                                child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal:
                                        context.appTheme.spacing.marginExtraSmall,
                                    vertical:
                                        context.appTheme.spacing.marginExtraSmall,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.red,
                                    ),
                                    borderRadius: BorderRadius.circular(context
                                        .appTheme.spacing.borderRadiusMedium),
                                  ),
                                  child: Text(
                                    '見積書',
                                    style: context.textTheme.bodySmall?.copyWith(
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
                              '2023/07/18',
                              style: context.textTheme.bodySmall,
                            )),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  '劉 偉強 様　呼吸器疾患の受診（京大病院）',
                                  style: context.textTheme.bodySmall,
                                )),
                            Expanded(
                                child: Text(
                              '○',
                              style: context.textTheme.bodySmall,
                            )),
                            Expanded(
                                child: Text(
                              '×',
                              style: context.textTheme.bodySmall,
                            )),
                            Expanded(
                                child: Text(
                              'ー',
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
                    ),
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        thickness: 0.5,
                      );
                    },
                  ),
                  SizedBox(
                    height: context.appTheme.spacing.marginMedium,
                  ),
                  const StatementScreenForm()
                ],
              ),
            ),
          );
        });
  }
}
