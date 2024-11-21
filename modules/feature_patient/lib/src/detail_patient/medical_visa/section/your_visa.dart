import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

class YourVisa extends StatelessWidget {
  const YourVisa({super.key});

  @override
  Widget build(BuildContext context) {
    final formatter = InputFormatter();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '本人のビザ',
          style: context.textTheme.titleMedium,
        ),
        SizedBox(
          height: context.appTheme.spacing.marginMedium,
        ),
        ReactiveFormArray(
          formArrayName: 'personal',
          builder: (context, formArray, _) {
            final rows = formArray.controls
                .map((control) => control as FormGroup)
                .map((currentForm) => ReactiveForm(
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
                                borderRadius: BorderRadius.circular(context
                                    .appTheme.spacing.borderRadiusMedium),
                              ),
                              padding: EdgeInsets.all(
                                  context.appTheme.spacing.marginMedium),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ReactiveTextField(
                                          formControlName: 'medicalVisa',
                                          decoration: const InputDecoration(
                                            label: Text(
                                              '医療ビザ',
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      ),
                                      Expanded(
                                        child: ReactiveDatePicker<DateTime>(
                                          formControlName: 'applicationDate',
                                          firstDate: DateTime(1900),
                                          lastDate: DateTime(2100),
                                          builder: (BuildContext context,
                                              ReactiveDatePickerDelegate<
                                                      dynamic>
                                                  picker,
                                              Widget? child) {
                                            return ReactiveTextField<DateTime>(
                                              formControlName:
                                                  'applicationDate',
                                              valueAccessor:
                                                  DateTimeValueAccessor(
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
                                                  '申請日',
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
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      ),
                                      Expanded(
                                        child: ReactiveDatePicker<DateTime>(
                                          formControlName: 'issueDate',
                                          firstDate: DateTime(1900),
                                          lastDate: DateTime(2100),
                                          builder: (BuildContext context,
                                              ReactiveDatePickerDelegate<
                                                      dynamic>
                                                  picker,
                                              Widget? child) {
                                            return ReactiveTextField<DateTime>(
                                              formControlName: 'issueDate',
                                              valueAccessor:
                                                  DateTimeValueAccessor(
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
                                                  '発行日',
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
                                    ],
                                  ),
                                  SizedBox(
                                    height:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ReactiveDatePicker<DateTime>(
                                          formControlName: 'expirationDate',
                                          firstDate: DateTime(1900),
                                          lastDate: DateTime(2100),
                                          builder: (BuildContext context,
                                              ReactiveDatePickerDelegate<
                                                      dynamic>
                                                  picker,
                                              Widget? child) {
                                            return ReactiveTextField<DateTime>(
                                              formControlName: 'expirationDate',
                                              valueAccessor:
                                                  DateTimeValueAccessor(
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
                                                  '有効期限',
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
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      ),
                                      Expanded(
                                        child: ReactiveTextField(
                                          formControlName:
                                              'accompanyingPersonsNumber',
                                          decoration: const InputDecoration(
                                            label: Text(
                                              '同伴者人数',
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      ),
                                      Expanded(
                                        child: ReactiveTextField(
                                          formControlName:
                                              'visaIssuingOverseasEstablishments',
                                          decoration: const InputDecoration(
                                            label: Text(
                                              'ビザ発行在外公館',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ReactiveTextField(
                                          formControlName: 'remarks',
                                          decoration: const InputDecoration(
                                            label: Text(
                                              '備考',
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      ),
                                      Expanded(
                                        child: ReactiveTextField(
                                          formControlName: 'paymentStatus',
                                          decoration: const InputDecoration(
                                            label: Text(
                                              '入金状況',
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                          width: context
                                              .appTheme.spacing.marginMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ]),
                    ))
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
                    FormGroup(
                      {
                        'medicalVisa': FormControl<String>(value: ''),
                        'applicationDate': FormControl<DateTime>(
                          validators: [
                            Validators.pattern(
                              ValidatorRegExp.date,
                            ),
                          ],
                        ),
                        'issueDate': FormControl<DateTime>(
                          validators: [
                            Validators.pattern(
                              ValidatorRegExp.date,
                            ),
                          ],
                        ),
                        'expirationDate': FormControl<DateTime>(
                          validators: [
                            Validators.pattern(
                              ValidatorRegExp.date,
                            ),
                          ],
                        ),
                        'accompanyingPersonsNumber':
                            FormControl<String>(value: ''),
                        'visaIssuingOverseasEstablishments':
                            FormControl<String>(value: ''),
                        'remarks': FormControl<String>(value: ''),
                        'paymentStatus': FormControl<String>(value: ''),
                      },
                    ),
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
