import 'package:flutter/cupertino.dart';

import 'filter_report.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReportFilter(),
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
