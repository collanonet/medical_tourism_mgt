import 'package:core_network/entities.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:feature_patient/src/detail_patient/statement/statement_page.dart';
import '../widgets/header_detail_patient.dart';
import 'package:flutter/material.dart';

import 'basic_info/basic_info_page.dart';
import 'domestic_medical_data/domestic_medical_data_page.dart';
import 'estimate/estimate_page.dart';
import 'medical_payment_details/medical_payment_details_page.dart';
import 'medical_summary/medical_summary_page.dart';
import 'medical_visa/medical_visa_page.dart';
import 'overseas_medical_data/overseas_medical_data_page.dart';
import 'progress_list/progress_list_page.dart';

class DetailPatientScreen extends StatefulWidget {
  const DetailPatientScreen({
    super.key,
    required this.patient,
  });
  final Patient patient;
  @override
  State<DetailPatientScreen> createState() => _DetailPatientScreenState();
}

class _DetailPatientScreenState extends State<DetailPatientScreen> {
  List<String> menu = [
    "基本情報", //basicInfo
    "進捗一覧", // progressList
    "海外診療データ", //overseasMedicalData
    "診療サマリー", //medicalSummary
    "医療ビザ", //medicalVisa
    "国内診療データ", //domesticMedicalData
    "見積書", //estimate
    "精算書", //statement
    "診療報酬明細", //medicalPaymentDetails
  ];

  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      BasicInformationPage(
        patient: widget.patient,
      ),
      ProgressListPage(
        patient: widget.patient,
      ),
      OverseasMedicalDataPage(
        patient: widget.patient,
      ),
      MedicalSummaryPage(
        patient: widget.patient,
      ),
      MedicalVisaPage(
        patient: widget.patient,
      ),
      DomesticMedicalDataPage(
        patient: widget.patient,
      ),
      EstimatePage(
        patient: widget.patient,
      ),
      StatementPage(
        patient: widget.patient,
      ),
      MedicalPaymentDetailsPage(
        patient: widget.patient,
      ),
    ];
  }

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
            },
          ),
        ),
        ValueListenableBuilder<int>(
          valueListenable: _selectedIndex,
          builder: (BuildContext context, int index, Widget? child) {
            return pages[index];
          },
        )
      ],
    );
  }
}
