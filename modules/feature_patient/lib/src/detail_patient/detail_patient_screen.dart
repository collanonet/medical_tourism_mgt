import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:feature_patient/src/widgets/header_detail_patient.dart';
import 'package:flutter/material.dart';

class DetailPatientScreen extends StatefulWidget {
  const DetailPatientScreen({super.key});

  @override
  State<DetailPatientScreen> createState() => _DetailPatientScreenState();
}

class _DetailPatientScreenState extends State<DetailPatientScreen> {
  List<String> menu = [
    "基本情報",
    "基本情報",
    "海外診療データ",
    "診療サマリー",
    "医療ビザ",
    "国内診療データ",
    "見積書",
    "精算書"
  ];

  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderDetailPatient(),
        Padding(
          padding: EdgeInsets.only(top: context.appTheme.spacing.marginMedium),
          child: ValueListenableBuilder<int>(
              valueListenable: _selectedIndex,
              builder: (BuildContext context, int value, Widget? child) {
                return TabBarWidget(
                  selectedIndex: value,
                  menu: menu,
                  onPressed: (index) {
                    _selectedIndex.value = index;
                  },
                );
              }),
        ),
        ValueListenableBuilder<int>(
          valueListenable: _selectedIndex,
          builder: (BuildContext context, int value, Widget? child) {
            return Center(
              child: Text(menu[value]),
            );
          },
        )
      ],
    );
  }
}
