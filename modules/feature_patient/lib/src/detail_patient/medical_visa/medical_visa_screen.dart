import 'package:core_ui/core_ui.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

class MedicalVisaScreen extends StatefulWidget {
  const MedicalVisaScreen({super.key});

  @override
  State<MedicalVisaScreen> createState() => _MedicalVisaScreenState();
}

class _MedicalVisaScreenState extends State<MedicalVisaScreen> {
  @override
  Widget build(BuildContext context) {
    final formGroup = ReactiveForm.of(context) as FormGroup;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '本人のビザ',
          style: context.textTheme.titleLarge,
        ),
        SizedBox(
          height: context.appTheme.spacing.marginMedium,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: context.appTheme.primaryColor,
            ),
            borderRadius: BorderRadius.circular(
                context.appTheme.spacing.borderRadiusMedium),
          ),
          padding: EdgeInsets.all(context.appTheme.spacing.marginMedium),
          child: Row(
            children: [
              Text('医療ビザ：マルチビザ'),
              Text('申請日：2023/05/31'),
              Spacer(),
              Icon(
                Icons.keyboard_arrow_down_rounded,
                color: context.appTheme.primaryColor,
              )
            ],
          ),
        ),
        SizedBox(
          height: context.appTheme.spacing.marginMedium,
        ),
        ReactiveForm(
          formGroup: formGroup.control('personal') as FormGroup,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: context.appTheme.primaryColor,
              ),
              borderRadius: BorderRadius.circular(
                  context.appTheme.spacing.borderRadiusMedium),
            ),
            padding: EdgeInsets.all(context.appTheme.spacing.marginMedium),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ReactiveTextField(
                        formControlName: 'medical_visa',
                        decoration: InputDecoration(
                          label: Text(
                            '医療ビザ',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    Expanded(
                      child: ReactiveDatePicker<DateTime>(
                        formControlName: 'application_date',
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                        builder: (BuildContext context,
                            ReactiveDatePickerDelegate<dynamic> picker,
                            Widget? child) {
                          return ReactiveTextField<DateTime>(
                            formControlName: 'application_date',
                            readOnly: true,
                            onTap: (value) => picker.showPicker(),
                            valueAccessor: DateTimeValueAccessor(
                              dateTimeFormat: DateFormat('yyyy/MM/dd'),
                            ),
                            onChanged: (value) {
                              logger.d(value);
                            },
                            onSubmitted: (value) {
                              logger.d(value);
                            },
                            decoration: const InputDecoration(
                              label: Text(
                                '申請日',
                              ),
                              suffixIcon: Icon(
                                CupertinoIcons.calendar,
                                color: Colors.grey,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    Expanded(
                      child: ReactiveDatePicker<DateTime>(
                        formControlName: 'issue_date',
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                        builder: (BuildContext context,
                            ReactiveDatePickerDelegate<dynamic> picker,
                            Widget? child) {
                          return ReactiveTextField<DateTime>(
                            formControlName: 'issue_date',
                            readOnly: true,
                            onTap: (value) => picker.showPicker(),
                            valueAccessor: DateTimeValueAccessor(
                              dateTimeFormat: DateFormat('yyyy/MM/dd'),
                            ),
                            onChanged: (value) {
                              logger.d(value);
                            },
                            onSubmitted: (value) {
                              logger.d(value);
                            },
                            decoration: const InputDecoration(
                              label: Text(
                                '発行日',
                              ),
                              suffixIcon: Icon(
                                CupertinoIcons.calendar,
                                color: Colors.grey,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ReactiveDatePicker<DateTime>(
                        formControlName: 'expiration_date',
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                        builder: (BuildContext context,
                            ReactiveDatePickerDelegate<dynamic> picker,
                            Widget? child) {
                          return ReactiveTextField<DateTime>(
                            formControlName: 'expiration_date',
                            readOnly: true,
                            onTap: (value) => picker.showPicker(),
                            valueAccessor: DateTimeValueAccessor(
                              dateTimeFormat: DateFormat('yyyy/MM/dd'),
                            ),
                            onChanged: (value) {
                              logger.d(value);
                            },
                            onSubmitted: (value) {
                              logger.d(value);
                            },
                            decoration: const InputDecoration(
                              label: Text(
                                '有効期限',
                              ),
                              suffixIcon: Icon(
                                CupertinoIcons.calendar,
                                color: Colors.grey,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    Expanded(
                      child: ReactiveTextField(
                        formControlName: 'accompanying_persons_number',
                        decoration: InputDecoration(
                          label: Text(
                            '同伴者人数',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    Expanded(
                      child: ReactiveTextField(
                        formControlName: 'visa_issuing_overseas_establishments',
                        decoration: InputDecoration(
                          label: Text(
                            'ビザ発行在外公館',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ReactiveTextField(
                        formControlName: 'remarks',
                        decoration: InputDecoration(
                          label: Text(
                            '備考',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    Expanded(
                      child: ReactiveTextField(
                        formControlName: 'payment_status',
                        decoration: InputDecoration(
                          label: Text(
                            '入金状況',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    Expanded(
                      child: SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: context.appTheme.spacing.marginMedium,
        ),
        Row(
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
              style: TextStyle(color: context.appTheme.primaryColor),
            )
          ],
        ),
        SizedBox(
          height: context.appTheme.spacing.marginMedium,
        ),
        ReactiveForm(
          formGroup: formGroup.control('stay_period') as FormGroup,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: context.appTheme.primaryColor,
              ),
              borderRadius: BorderRadius.circular(
                  context.appTheme.spacing.borderRadiusMedium),
            ),
            padding: EdgeInsets.all(context.appTheme.spacing.marginMedium),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ReactiveDatePicker<DateTime>(
                        formControlName:
                            'stay_starting_date_personal_reference',
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                        builder: (BuildContext context,
                            ReactiveDatePickerDelegate<dynamic> picker,
                            Widget? child) {
                          return ReactiveTextField<DateTime>(
                            formControlName:
                                'stay_starting_date_personal_reference',
                            readOnly: true,
                            onTap: (value) => picker.showPicker(),
                            valueAccessor: DateTimeValueAccessor(
                              dateTimeFormat: DateFormat('yyyy/MM/dd'),
                            ),
                            onChanged: (value) {
                              logger.d(value);
                            },
                            onSubmitted: (value) {
                              logger.d(value);
                            },
                            decoration: const InputDecoration(
                              label: Text(
                                '滞在開始日（身元保証書）',
                              ),
                              suffixIcon: Icon(
                                CupertinoIcons.calendar,
                                color: Colors.grey,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    Expanded(
                      child: ReactiveDatePicker<DateTime>(
                        formControlName: 'stay_end_date',
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                        builder: (BuildContext context,
                            ReactiveDatePickerDelegate<dynamic> picker,
                            Widget? child) {
                          return ReactiveTextField<DateTime>(
                            formControlName: 'stay_end_date',
                            readOnly: true,
                            onTap: (value) => picker.showPicker(),
                            valueAccessor: DateTimeValueAccessor(
                              dateTimeFormat: DateFormat('yyyy/MM/dd'),
                            ),
                            onChanged: (value) {
                              logger.d(value);
                            },
                            onSubmitted: (value) {
                              logger.d(value);
                            },
                            decoration: const InputDecoration(
                              label: Text(
                                '滞在終了日（身元保証書）',
                              ),
                              suffixIcon: Icon(
                                CupertinoIcons.calendar,
                                color: Colors.grey,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    Expanded(
                      child: SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: context.appTheme.spacing.marginMedium,
        ),
        Row(
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
              style: TextStyle(color: context.appTheme.primaryColor),
            )
          ],
        ),
        SizedBox(
          height: context.appTheme.spacing.marginMedium,
        ),
      ],
    );
  }
}
