import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:feature_patient/src/detail_patient/basic_info/section/medical_record_agent_section.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'section/medical_record_budget_section.dart';
import 'section/medical_record_companion_section.dart';
import 'section/medical_record_hospital_section.dart';
import 'section/medical_record_interpreter_section.dart';
import 'section/medical_record_name_section.dart';
import 'section/medical_record_nationality_section.dart';
import 'section/medical_record_passport_section.dart';
import 'section/medical_record_referrer_section.dart';
import 'section/medical_record_section.dart';

class BasicInfoSection extends StatelessWidget {
  const BasicInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      trackVisibility: true,
      thumbVisibility: true,
      child: SingleChildScrollView(
        primary: true,
        child: Padding(
          padding:
              EdgeInsets.only(right: context.appTheme.spacing.marginMedium),
          child: ColumnSeparated(
            crossAxisAlignment: CrossAxisAlignment.start,
            separatorBuilder: (BuildContext context, int index) =>
                SizedBox(height: context.appTheme.spacing.formSpacing),
            children: [
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('メモ（エージェント/病院には共有されません）',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  ReactiveTextField(
                    formControlName: 'memo',
                    maxLines: 3,
                  ),
                ],
              ), // TODO: l10n 対応 (memo)

              Column(
                children: [
                  const MedicalRecordSection(),
                  Divider(
                    color: Colors.grey,
                    height: 0,
                    indent: context.appTheme.spacing.marginMedium,
                    endIndent: context.appTheme.spacing.marginMedium,
                  ),
                  const MedicalRecordHospitalSection(),
                ],
              ),
              const MedicalRecordNameSection(),
              const MedicalRecordNationalitySection(),
              const MedicalRecordBudgetSection(),
              const MedicalRecordPassportSection(),
              Divider(
                height: 0,
                color: context.appTheme.dividerColor,
              ),
              const MedicalRecordAgentSection(),
              const MedicalRecordReferrerSection(),
              const MedicalRecordInterpreterSection(),
              const MedicalRecordCompanionSection(),
            ],
          ),
        ),
      ),
    );
  }
}
