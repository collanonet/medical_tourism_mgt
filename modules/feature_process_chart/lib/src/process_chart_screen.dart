import 'package:flutter/material.dart';

import 'filter_process_chart.dart';

class ProcessChartScreen extends StatelessWidget {
  const ProcessChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProcessChartFilter(),
        const Center(
          child: Text('Process Chart Screen'),
        ),
      ],
    );
  }
}
