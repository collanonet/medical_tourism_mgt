import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../feature_report.gm.dart';
import 'filter_report.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReportFilter(),
        Row(children: [
          ElevatedButton(
            onPressed: () {
              context.router.push(const ReportTypeRoute());
            },
            child: const Text('種別マスタ'),
          ),
        ],),
        const Center(
          child: Text('Report Screen',
            style: TextStyle(
              fontFamily: 'NotoSansJP',
              package: 'core_ui',
            ),),
        ),
      ],
    );
  }
}
