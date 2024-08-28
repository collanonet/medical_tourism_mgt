// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Project imports:
import '../../detail_patient_model.dart';
import '../basic_info_model.dart';

class MedicalRecordNameSection extends StatelessWidget {
  const MedicalRecordNameSection({super.key});

  @override
  Widget build(BuildContext context) {
    final formGroup = (ReactiveForm.of(context) as FormGroup)
        .control('PATIENT_NAMES') as FormGroup;

    return ValueListenableListener(
      valueListenable: context.read<BasicInformationModel>().patientNames,
      onListen: () {
        final value = context.read<BasicInformationModel>().patientNames.value;

        if (value.hasData) {
          context
              .read<DetailPatientModel>()
              .getPatientNames(patientName: value.data);
        }
      },
      child: ValueListenableBuilder(
        valueListenable: context.watch<BasicInformationModel>().patientNames,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    );
                  },
                  children: [
                    Expanded(
                      child: ReactiveTextField(
                        formControlName: 'familyNameRomanized',
                        decoration: const InputDecoration(
                          label: Text(
                            'ファミリーネーム', // Todo: l10n 対応 (ファミリーネーム) (familyName)
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReactiveTextField(
                        formControlName: 'middleNameRomanized',
                        decoration: const InputDecoration(
                          label: Text(
                            'ミドルネーム', // Todo: l10n 対応 (ミドルネーム) (middleName)
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReactiveTextField(
                        formControlName: 'firstNameRomanized',
                        decoration: const InputDecoration(
                          label: Text(
                            'ファーストネーム', // Todo: l10n 対応 (ファーストネーム) (firstName)
                          ),
                        ),
                      ),
                    ),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    );
                  },
                  children: [
                    Expanded(
                      child: ReactiveTextField(
                        formControlName: 'familyNameChineseOrVietnamese',
                        decoration: const InputDecoration(
                          label: Text(
                            'ファミリーネーム', // Todo: l10n 対応 (ファミリーネーム) (familyName)
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReactiveTextField(
                        formControlName: 'middleNameChineseOrVietnamese',
                        decoration: const InputDecoration(
                          label: Text(
                            'ミドルネーム', // Todo: l10n 対応 (ミドルネーム) (middleName)
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReactiveTextField(
                        formControlName: 'firstNameChineseOrVietnamese',
                        decoration: const InputDecoration(
                          label: Text(
                            'ファーストネーム', // Todo: l10n 対応 (ファーストネーム) (firstName)
                          ),
                        ),
                      ),
                    ),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    );
                  },
                  children: [
                    Expanded(
                      child: ReactiveTextField(
                        formControlName: 'familyNameJapaneseForChinese',
                        decoration: const InputDecoration(
                          label: Text(
                            'ファミリーネーム', // Todo: l10n 対応 (ファミリーネーム) (familyName)
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReactiveTextField(
                        formControlName: 'middleNameJapaneseForChinese',
                        decoration: const InputDecoration(
                          label: Text(
                            'ミドルネーム', // Todo: l10n 対応 (ミドルネーム) (middleName)
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReactiveTextField(
                        formControlName: 'firstNameJapaneseForChinese',
                        decoration: const InputDecoration(
                          label: Text(
                            'ファーストネーム', // Todo: l10n 対応 (ファーストネーム) (firstName)
                          ),
                        ),
                      ),
                    ),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    );
                  },
                  children: [
                    Expanded(
                      child: ReactiveTextField(
                        formControlName: 'familyNameJapaneseForNonChinese',
                        decoration: const InputDecoration(
                          label: Text(
                            'ファミリーネーム', // Todo: l10n 対応 (ファミリーネーム) (familyName)
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReactiveTextField(
                        formControlName: 'middleNameJapaneseForNonChinese',
                        decoration: const InputDecoration(
                          label: Text(
                            'ミドルネーム', // Todo: l10n 対応 (ミドルネーム) (middleName)
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReactiveTextField(
                        formControlName: 'firstNameJapaneseForNonChinese',
                        decoration: const InputDecoration(
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
        ),
      ),
    );
  }
}
