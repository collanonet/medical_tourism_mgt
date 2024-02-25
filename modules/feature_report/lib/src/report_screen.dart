import 'package:auto_route/auto_route.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:feature_report/src/report_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../feature_report.gm.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.all(context.appTheme.spacing.gutter),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
                context.appTheme.spacing.borderRadiusMedium),
          ),
          child: const Text(
            '種別マスタ',
            style: TextStyle(
              fontFamily: 'NotoSansJP',
              package: 'core_ui',
            ),
          ),
        ),
        SizedBox(
          height: context.appTheme.spacing.marginMedium,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(context.appTheme.spacing.gutter),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                  context.appTheme.spacing.borderRadiusMedium),
            ),
            child: Column(
              children: [
                RowSeparated(
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    );
                  },
                  children: [
                    Expanded(
                      child: ValueListenableBuilder(
                          valueListenable: context.read<ReportModel>().dataType,
                          builder: (context, value, child) {
                            return Skeletonizer(
                              enabled: value.loading,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '種別マスタ',
                                    style: TextStyle(
                                      fontFamily: 'NotoSansJP',
                                      package: 'core_ui',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Divider(
                                    color: context.appTheme.primaryColor,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      context.router
                                          .push(const ReportTypeRoute());
                                    },
                                    child: const Text('種別マスタ'),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    Expanded(child: SizedBox()),
                    Expanded(child: SizedBox()),
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
