import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';

import 'tab/application_beauty_page.dart';
import 'tab/application_regenerative_medicine_page.dart';
import 'tab/patient_response_medical_checkup_page.dart';
import 'tab/patient_response_other_page.dart';
import 'tab/patient_response_treatment_page.dart';

class PatientResponseScreen extends StatefulWidget {
  const PatientResponseScreen({super.key, this.patientId});
  final String? patientId;
  @override
  State<PatientResponseScreen> createState() => _PatientResponseScreenState();
}

class _PatientResponseScreenState extends State<PatientResponseScreen> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                    menu: [
                      '治療', // TODO: l10n 対応 (治療) (treatment)
                      '健診', // TODO: l10n 対応 (健診) (Medical checkup)
                      'その他', // TODO: l10n 対応 (その他) (other)
                      '申込_再生医療',
                      '申込_美容',
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
                  PatientResponseTreatmentPage(patientId: widget.patientId),
                  PatientResponseMedicalCheckupPage(
                      patientId: widget.patientId),
                  PatientResponseOtherPage(patientId: widget.patientId),
                  ApplicationRegenerativeMedicalPage(
                      patientId: widget.patientId),
                  ApplicationBeautyPage(patientId: widget.patientId),
                ][index],
              ),
            );
          },
        )
      ],
    );
  }
}
