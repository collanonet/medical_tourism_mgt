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
    return SingleChildScrollView(
      child: Column(
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
                          formControlName:
                              'visa_issuing_overseas_establishments',
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
          Text('日本で必要な書類'),
          ReactiveForm(
            formGroup: formGroup.control('required_in_japan') as FormGroup,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child: Text('パスポート')),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    Expanded(
                      child: ReactiveDatePicker<DateTime>(
                        formControlName: 'passport_file_upload_date',
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                        builder: (BuildContext context,
                            ReactiveDatePickerDelegate<dynamic> picker,
                            Widget? child) {
                          return ReactiveTextField<DateTime>(
                            formControlName: 'passport_file_upload_date',
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
                      flex: 3,
                      child: SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    ElevatedButton(onPressed: () {}, child: Text('ファイル選択'))
                  ],
                ),
                SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                ),
                Row(
                  children: [
                    Expanded(child: Text('身元保証書')),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    Expanded(
                      child: ReactiveDatePicker<DateTime>(
                        formControlName: 'personal_reference_file_upload_date',
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                        builder: (BuildContext context,
                            ReactiveDatePickerDelegate<dynamic> picker,
                            Widget? child) {
                          return ReactiveTextField<DateTime>(
                            formControlName:
                                'personal_reference_file_upload_date',
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
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(value: true, onChanged: (value) {}),
                          Text('原本送付'),
                          Text('（'),
                          Checkbox(value: false, onChanged: (value) {}),
                          Text('EMS'),
                          Checkbox(value: true, onChanged: (value) {}),
                          Text('Fedex'),
                          Checkbox(value: false, onChanged: (value) {}),
                          Text('その他'),
                          Text('）'),
                          SizedBox(
                            width: context.appTheme.spacing.marginMedium,
                          ),
                          Checkbox(value: true, onChanged: (value) {}),
                          Text('PDF送付'),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    ElevatedButton(onPressed: () {}, child: Text('ファイル選択'))
                  ],
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
                      '身元保証書を追加',
                      style: TextStyle(color: context.appTheme.primaryColor),
                    )
                  ],
                ),
                SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                ),
                Row(
                  children: [
                    Expanded(child: Text('治療予定表')),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    Expanded(
                      child: ReactiveDatePicker<DateTime>(
                        formControlName: 'treatment_schedule_file_upload_date',
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                        builder: (BuildContext context,
                            ReactiveDatePickerDelegate<dynamic> picker,
                            Widget? child) {
                          return ReactiveTextField<DateTime>(
                            formControlName:
                                'treatment_schedule_file_upload_date',
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
                      flex: 3,
                      child: SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    ElevatedButton(onPressed: () {}, child: Text('ファイル選択'))
                  ],
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
                      '治療予定表を追加',
                      style: TextStyle(color: context.appTheme.primaryColor),
                    )
                  ],
                ),
                SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                ),
                Row(
                  children: [
                    Expanded(child: Text('理由書')),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    Expanded(
                      child: ReactiveDatePicker<DateTime>(
                        formControlName: 'statement_reasons_file_upload_date',
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                        builder: (BuildContext context,
                            ReactiveDatePickerDelegate<dynamic> picker,
                            Widget? child) {
                          return ReactiveTextField<DateTime>(
                            formControlName:
                                'statement_reasons_file_upload_date',
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
                      flex: 3,
                      child: SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    ElevatedButton(onPressed: () {}, child: Text('ファイル選択'))
                  ],
                ),
                SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                ),
                Row(
                  children: [
                    Expanded(child: Text('同行者リスト')),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    Expanded(
                      child: ReactiveDatePicker<DateTime>(
                        formControlName:
                            'accompanying_persons_list_file_upload_date',
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                        builder: (BuildContext context,
                            ReactiveDatePickerDelegate<dynamic> picker,
                            Widget? child) {
                          return ReactiveTextField<DateTime>(
                            formControlName:
                                'accompanying_persons_list_file_upload_date',
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
                      flex: 3,
                      child: SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    ElevatedButton(onPressed: () {}, child: Text('ファイル選択'))
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          ReactiveForm(
            formGroup: formGroup.control('addition') as FormGroup,
            child: Column(
              children: [
                Container(
                  padding:
                      EdgeInsets.all(context.appTheme.spacing.marginMedium),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: context.appTheme.primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(
                        context.appTheme.spacing.borderRadiusMedium),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: ReactiveDatePicker<DateTime>(
                              formControlName: 'date_landing_permit',
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                              builder: (BuildContext context,
                                  ReactiveDatePickerDelegate<dynamic> picker,
                                  Widget? child) {
                                return ReactiveTextField<DateTime>(
                                  formControlName: 'date_landing_permit',
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
                                      '上陸許可日',
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
                              formControlName: 'date_visa_expiration',
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                              builder: (BuildContext context,
                                  ReactiveDatePickerDelegate<dynamic> picker,
                                  Widget? child) {
                                return ReactiveTextField<DateTime>(
                                  formControlName: 'date_visa_expiration',
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
                                      'ビザの有効期限　満了日',
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
                          )
                        ],
                      ),
                      SizedBox(
                        height: context.appTheme.spacing.marginMedium,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ReactiveDatePicker<DateTime>(
                              formControlName: 'date_entry_into_japan',
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                              builder: (BuildContext context,
                                  ReactiveDatePickerDelegate<dynamic> picker,
                                  Widget? child) {
                                return ReactiveTextField<DateTime>(
                                  formControlName: 'date_entry_into_japan',
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
                                      '日本への入国日',
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
                              formControlName: 'date_entry_from_japan',
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                              builder: (BuildContext context,
                                  ReactiveDatePickerDelegate<dynamic> picker,
                                  Widget? child) {
                                return ReactiveTextField<DateTime>(
                                  formControlName: 'date_entry_from_japan',
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
                                      '日本からの出国日',
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
                          )
                        ],
                      ),
                      SizedBox(
                        height: context.appTheme.spacing.marginMedium,
                      ),
                      Text('入国'),
                      SizedBox(
                        height: context.appTheme.spacing.marginMedium,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: ReactiveTextField(
                              formControlName: 'departure_entry',
                              decoration: InputDecoration(
                                label: Text(
                                  '出発地',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.appTheme.spacing.marginMedium,
                          ),
                          Expanded(
                            flex: 2,
                            child: ReactiveTextField(
                              formControlName: 'arrival_entry',
                              decoration: InputDecoration(
                                label: Text(
                                  '到着地',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.appTheme.spacing.marginMedium,
                          ),
                          Expanded(
                            child: ReactiveTextField(
                              formControlName: 'flight_number_entry',
                              decoration: InputDecoration(
                                label: Text(
                                  '便名',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.appTheme.spacing.marginMedium,
                          ),
                          Expanded(
                            child: ReactiveTextField(
                              formControlName: 'departure_time_entry',
                              decoration: InputDecoration(
                                label: Text(
                                  '発時刻',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.appTheme.spacing.marginMedium,
                          ),
                          Expanded(
                            child: ReactiveTextField(
                              formControlName: 'arrival_time_entry',
                              decoration: InputDecoration(
                                label: Text(
                                  '着時刻',
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
                      SizedBox(
                        height: context.appTheme.spacing.marginMedium,
                      ),
                      Text('出国'),
                      SizedBox(
                        height: context.appTheme.spacing.marginMedium,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: ReactiveTextField(
                              formControlName: 'departure_departure',
                              decoration: InputDecoration(
                                label: Text(
                                  '出発地',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.appTheme.spacing.marginMedium,
                          ),
                          Expanded(
                            flex: 2,
                            child: ReactiveTextField(
                              formControlName: 'arrival_departure',
                              decoration: InputDecoration(
                                label: Text(
                                  '到着地',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.appTheme.spacing.marginMedium,
                          ),
                          Expanded(
                            child: ReactiveTextField(
                              formControlName: 'flight_number_departure',
                              decoration: InputDecoration(
                                label: Text(
                                  '便名',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.appTheme.spacing.marginMedium,
                          ),
                          Expanded(
                            child: ReactiveTextField(
                              formControlName: 'departure_time_departure',
                              decoration: InputDecoration(
                                label: Text(
                                  '発時刻',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.appTheme.spacing.marginMedium,
                          ),
                          Expanded(
                            child: ReactiveTextField(
                              formControlName: 'arrival_time_departure',
                              decoration: InputDecoration(
                                label: Text(
                                  '着時刻',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.appTheme.spacing.marginMedium,
                          ),
                          Expanded(
                            child: ReactiveTextField(
                              formControlName: 'flight_seat_numbe_departurer',
                              decoration: InputDecoration(
                                label: Text(
                                  '座席番号',
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
                                  '出発地',
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
                      '追加',
                      style: TextStyle(color: context.appTheme.primaryColor),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Text('ビザの取り下げ'),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          ReactiveForm(
            formGroup: formGroup.control('withdrawal_of_visa') as FormGroup,
            child: Row(
              children: [
                Checkbox(value: true, onChanged: (value) {}),
                Text('ビザ取下対象とする'),
                SizedBox(
                  width: context.appTheme.spacing.marginMedium,
                ),
                Expanded(
                  child: ReactiveDatePicker<DateTime>(
                    formControlName: 'death_or_occurrence_event_date',
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                    builder: (BuildContext context,
                        ReactiveDatePickerDelegate<dynamic> picker,
                        Widget? child) {
                      return ReactiveTextField<DateTime>(
                        formControlName: 'death_or_occurrence_event_date',
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
                            '死亡日または事由発生日',
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
                    formControlName: 'remarks',
                    decoration: InputDecoration(
                      label: Text('備考'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Text('ビザ取得後に必要なもの'),
          ReactiveForm(
            formGroup: formGroup.control('required_in_japan') as FormGroup,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child: Text('ビザのページ')),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    Expanded(
                      child: ReactiveDatePicker<DateTime>(
                        formControlName: 'visa_page_file_upload_date',
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                        builder: (BuildContext context,
                            ReactiveDatePickerDelegate<dynamic> picker,
                            Widget? child) {
                          return ReactiveTextField<DateTime>(
                            formControlName: 'visa_page_file_upload_date',
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
                      flex: 3,
                      child: SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    ElevatedButton(onPressed: () {}, child: Text('ファイル選択'))
                  ],
                ),
                SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                ),
                Row(
                  children: [
                    Expanded(child: Text('上陸許可証')),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    Expanded(
                      child: ReactiveDatePicker<DateTime>(
                        formControlName: 'landing_permit_file_upload_date',
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                        builder: (BuildContext context,
                            ReactiveDatePickerDelegate<dynamic> picker,
                            Widget? child) {
                          return ReactiveTextField<DateTime>(
                            formControlName: 'landing_permit_file_upload_date',
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
                      flex: 3,
                      child: SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    ElevatedButton(onPressed: () {}, child: Text('ファイル選択'))
                  ],
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
                      '追加',
                      style: TextStyle(color: context.appTheme.primaryColor),
                    )
                  ],
                ),
                SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                ),
                Row(
                  children: [
                    Expanded(child: Text('来日時の飛行機チケット')),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    Expanded(
                      child: ReactiveDatePicker<DateTime>(
                        formControlName:
                            'airline_ticke_arrival_japan_file_upload_date',
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                        builder: (BuildContext context,
                            ReactiveDatePickerDelegate<dynamic> picker,
                            Widget? child) {
                          return ReactiveTextField<DateTime>(
                            formControlName:
                                'airline_ticke_arrival_japan_file_upload_date',
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
                      flex: 3,
                      child: SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    ElevatedButton(onPressed: () {}, child: Text('ファイル選択'))
                  ],
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
                      '追加',
                      style: TextStyle(color: context.appTheme.primaryColor),
                    )
                  ],
                ),
                SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                ),
                Row(
                  children: [
                    Expanded(child: Text('帰国時の飛行機チケット')),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    Expanded(
                      child: ReactiveDatePicker<DateTime>(
                        formControlName:
                            'airline_ticket_return_japan_file_upload_date',
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                        builder: (BuildContext context,
                            ReactiveDatePickerDelegate<dynamic> picker,
                            Widget? child) {
                          return ReactiveTextField<DateTime>(
                            formControlName:
                                'airline_ticket_return_japan_file_upload_date',
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
                      flex: 3,
                      child: SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    ElevatedButton(onPressed: () {}, child: Text('ファイル選択'))
                  ],
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
                      '追加',
                      style: TextStyle(color: context.appTheme.primaryColor),
                    )
                  ],
                ),
                SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                ),
                Row(
                  children: [
                    Expanded(child: Text('帰国時のボーディングパス')),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    Expanded(
                      child: ReactiveDatePicker<DateTime>(
                        formControlName:
                            'boarding_pass_returning_file_upload_date',
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                        builder: (BuildContext context,
                            ReactiveDatePickerDelegate<dynamic> picker,
                            Widget? child) {
                          return ReactiveTextField<DateTime>(
                            formControlName:
                                'boarding_pass_returning_file_upload_date',
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
                      flex: 3,
                      child: SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    ElevatedButton(onPressed: () {}, child: Text('ファイル選択'))
                  ],
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
                      '追加',
                      style: TextStyle(color: context.appTheme.primaryColor),
                    )
                  ],
                ),
                SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                ),
                Row(
                  children: [
                    Expanded(child: Text('在留資格認定証明書')),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    Expanded(
                      child: ReactiveDatePicker<DateTime>(
                        formControlName:
                            'certificate_eligibility_file_upload_date',
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                        builder: (BuildContext context,
                            ReactiveDatePickerDelegate<dynamic> picker,
                            Widget? child) {
                          return ReactiveTextField<DateTime>(
                            formControlName:
                                'certificate_eligibility_file_upload_date',
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
                      flex: 3,
                      child: SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    ElevatedButton(onPressed: () {}, child: Text('ファイル選択'))
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Container(
            padding: EdgeInsets.all(context.appTheme.spacing.marginMedium),
            decoration: BoxDecoration(
              color: const Color(0xffF0F3F5),
              borderRadius: BorderRadius.circular(
                  context.appTheme.spacing.borderRadiusMedium),
            ),
            child: Column(
              children: [
                ReactiveForm(
                  formGroup: formGroup.control('companion_other') as FormGroup,
                  child: Column(
                    children: [
                      Text('同行者'),
                      SizedBox(
                        height: context.appTheme.spacing.marginMedium,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ReactiveTextField(
                              formControlName: 'name_romaji',
                              decoration: InputDecoration(
                                label: Text(
                                  '氏名（ローマ字）',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.appTheme.spacing.marginMedium,
                          ),
                          Expanded(
                            child: ReactiveDatePicker<DateTime>(
                              formControlName: 'date_birth',
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                              builder: (BuildContext context,
                                  ReactiveDatePickerDelegate<dynamic> picker,
                                  Widget? child) {
                                return ReactiveTextField<DateTime>(
                                  formControlName: 'date_birth',
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
                                      '生年月日',
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
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('性別'),
                                    ReactiveValueListenableBuilder<DateTime>(
                                      formControlName: 'date_birth',
                                      builder: (context, value, _) {
                                        return Text(value.value == null
                                            ? '0歳'
                                            : '${DateTime.now().year - value.value!.year}歳');
                                      },
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('性別'),
                                    Row(
                                      children: [
                                        Checkbox(
                                            value: false,
                                            onChanged: (value) {}),
                                        SizedBox(
                                          width: context
                                              .appTheme.spacing.marginMedium,
                                        ),
                                        Text('男性'),
                                        Checkbox(
                                            value: false,
                                            onChanged: (value) {}),
                                        Text('女性'),
                                      ],
                                    )
                                  ],
                                ),
                              ],
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
                              formControlName: 'address_area',
                              decoration: InputDecoration(
                                label: Text(
                                  '居住地域',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.appTheme.spacing.marginMedium,
                          ),
                          Expanded(
                            child: ReactiveTextField(
                              formControlName: 'number_passport',
                              decoration: InputDecoration(
                                label: Text(
                                  '旅券番号',
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
                      SizedBox(
                        height: context.appTheme.spacing.marginMedium,
                      ),
                      Container(
                        padding: EdgeInsets.all(
                            context.appTheme.spacing.marginMedium),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: context.appTheme.primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(
                              context.appTheme.spacing.borderRadiusMedium),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: ReactiveDatePicker<DateTime>(
                                    formControlName: 'date_landing_permit',
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime.now(),
                                    builder: (BuildContext context,
                                        ReactiveDatePickerDelegate<dynamic>
                                            picker,
                                        Widget? child) {
                                      return ReactiveTextField<DateTime>(
                                        formControlName: 'date_landing_permit',
                                        readOnly: true,
                                        onTap: (value) => picker.showPicker(),
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
                                        decoration: const InputDecoration(
                                          label: Text(
                                            '上陸許可日',
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
                                    formControlName: 'date_visa_expiration',
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime.now(),
                                    builder: (BuildContext context,
                                        ReactiveDatePickerDelegate<dynamic>
                                            picker,
                                        Widget? child) {
                                      return ReactiveTextField<DateTime>(
                                        formControlName: 'date_visa_expiration',
                                        readOnly: true,
                                        onTap: (value) => picker.showPicker(),
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
                                        decoration: const InputDecoration(
                                          label: Text(
                                            'ビザの有効期限　満了日',
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
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: ReactiveDatePicker<DateTime>(
                                    formControlName: 'date_entry_into_japan',
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime.now(),
                                    builder: (BuildContext context,
                                        ReactiveDatePickerDelegate<dynamic>
                                            picker,
                                        Widget? child) {
                                      return ReactiveTextField<DateTime>(
                                        formControlName:
                                            'date_entry_into_japan',
                                        readOnly: true,
                                        onTap: (value) => picker.showPicker(),
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
                                        decoration: const InputDecoration(
                                          label: Text(
                                            '日本への入国日',
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
                                    formControlName: 'date_entry_from_japan',
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime.now(),
                                    builder: (BuildContext context,
                                        ReactiveDatePickerDelegate<dynamic>
                                            picker,
                                        Widget? child) {
                                      return ReactiveTextField<DateTime>(
                                        formControlName:
                                            'date_entry_from_japan',
                                        readOnly: true,
                                        onTap: (value) => picker.showPicker(),
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
                                        decoration: const InputDecoration(
                                          label: Text(
                                            '日本からの出国日',
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
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Text('入国'),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: ReactiveTextField(
                                    formControlName: 'departure_entry',
                                    decoration: InputDecoration(
                                      label: Text(
                                        '出発地',
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: ReactiveTextField(
                                    formControlName: 'arrival_entry',
                                    decoration: InputDecoration(
                                      label: Text(
                                        '到着地',
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                Expanded(
                                  child: ReactiveTextField(
                                    formControlName: 'flight_number_entry',
                                    decoration: InputDecoration(
                                      label: Text(
                                        '便名',
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                Expanded(
                                  child: ReactiveTextField(
                                    formControlName: 'departure_time_entry',
                                    decoration: InputDecoration(
                                      label: Text(
                                        '発時刻',
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                Expanded(
                                  child: ReactiveTextField(
                                    formControlName: 'arrival_time_entry',
                                    decoration: InputDecoration(
                                      label: Text(
                                        '着時刻',
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                Expanded(
                                  child: SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Text('出国'),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: ReactiveTextField(
                                    formControlName: 'departure_departure',
                                    decoration: InputDecoration(
                                      label: Text(
                                        '出発地',
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: ReactiveTextField(
                                    formControlName: 'arrival_departure',
                                    decoration: InputDecoration(
                                      label: Text(
                                        '到着地',
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                Expanded(
                                  child: ReactiveTextField(
                                    formControlName: 'flight_number_departure',
                                    decoration: InputDecoration(
                                      label: Text(
                                        '便名',
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                Expanded(
                                  child: ReactiveTextField(
                                    formControlName: 'departure_time_departure',
                                    decoration: InputDecoration(
                                      label: Text(
                                        '発時刻',
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                Expanded(
                                  child: ReactiveTextField(
                                    formControlName: 'arrival_time_departure',
                                    decoration: InputDecoration(
                                      label: Text(
                                        '着時刻',
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                Expanded(
                                  child: ReactiveTextField(
                                    formControlName:
                                        'flight_seat_numbe_departurer',
                                    decoration: InputDecoration(
                                      label: Text(
                                        '座席番号',
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
                                        '出発地',
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
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
                            '追加',
                            style:
                                TextStyle(color: context.appTheme.primaryColor),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
        ],
      ),
    );
  }
}
