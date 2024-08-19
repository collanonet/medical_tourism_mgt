import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class StudyOfDICOMTab extends StatelessWidget {
  const StudyOfDICOMTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              ElevatedButton(onPressed: null, child: Text('001-C-20')),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              ElevatedButton(onPressed: null, child: Text('王　沐宸')),
            ],
          ),
        ],
      ),
    );
  }
}
