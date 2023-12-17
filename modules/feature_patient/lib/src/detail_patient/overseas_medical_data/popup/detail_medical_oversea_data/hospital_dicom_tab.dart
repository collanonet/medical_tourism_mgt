import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class HospitalDICOMTab extends StatelessWidget {
  const HospitalDICOMTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            decoration: InputDecoration(
              isDense: true,
              hintText: 'コメント 大阪府済生会吹田病院',
            ),
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          TextFormField(
            decoration: InputDecoration(
              isDense: true,
              hintText: 'コメント 自社',
            ),
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          TextFormField(
            decoration: InputDecoration(
              isDense: true,
              hintText: 'コメント 大阪府済生会吹田病院',
            ),
          ),
        ],
      ),
    );
  }
}
