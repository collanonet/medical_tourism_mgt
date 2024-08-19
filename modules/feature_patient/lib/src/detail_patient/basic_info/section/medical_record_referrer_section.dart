import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../basic_info_model.dart';

class MedicalRecordReferrerSection extends StatelessWidget {
  const MedicalRecordReferrerSection({super.key});

  @override
  Widget build(BuildContext context) {
    final formGroup = (ReactiveForm.of(context) as FormGroup)
        .control('MEDICAL_RECORD_Referrers') as FormGroup;
    return ValueListenableBuilder(
        valueListenable:
            context.read<BasicInformationModel>().medicalRecordReferrers,
        builder: (context, value, _) => Skeletonizer(
              enabled: value.loading,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '紹介者',
                    style: TextStyle(
                      fontFamily: 'NotoSansJP',
                      package: 'core_ui',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: context.appTheme.spacing.marginMedium,
                  ),
                  ReactiveForm(
                    formGroup: formGroup,
                    child: RowSeparated(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: context.appTheme.spacing.marginMedium,
                        );
                      },
                      children: [
                        Expanded(
                          child: ReactiveTextField(
                            formControlName: 'company',
                            decoration: const InputDecoration(
                              label: Text(
                                '企業', // Todo: l10n (国籍)
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ReactiveTextField(
                            formControlName: 'nameInKanji',
                            decoration: const InputDecoration(
                              label: Text(
                                '氏名（漢字）', //   TODO: l10n 対応 (診察券番号) (medicalCardNumber)
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ReactiveTextField(
                            formControlName: 'nameInKana',
                            decoration: const InputDecoration(
                              label: Text(
                                '氏名（カナ）', //   TODO: l10n 対応 (診察券番号) (medicalCardNumber)
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ));
  }
}
