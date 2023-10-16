import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class MedicalRecordReferrerSection extends StatelessWidget {
  const MedicalRecordReferrerSection({super.key});

  @override
  Widget build(BuildContext context) {
    final formGroup = (ReactiveForm.of(context) as FormGroup)
        .control('MEDICAL_RECORD_Referrers') as FormGroup;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '紹介者',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: context.appTheme.spacing.marginMedium,
        ),
        ReactiveForm(
          formGroup: formGroup,
          child: RowSeparated(
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: context.appTheme.spacing.marginMedium,
              );
            },
            children: [
              const Expanded(
                child: ReactiveTextFormField(
                  formControlName: 'company',
                  decoration: InputDecoration(
                    label: Text(
                      '企業', // Todo: l10n (国籍)
                    ),
                  ),
                ),
              ),
              const Expanded(
                child: ReactiveTextFormField(
                  formControlName: 'nameInKanji',
                  decoration: InputDecoration(
                    label: Text(
                      '氏名（漢字）', //   TODO: l10n 対応 (診察券番号) (medicalCardNumber)
                    ),
                  ),
                ),
              ),
              const Expanded(
                child: ReactiveTextFormField(
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
    );
  }
}
