// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';

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
              const ElevatedButton(onPressed: null, child: Text('001-C-20')),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              const ElevatedButton(onPressed: null, child: Text('王　沐宸')),
            ],
          ),
        ],
      ),
    );
  }
}
