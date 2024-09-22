// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';

import 'section/after_getting_visa.dart';
import 'section/after_getting_visa_final.dart';
import 'section/document_required_in_japan.dart';
import 'section/length_of_stay.dart';
import 'section/necessary_in_japan.dart';
import 'section/travel_companion.dart';
import 'section/visa_withdrawal.dart';
import 'section/your_visa.dart';

class MedicalVisaScreen extends StatefulWidget {
  const MedicalVisaScreen({super.key});

  @override
  State<MedicalVisaScreen> createState() => _MedicalVisaScreenState();
}

class _MedicalVisaScreenState extends State<MedicalVisaScreen> {
  List<String> menu = const [
    '短期滞在の期間の延長', // Extension of short-term stay period
    '特定活動の期間の延長', // Extension of period of specific activities
    '短期滞在　医療ビザ→特定活動', // Short-term stay medical visa → Specific activities
    '海外での特定活動ビザ変更', // Change of specific activity visa overseas
  ];
  final formatter = InputFormatter();
  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    // final formGroup = ReactiveForm.of(context) as FormGroup;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const YourVisa(),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          const LengthOfStay(),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          const DocumentRequired(),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          const VisaWithdrawal(),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          const AfterGettingVisa(),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          const TravelCompanion(),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Padding(
            padding:
                EdgeInsets.only(top: context.appTheme.spacing.marginMedium),
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
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Row(children: [
            const Expanded(
              child: Text('書類'),
            ),
            SizedBox(
              width: context.appTheme.spacing.marginMedium,
            ),
            const Expanded(
              child: Text('発行日'),
            ),
            SizedBox(
              width: context.appTheme.spacing.marginMedium,
            ),
            Expanded(
              child: SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
            ),
          ]),
          const Divider(),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),

          const NecessaryInJapan(),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
           const AfterGettingVisaFinal(),

          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
        ],
      ),
    );
  }
}
