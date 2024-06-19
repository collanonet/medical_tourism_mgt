import 'package:core_network/entities.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:feature_hospital/src/detail/tabs/basic_information/basic_information_screen.dart';
import 'package:feature_hospital/src/detail/tabs/contract/contract_screen.dart';
import 'package:feature_hospital/src/detail/tabs/document/document_screen.dart';
import 'package:feature_hospital/src/detail/tabs/facility_photo/facility_photo_screen.dart';
import 'package:feature_hospital/src/detail/tabs/health_checkup/health_checkup_screen.dart';
import 'package:feature_hospital/src/detail/tabs/materials/materials_screen.dart';
import 'package:feature_hospital/src/detail/tabs/q_and_a/q_and_a_screen.dart';
import 'package:feature_hospital/src/detail/tabs/treatment/treatment_screen.dart';
import 'package:feature_hospital/src/detail/tabs/web_reservation/web_reservation_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/header_detail_hospital.dart';

class HospitalDetailScreen extends StatefulWidget {
  const HospitalDetailScreen({
    super.key,
    this.hospital,
  });
  final Hospital? hospital;

  @override
  State<HospitalDetailScreen> createState() => _HospitalDetailScreenState();
}

class _HospitalDetailScreenState extends State<HospitalDetailScreen> {
  List<String> menu = [
    '基本情報', // basic information
    'パンフ・資料', // materials
    'Q＆A', //
    '施設写真', // Facility photos
    'Web 予約', //
    '健診メニュー', // Health checkup menu
    '治療メニュー', // treatment menu
    '書類', // document
    '契約書', // contract
  ];

  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      const BasicInformationScreen(),
      const MaterialsScreen(),
      const QAndAScreen(),
      const FacilityPhotoScreen(),
      const WebReservationScreen(),
      const HealthCheckupScreen(),
      const TreatmentScreen(),
      const DocumentScreen(),
      const ContractScreen(),
    ];
  }

  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderDetailHospital(),
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
