import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:feature_hospital/src/detail/tabs/treatment/section/telemedicine_menu_section.dart';
import 'package:feature_hospital/src/detail/tabs/treatment/section/treatmenu_sectiion.dart';
import 'package:flutter/material.dart';

class TreatmentSection extends StatefulWidget {
  const TreatmentSection({super.key});

  @override
  State<TreatmentSection> createState() => _TreatmentSectionState();
}

class _TreatmentSectionState extends State<TreatmentSection> {
  @override
  Widget build(BuildContext context) {
    return ColumnSeparated(
      crossAxisAlignment: CrossAxisAlignment.start,
      separatorBuilder: (context, index) => SizedBox(
        height: context.appTheme.spacing.formSpacing,
      ),
      children: [
        const TreatmentMenuSection(),
        const TelemedicineMenuSection(),
        Align(
          alignment: Alignment.bottomRight,
          child: ElevatedButton(onPressed: () {}, child: const Text('印刷する')),
        )
      ],
    );
  }
}
