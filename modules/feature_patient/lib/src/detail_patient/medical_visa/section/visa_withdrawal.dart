import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/material.dart';
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
            child: Row(
              children: [
                Expanded(
                  child: ReactiveCheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    formControlName: 'subjectVisaWithdrawal',
                    title: const Text('ビザ取下対象とする'),
                  ),
                ),
                SizedBox(
                  width: context.appTheme.spacing.marginMedium,
                ),
                const Expanded(
                  child: ReactiveDatePickerField(
                    formControlName: 'deathOrOccurrenceEventDate',
                    label: '死亡日または事由発生日',
                  ),
                ),
                SizedBox(
                  width: context.appTheme.spacing.marginMedium,
                ),
                Expanded(
                  child: ReactiveTextField(
                    formControlName: 'remarks',
                    decoration: const InputDecoration(
                      label: Text('備考'),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}