import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LengthOfStay extends StatelessWidget {
  const LengthOfStay({super.key});

  @override
  Widget build(BuildContext context) {
    final formatter = InputFormatter();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '滞在期間',
          style: context.textTheme.titleMedium,
        ),
        SizedBox(
          height: context.appTheme.spacing.marginMedium,
        ),
        ReactiveFormArray(
          formArrayName: 'stayPeriod',
          builder: (context, formArray, _) {
            final rows = formArray.controls
                .map((control) => control as FormGroup)
                .map(
                  (currentForm) => ReactiveForm(
                    formGroup: currentForm,
                    child: ColumnSeparated(
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: context.appTheme.spacing.marginMedium,
                        );
                      },
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: context.appTheme.primaryColor,
                            ),
                            borderRadius: BorderRadius.circular(
                                context.appTheme.spacing.borderRadiusMedium),
                          ),
                          padding: EdgeInsets.all(
                              context.appTheme.spacing.marginMedium),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: ReactiveDatePicker<DateTime>(
                                      formControlName:
                                          'stayStartingDatePersonalReference',
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2050),
                                      builder: (BuildContext context,
                                          ReactiveDatePickerDelegate<dynamic>
                                              picker,
                                          Widget? child) {
                                        return ReactiveTextField<DateTime>(
                                          formControlName:
                                              'stayStartingDatePersonalReference',
                                          valueAccessor: DateTimeValueAccessor(
                                            dateTimeFormat:
                                                DateFormat('yyyy/MM/dd'),
                                          ),
                                          onChanged: (value) {
                                            logger.d(value);
                                          },
                                          onSubmitted: (value) {
                                            logger.d(value);
                                          },
                                          decoration: InputDecoration(
                                            label: const Text(
                                              '滞在開始日（身元保証書）',
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
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                  Expanded(
                                    child: ReactiveDatePicker<DateTime>(
                                      formControlName: 'stayEndDate',
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2050),
                                      builder: (BuildContext context,
                                          ReactiveDatePickerDelegate<dynamic>
                                              picker,
                                          Widget? child) {
                                        return ReactiveTextField<DateTime>(
                                          formControlName: 'stayEndDate',
                                          valueAccessor: DateTimeValueAccessor(
                                            dateTimeFormat:
                                                DateFormat('yyyy/MM/dd'),
                                          ),
                                          onChanged: (value) {
                                            logger.d(value);
                                          },
                                          onSubmitted: (value) {
                                            logger.d(value);
                                          },
                                          decoration: InputDecoration(
                                            label: const Text(
                                              '滞在終了日（身元保証書）',
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
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ColumnSeparated(
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: context.appTheme.spacing.marginMedium,
                    );
                  },
                  children: rows.toList(),
                ),
                SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                ),
                InkWell(
                  onTap: () => formArray.add(
                    FormGroup({
                      'stayStartingDatePersonalReference':
                          FormControl<DateTime>(
                        validators: [
                          Validators.pattern(
                            ValidatorRegExp.date,
                          ),
                        ],
                      ),
                      'stayEndDate': FormControl<DateTime>(
                        validators: [
                          Validators.pattern(
                            ValidatorRegExp.date,
                          ),
                        ],
                      ),
                    }),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_circle,
                        color: context.appTheme.primaryColor,
                      ),
                      SizedBox(
                        width: context.appTheme.spacing.marginSmall,
                      ),
                      Text(
                        '本人のビザを追加',
                        style: TextStyle(
                            fontFamily: 'NotoSansJP',
                            package: 'core_ui',
                            color: context.appTheme.primaryColor),
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
