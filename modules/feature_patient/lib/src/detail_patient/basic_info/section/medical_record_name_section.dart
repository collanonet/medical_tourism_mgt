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
    final formGroup = (ReactiveForm.of(context) as FormGroup)
        .control('PATIENT_NAMES') as FormGroup;

    return ValueListenableBuilder(
      valueListenable:
      context.read<BasicInformationModel>().patientNames,
      builder: (context, value, _) => Skeletonizer(
        enabled: value.loading,
        child: ReactiveForm(
          formGroup: formGroup,
          child: ColumnSeparated(
            crossAxisAlignment: CrossAxisAlignment.start,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: context.appTheme.spacing.marginMedium,
              );
            },
            children: [
              const Text(
                '氏名（ローマ字）',
                style: TextStyle(
                  fontFamily: 'NotoSansJP',
                  package: 'core_ui',
                  fontWeight: FontWeight.bold,
                ),
              ),
              RowSeparated(
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: context.appTheme.spacing.marginMedium,
                  );
                },
                children: [
                  Expanded(
                    child: ReactiveTextField(
                      formControlName: 'familyNameRomanized',
                      decoration: InputDecoration(
                        label: Text(
                          'ファミリーネーム', // Todo: l10n 対応 (ファミリーネーム) (familyName)
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReactiveTextField(
                      formControlName: 'middleNameRomanized',
                      decoration: InputDecoration(
                        label: Text(
                          'ミドルネーム', // Todo: l10n 対応 (ミドルネーム) (middleName)
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReactiveTextField(
                      formControlName: 'firstNameRomanized',
                      decoration: InputDecoration(
                        label: Text(
                          'ファーストネーム', // Todo: l10n 対応 (ファーストネーム) (firstName)
                        ),
                      ),
                    ),
                  ),
                  Expanded(flex: 3, child: SizedBox())
                ],
              ),
              const Text(
                '氏名（中国語漢字/ベトナム語表記）',
                style: TextStyle(
                  fontFamily: 'NotoSansJP',
                  package: 'core_ui',
                  fontWeight: FontWeight.bold,
                ),
              ),
              RowSeparated(
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: context.appTheme.spacing.marginMedium,
                  );
                },
                children: [
                  Expanded(
                    child: ReactiveTextField(
                      formControlName: 'familyNameChineseOrVietnamese',
                      decoration: InputDecoration(
                        label: Text(
                          'ファミリーネーム', // Todo: l10n 対応 (ファミリーネーム) (familyName)
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReactiveTextField(
                      formControlName: 'middleNameChineseOrVietnamese',
                      decoration: InputDecoration(
                        label: Text(
                          'ミドルネーム', // Todo: l10n 対応 (ミドルネーム) (middleName)
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReactiveTextField(
                      formControlName: 'firstNameChineseOrVietnamese',
                      decoration: InputDecoration(
                        label: Text(
                          'ファーストネーム', // Todo: l10n 対応 (ファーストネーム) (firstName)
                        ),
                      ),
                    ),
                  ),
                  Expanded(flex: 3, child: SizedBox())
                ],
              ),
              const Text(
                '氏名（日本語漢字）※中国人のみ',
                style: TextStyle(
                  fontFamily: 'NotoSansJP',
                  package: 'core_ui',
                  fontWeight: FontWeight.bold,
                ),
              ),
              RowSeparated(
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: context.appTheme.spacing.marginMedium,
                  );
                },
                children: [
                  Expanded(
                    child: ReactiveTextField(
                      formControlName: 'familyNameJapaneseForChinese',
                      decoration: InputDecoration(
                        label: Text(
                          'ファミリーネーム', // Todo: l10n 対応 (ファミリーネーム) (familyName)
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReactiveTextField(
                      formControlName: 'middleNameJapaneseForChinese',
                      decoration: InputDecoration(
                        label: Text(
                          'ミドルネーム', // Todo: l10n 対応 (ミドルネーム) (middleName)
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReactiveTextField(
                      formControlName: 'firstNameJapaneseForChinese',
                      decoration: InputDecoration(
                        label: Text(
                          'ファーストネーム', // Todo: l10n 対応 (ファーストネーム) (firstName)
                        ),
                      ),
                    ),
                  ),
                  Expanded(flex: 3, child: SizedBox())
                ],
              ),
              const Text(
                '氏名（カナ）',
                style: TextStyle(
                  fontFamily: 'NotoSansJP',
                  package: 'core_ui',
                  fontWeight: FontWeight.bold,
                ),
              ),
              RowSeparated(
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: context.appTheme.spacing.marginMedium,
                  );
                },
                children: [
                  Expanded(
                    child: ReactiveTextField(
                      formControlName: 'familyNameJapaneseForNonChinese',
                      decoration: InputDecoration(
                        label: Text(
                          'ファミリーネーム', // Todo: l10n 対応 (ファミリーネーム) (familyName)
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReactiveTextField(
                      formControlName: 'middleNameJapaneseForNonChinese',
                      decoration: InputDecoration(
                        label: Text(
                          'ミドルネーム', // Todo: l10n 対応 (ミドルネーム) (middleName)
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReactiveTextField(
                      formControlName: 'firstNameJapaneseForNonChinese',
                      decoration: InputDecoration(
                        label: Text(
                          'ファーストネーム', // Todo: l10n 対応 (ファーストネーム) (firstName)
                        ),
                      ),
                    ),
                  ),
                  Expanded(flex: 3, child: SizedBox())
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
