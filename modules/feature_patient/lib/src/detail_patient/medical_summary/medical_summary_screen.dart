// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';

// Project imports:
import 'tabs/auto_translate_page.dart';
import 'tabs/normal_summary_page.dart';
import 'tabs/short_summary_page.dart';
import 'tabs/summary_list_page.dart';

class MedicalSummaryScreen extends StatefulWidget {
  const MedicalSummaryScreen({super.key, this.patientId});
  final String? patientId;

  @override
  State<MedicalSummaryScreen> createState() => _MedicalSummaryScreenState();
}

class _MedicalSummaryScreenState extends State<MedicalSummaryScreen> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: context.appTheme.spacing.marginMedium),
          child: ValueListenableBuilder<int>(
            valueListenable: _selectedIndex,
            builder: (BuildContext context, int value, Widget? child) {
              return Row(
                children: [
                  TabBarWidget(
                    selectedIndex: value,
                    menu: const [
                      'サマリー',
                      'サマリー一覧',
                    ],
                    onPressed: (index) {
                      _selectedIndex.value = index;
                    },
                  ),
                ],
              );
            },
          ),
        ),
        Divider(
          color: context.appTheme.primaryColor,
          thickness: 2,
          height: 0,
        ),
        ValueListenableBuilder<int>(
          valueListenable: _selectedIndex,
          builder: (BuildContext context, int index, Widget? child) {
            return Expanded(
              child: Container(
                padding: EdgeInsets.all(context.appTheme.spacing.marginMedium),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      context.appTheme.spacing.borderRadiusMedium),
                  color: Colors.white,
                ),
                child: [
                  NormalSummaryPage(patientId: widget.patientId),
                  SummaryListPage(patientId: widget.patientId),
                ][index],
              ),
            );
          },
        )
      ],
    );
  }
}
