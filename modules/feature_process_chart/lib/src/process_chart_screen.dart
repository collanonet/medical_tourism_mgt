import 'package:auto_route/auto_route.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../feature_process_chart.gm.dart';
import 'filter_process_chart.dart';

class ProcessChartScreen extends StatelessWidget {
  const ProcessChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const ProcessChartFilter(),
        SizedBox(
          height: context.appTheme.spacing.marginMedium,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(onPressed: () {}, child: Text('簡易版行程表を新規作成')),
            SizedBox(
              width: context.appTheme.spacing.marginMedium,
            ),
            ElevatedButton(onPressed: () {}, child: Text('ツアー行程表を新規作成')),
          ],
        ),
        SizedBox(
          height: context.appTheme.spacing.marginMedium,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(
              context.appTheme.spacing.marginMedium,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  context.appTheme.spacing.borderRadiusMedium,
                ),
                color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(flex: 2, child: Text('ツアー名')),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    Expanded(flex: 2, child: Text('日程')),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    Expanded(child: Text('人数')),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    Expanded(child: Text('グループ')),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    Expanded(child: Text('種別')),
                  ],
                ),
                SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          context.router.push(const DetailProcessChartRoute());
                        },
                        child: Container(
                          padding: EdgeInsets.all(
                            context.appTheme.spacing.marginMedium,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                context.appTheme.spacing.borderRadiusMedium,
                              ),
                              color: index % 2 == 0
                                  ? Color(0xffEDF8F8)
                                  : Colors.white),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 2, child: Text('母子保健健康視察ツアー　４泊５日')),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              Expanded(
                                  flex: 2,
                                  child: Text('2023/10/22　ー　2023/10/29')),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              Expanded(child: Text('1')),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              Expanded(child: Text('2')),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text('新規見積依頼'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
