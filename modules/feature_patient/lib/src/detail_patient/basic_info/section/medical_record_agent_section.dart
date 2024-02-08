import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../basic_info_model.dart';

class MedicalRecordAgentSection extends StatelessWidget {
  const MedicalRecordAgentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final formGroup = (ReactiveForm.of(context) as FormGroup)
        .control('MEDICAL_RECORD_AGENTS') as FormGroup;
    return ValueListenableBuilder(
        valueListenable:
            context.read<BasicInformationModel>().medicalRecordAgents,
        builder: (context, value, _) => Skeletonizer(
              enabled: value.loading,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'エージェント/紹介者',
                        style: context.textTheme.titleLarge,
                      ),
                      SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                      Text(
                        '病院へは共有されません/紹介者',
                        style: context.textTheme.bodySmall,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.appTheme.spacing.marginMedium,
                  ),
                  const Text(
                    'エージェント',
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
                            decoration: InputDecoration(
                              label: Text(
                                '企業', // Todo: l10n (国籍)
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ReactiveTextField(
                            formControlName: 'nameInKanji',
                            decoration: InputDecoration(
                              label: Text(
                                '氏名（漢字）', //   TODO: l10n 対応 (診察券番号) (medicalCardNumber)
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ReactiveTextField(
                            formControlName: 'nameInKana',
                            decoration: InputDecoration(
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
