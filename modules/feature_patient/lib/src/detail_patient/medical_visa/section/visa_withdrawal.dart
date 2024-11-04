import 'package:core_ui/core_ui.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

class VisaWithdrawal extends StatelessWidget {
  const VisaWithdrawal({super.key});

  @override
  Widget build(BuildContext context) {
    final formatter = InputFormatter();
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
                Expanded(
                  child: ReactiveDatePicker<DateTime>(
                    formControlName: 'deathOrOccurrenceEventDate',
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                    builder: (BuildContext context,
                        ReactiveDatePickerDelegate<dynamic> picker,
                        Widget? child) {
                      return ReactiveTextField<DateTime>(
                        formControlName: 'deathOrOccurrenceEventDate',
                        valueAccessor: DateTimeValueAccessor(
                          dateTimeFormat: DateFormat('yyyy/MM/dd'),
                        ),
                        onChanged: (value) {
                          logger.d(value);
                        },
                        onSubmitted: (value) {
                          logger.d(value);
                        },
                        decoration: InputDecoration(
                          label: const Text(
                            '死亡日または事由発生日',
                          ),
                          suffixIcon: IconButton(
                            icon: const Icon(
                              CupertinoIcons.calendar,
                              color: Colors.grey,
                            ),
                            onPressed: picker.showPicker,
                          ),
                        ),
                        inputFormatters: [
                          formatter.dateFormatter,
                        ],
                      );
                    },
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