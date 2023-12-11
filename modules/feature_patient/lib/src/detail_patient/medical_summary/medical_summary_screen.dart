import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';

import 'tabs/auto_translate_page.dart';
import 'tabs/normal_summary_page.dart';
import 'tabs/short_summary_page.dart';
import 'tabs/summary_list_page.dart';
import 'package:flutter/material.dart';

class MedicalSummaryScreen extends StatefulWidget {
  const MedicalSummaryScreen({super.key});

  @override
  State<MedicalSummaryScreen> createState() => _MedicalSummaryScreenState();
}

class _MedicalSummaryScreenState extends State<MedicalSummaryScreen> {
  List<String> menu = const [
    '自動翻訳', // Auto translate
    'サマリー（通常版）', // Summary (Normal version)
    'サマリー（簡易版）', // Summary (Simple version)
    'サマリー一覧', // Summary list
  ];

  List<Widget> pages = const [
    AutoTranslatePage(),
    NormalSummaryPage(),
    ShortSummaryPage(),
    SummaryListPage(),
  ];
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
                    menu: menu,
                    onPressed: (index) {
                      _selectedIndex.value = index;
                    },
                  ),
                ],
              );
            },
          ),
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
                child: pages[index],
              ),
            );
          },
        )
      ],
    );
  }
}
