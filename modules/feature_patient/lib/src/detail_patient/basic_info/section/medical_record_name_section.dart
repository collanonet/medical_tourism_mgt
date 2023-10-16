import 'package:core_network/entities.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../basic_info_model.dart';

class MedicalRecordNameSection extends StatelessWidget {
  const MedicalRecordNameSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BasicInformationModel>(
      builder: (context, model, child) => Skeletonizer(
        enabled: model.patientNames.loading,
        child: ReactiveFormArray(
          formArrayName: 'PATIENT_NAMES',
          builder: (context, formArray, child) {
            final rows = formArray.controls
                .map((control) => control as FormGroup)
                .map(
                  (currentForm) => ReactiveForm(
                    formGroup: currentForm,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currentForm.control('nameType').value ==
                                  NameType.romanized.value
                              ? '氏名（ローマ字）'
                              : currentForm.control('nameType').value ==
                                      NameType.chineseOrVietnamese.value
                                  ? '氏名（中国語漢字/ベトナム語表記）'
                                  : currentForm.control('nameType').value ==
                                          NameType.japaneseForChinese.value
                                      ? '氏名（日本語漢字）※中国人のみ'
                                      : currentForm.control('nameType').value ==
                                              NameType
                                                  .japaneseForNonChinese.value
                                          ? '氏名（日本語漢字）※中国人のみ'
                                          : '氏名（ローマ字）',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: context.appTheme.spacing.marginMedium,
                        ),
                        Row(
                          children: [
                            const Expanded(
                              child: ReactiveTextFormField(
                                formControlName: 'familyName',
                                decoration: InputDecoration(
                                  label: Text(
                                    'ファミリーネーム', // Todo: l10n 対応 (ファミリーネーム) (familyName)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: context.appTheme.spacing.marginMedium,
                            ),
                            const Expanded(
                              child: ReactiveTextFormField(
                                formControlName: 'middleName',
                                decoration: InputDecoration(
                                  label: Text(
                                    'ミドルネーム', // Todo: l10n 対応 (ミドルネーム) (middleName)
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: context.appTheme.spacing.marginMedium,
                            ),
                            const Expanded(
                              child: ReactiveTextFormField(
                                formControlName: 'firstName',
                                decoration: InputDecoration(
                                  label: Text(
                                    'ファーストネーム', // Todo: l10n 対応 (ファーストネーム) (firstName)
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );

            return ColumnSeparated(
              separatorBuilder: (BuildContext context, int index) => SizedBox(
                height: context.appTheme.spacing.marginMedium,
              ),
              children: rows.toList(),
            );
          },
        ),
      ),
    );
  }
}
