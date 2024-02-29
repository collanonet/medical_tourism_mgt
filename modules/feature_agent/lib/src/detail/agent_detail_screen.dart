import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';

import 'sub/basic_information/basic_information_page.dart';

class AgentDetailScreen extends StatefulWidget {
  const AgentDetailScreen({super.key, this.id});
  final String? id;
  @override
  State<AgentDetailScreen> createState() => _AgentDetailScreenState();
}

class _AgentDetailScreenState extends State<AgentDetailScreen> {
  List<String> menu = <String>[
    '基本情報', // basic information
    '対応患者', // Compatible patients
    '契約書', // contract
    '見積書・請求書', // Estimate/Invoice
  ];

  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    logger.d('widget.id: ${widget.id}');
    pages = <Widget>[
      AgentBasicInformationPage(id: widget.id),
      Container(),
      Container(),
      Container(),
    ];
  }

  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: ColumnSeparated(
            crossAxisAlignment: CrossAxisAlignment.start,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 16);
            },
            children: [
              Text(
                '大瀚人力资源集团',
                style: context.textTheme.titleLarge,
              ),
              Text(
                'ダーハンレンリーカズーユエンジトウァン',
                style: context.textTheme.titleSmall,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: context.appTheme.spacing.marginMedium,
              left: context.appTheme.spacing.marginMedium),
          child: ValueListenableBuilder<int>(
            valueListenable: _selectedIndex,
            builder: (BuildContext context, int value, Widget? child) {
              return Wrap(
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
