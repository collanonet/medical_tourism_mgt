// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:reactive_forms/reactive_forms.dart';

class VisaWithdrawal extends StatelessWidget {
  const VisaWithdrawal({super.key});

  @override
  Widget build(BuildContext context) {
    final formGroup = ReactiveForm.of(context) as FormGroup;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('ビザの取り下げ', style: context.textTheme.titleMedium),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          ReactiveForm(
            formGroup: formGroup.control('visaWithdrawal') as FormGroup,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ReactiveCheckbox(
                      formControlName: 'subjectVisaWithdrawal',
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginSmall,
                    ),
                    const Text('ビザ取下対象とする'),
                  ],
                ),
                SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                ),
                Row(
                  children: [
                    const Text('理由'),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    ReactiveRadio(
                      value: 'PatientDeath',
                      formControlName: 'reason',
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginSmall,
                    ),
                    const Text('患者死亡'),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    ReactiveRadio(
                      value: 'others',
                      formControlName: 'reason',
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginSmall,
                    ),
                    const Text('その他'),
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }
}
