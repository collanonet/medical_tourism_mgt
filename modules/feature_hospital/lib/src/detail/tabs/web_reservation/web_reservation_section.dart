import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:feature_hospital/src/detail/tabs/web_reservation/section/medical_institution_section.dart';
import 'package:feature_hospital/src/detail/tabs/web_reservation/section/patient_section.dart';
import 'package:feature_hospital/src/detail/tabs/web_reservation/section/reservation_date_section.dart';
import 'package:feature_hospital/src/detail/tabs/web_reservation/section/reservation_history_section.dart';
import 'package:feature_hospital/src/detail/tabs/web_reservation/section/test_call_date_section.dart';
import 'package:flutter/material.dart';

class WebReservationSection extends StatefulWidget {
  const WebReservationSection({super.key});

  @override
  State<WebReservationSection> createState() => _WebReservationSectionState();
}

class _WebReservationSectionState extends State<WebReservationSection> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ColumnSeparated(
        crossAxisAlignment: CrossAxisAlignment.start,
        separatorBuilder: (context, index) => SizedBox(
          height: context.appTheme.spacing.formSpacing,
        ),
        children: const [
          PatientSection(),
          Divider(),
          MedicalInstitutionSection(),
          Divider(),
          ReservationDateSection(),
          Divider(),
          TestCallDateSection(),
          ReservationHistorySection()
        ],
      ),
    );
  }
}
