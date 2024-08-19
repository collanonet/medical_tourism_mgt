import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
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
  List<String> menu = const [
    '短期滞在の期間の延長', // Extension of short-term stay period
    '特定活動の期間の延長', // Extension of period of specific activities
    '短期滞在　医療ビザ→特定活動', // Short-term stay medical visa → Specific activities
    '海外での特定活動ビザ変更', // Change of specific activity visa overseas
  ];
  final formatter = InputFormatter();
  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);

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
                const Text('医療ビザ：マルチビザ'),
                const Text('申請日：2023/05/31'),
                const Spacer(),
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
                          formControlName: 'medicalVisa',
                          decoration: const InputDecoration(
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
                          formControlName: 'applicationDate',
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                          builder: (BuildContext context,
                              ReactiveDatePickerDelegate<dynamic> picker,
                              Widget? child) {
                            return ReactiveTextField<DateTime>(
                              formControlName: 'applicationDate',
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
                        width: context.appTheme.spacing.marginMedium,
                      ),
                      Expanded(
                        child: ReactiveDatePicker<DateTime>(
                          formControlName: 'issueDate',
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                          builder: (BuildContext context,
                              ReactiveDatePickerDelegate<dynamic> picker,
                              Widget? child) {
                            return ReactiveTextField<DateTime>(
                              formControlName: 'issueDate',
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
                    height: context.appTheme.spacing.marginMedium,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ReactiveDatePicker<DateTime>(
                          formControlName: 'expirationDate',
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                          builder: (BuildContext context,
                              ReactiveDatePickerDelegate<dynamic> picker,
                              Widget? child) {
                            return ReactiveTextField<DateTime>(
                              formControlName: 'expirationDate',
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
                        width: context.appTheme.spacing.marginMedium,
                      ),
                      Expanded(
                        child: ReactiveTextField(
                          formControlName: 'accompanyingPersonsNumber',
                          decoration: const InputDecoration(
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
                    height: context.appTheme.spacing.marginMedium,
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
                        width: context.appTheme.spacing.marginMedium,
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
                style: TextStyle(
                    fontFamily: 'NotoSansJP',
                    package: 'core_ui',
                    color: context.appTheme.primaryColor),
              )
            ],
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          ReactiveForm(
            formGroup: formGroup.control('stayPeriod') as FormGroup,
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
                              'stayStartingDatePersonalReference',
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                          builder: (BuildContext context,
                              ReactiveDatePickerDelegate<dynamic> picker,
                              Widget? child) {
                            return ReactiveTextField<DateTime>(
                              formControlName:
                                  'stayStartingDatePersonalReference',
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
                        width: context.appTheme.spacing.marginMedium,
                      ),
                      Expanded(
                        child: ReactiveDatePicker<DateTime>(
                          formControlName: 'stayEndDate',
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                          builder: (BuildContext context,
                              ReactiveDatePickerDelegate<dynamic> picker,
                              Widget? child) {
                            return ReactiveTextField<DateTime>(
                              formControlName: 'stayEndDate',
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
                style: TextStyle(
                    fontFamily: 'NotoSansJP',
                    package: 'core_ui',
                    color: context.appTheme.primaryColor),
              )
            ],
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          const Text('日本で必要な書類'),
          ReactiveForm(
            formGroup: formGroup.control('requiredInJapan') as FormGroup,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(child: Text('パスポート')),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    Expanded(
                      child: ReactiveDatePicker<DateTime>(
                        formControlName: 'passportFileUploadDate',
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                        builder: (BuildContext context,
                            ReactiveDatePickerDelegate<dynamic> picker,
                            Widget? child) {
                          return ReactiveTextField<DateTime>(
                            formControlName: 'passportFileUploadDate',
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
                      flex: 3,
                      child: SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    ElevatedButton(onPressed: () {}, child: const Text('ファイル選択'))
                  ],
                ),
                SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                ),
                Row(
                  children: [
                    const Expanded(child: Text('身元保証書')),
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
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(value: true, onChanged: (value) {}),
                          const Text('原本送付'),
                          const Text('（'),
                          Checkbox(value: false, onChanged: (value) {}),
                          const Text('EMS'),
                          Checkbox(value: true, onChanged: (value) {}),
                          const Text('Fedex'),
                          Checkbox(value: false, onChanged: (value) {}),
                          const Text('その他'),
                          const Text('）'),
                          SizedBox(
                            width: context.appTheme.spacing.marginMedium,
                          ),
                          Checkbox(value: true, onChanged: (value) {}),
                          const Text('PDF送付'),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    ElevatedButton(onPressed: () {}, child: const Text('ファイル選択'))
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
                      style: TextStyle(
                          fontFamily: 'NotoSansJP',
                          package: 'core_ui',
                          color: context.appTheme.primaryColor),
                    )
                  ],
                ),
                SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                ),
                Row(
                  children: [
                    const Expanded(child: Text('治療予定表')),
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
                      flex: 3,
                      child: SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    ElevatedButton(onPressed: () {}, child: const Text('ファイル選択'))
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
                      style: TextStyle(
                          fontFamily: 'NotoSansJP',
                          package: 'core_ui',
                          color: context.appTheme.primaryColor),
                    )
                  ],
                ),
                SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                ),
                Row(
                  children: [
                    const Expanded(child: Text('理由書')),
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
                      flex: 3,
                      child: SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    ElevatedButton(onPressed: () {}, child: const Text('ファイル選択'))
                  ],
                ),
                SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                ),
                Row(
                  children: [
                    const Expanded(child: Text('同行者リスト')),
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
                      flex: 3,
                      child: SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    ElevatedButton(onPressed: () {}, child: const Text('ファイル選択'))
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                              formControlName: 'dateLandingPermit',
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                              builder: (BuildContext context,
                                  ReactiveDatePickerDelegate<dynamic> picker,
                                  Widget? child) {
                                return ReactiveTextField<DateTime>(
                                  formControlName: 'dateLandingPermit',
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
                                      '上陸許可日',
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
                            child: ReactiveDatePicker<DateTime>(
                              formControlName: 'dateVisaExpiration',
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                              builder: (BuildContext context,
                                  ReactiveDatePickerDelegate<dynamic> picker,
                                  Widget? child) {
                                return ReactiveTextField<DateTime>(
                                  formControlName: 'dateVisaExpiration',
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
                                      'ビザの有効期限　満了日',
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
                              formControlName: 'dateEntryIntoJapan',
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                              builder: (BuildContext context,
                                  ReactiveDatePickerDelegate<dynamic> picker,
                                  Widget? child) {
                                return ReactiveTextField<DateTime>(
                                  formControlName: 'dateEntryIntoJapan',
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
                                      '日本への入国日',
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
                            child: ReactiveDatePicker<DateTime>(
                              formControlName: 'dateEntryFromJapan',
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                              builder: (BuildContext context,
                                  ReactiveDatePickerDelegate<dynamic> picker,
                                  Widget? child) {
                                return ReactiveTextField<DateTime>(
                                  formControlName: 'dateEntryFromJapan',
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
                                      '日本からの出国日',
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
                            child: SizedBox(
                              width: context.appTheme.spacing.marginMedium,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: context.appTheme.spacing.marginMedium,
                      ),
                      const Text('入国'),
                      SizedBox(
                        height: context.appTheme.spacing.marginMedium,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: ReactiveTextField(
                              formControlName: 'departureEntry',
                              decoration: const InputDecoration(
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
                              formControlName: 'arrivalEntry',
                              decoration: const InputDecoration(
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
                              formControlName: 'flightNumberEntry',
                              decoration: const InputDecoration(
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
                              formControlName: 'departureTimeEntry',
                              decoration: const InputDecoration(
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
                              formControlName: 'arrivalTimeEntry',
                              decoration: const InputDecoration(
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
                      const Text('出国'),
                      SizedBox(
                        height: context.appTheme.spacing.marginMedium,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: ReactiveTextField(
                              formControlName: 'departureDeparture',
                              decoration: const InputDecoration(
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
                              formControlName: 'arrivalDeparture',
                              decoration: const InputDecoration(
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
                              formControlName: 'flightNumberDeparture',
                              decoration: const InputDecoration(
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
                              formControlName: 'departureTimeDeparture',
                              decoration: const InputDecoration(
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
                              formControlName: 'arrivalTimeDeparture',
                              decoration: const InputDecoration(
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
                              formControlName: 'flightSeatNumbeDeparturer',
                              decoration: const InputDecoration(
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
                              decoration: const InputDecoration(
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
          const Text('ビザの取り下げ'),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          ReactiveForm(
            formGroup: formGroup.control('withdrawalOfVisa') as FormGroup,
            child: Row(
              children: [
                Checkbox(value: true, onChanged: (value) {}),
                const Text('ビザ取下対象とする'),
                SizedBox(
                  width: context.appTheme.spacing.marginMedium,
                ),
                Expanded(
                  child: ReactiveDatePicker<DateTime>(
                    formControlName: 'deathOrOccurrenceEventDate',
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
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
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Text(
            'ビザ取得後に必要なもの',
            style: context.textTheme.titleMedium,
          ),
          ReactiveForm(
            formGroup: formGroup.control('requiredInJapan') as FormGroup,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(child: Text('ビザのページ')),
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
                      flex: 3,
                      child: SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    ElevatedButton(onPressed: () {}, child: const Text('ファイル選択'))
                  ],
                ),
                SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                ),
                Row(
                  children: [
                    const Expanded(child: Text('上陸許可証')),
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
                      flex: 3,
                      child: SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    ElevatedButton(onPressed: () {}, child: const Text('ファイル選択'))
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
                    const Expanded(child: Text('来日時の飛行機チケット')),
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
                      flex: 3,
                      child: SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    ElevatedButton(onPressed: () {}, child: const Text('ファイル選択'))
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
                    const Expanded(child: Text('帰国時の飛行機チケット')),
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
                      flex: 3,
                      child: SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    ElevatedButton(onPressed: () {}, child: const Text('ファイル選択'))
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
                    const Expanded(child: Text('帰国時のボーディングパス')),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    Expanded(
                      child: ReactiveDatePicker<DateTime>(
                        formControlName:
                            'boardingPassReturningFileUploadDate',
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                        builder: (BuildContext context,
                            ReactiveDatePickerDelegate<dynamic> picker,
                            Widget? child) {
                          return ReactiveTextField<DateTime>(
                            formControlName:
                                'boardingPassReturningFileUploadDate',
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
                      flex: 3,
                      child: SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    ElevatedButton(onPressed: () {}, child: const Text('ファイル選択'))
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
                    const Expanded(child: Text('在留資格認定証明書')),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    Expanded(
                      child: ReactiveDatePicker<DateTime>(
                        formControlName:
                            'certificateEligibilityFileUploadDate',
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                        builder: (BuildContext context,
                            ReactiveDatePickerDelegate<dynamic> picker,
                            Widget? child) {
                          return ReactiveTextField<DateTime>(
                            formControlName:
                                'certificateEligibilityFileUploadDate',
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
                      flex: 3,
                      child: SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    ElevatedButton(onPressed: () {}, child: const Text('ファイル選択'))
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReactiveForm(
                  formGroup: formGroup.control('companionOther') as FormGroup,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '同行者',
                        style: context.textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: context.appTheme.spacing.marginMedium,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ReactiveTextField(
                              formControlName: 'nameRomaji',
                              decoration: const InputDecoration(
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
                              formControlName: 'dateBirth',
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                              builder: (BuildContext context,
                                  ReactiveDatePickerDelegate<dynamic> picker,
                                  Widget? child) {
                                return ReactiveTextField<DateTime>(
                                  formControlName: 'dateBirth',
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
                                      '生年月日',
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
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text('性別'),
                                    ReactiveValueListenableBuilder<DateTime>(
                                      formControlName: 'dateBirth',
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
                                    const Text('性別'),
                                    Row(
                                      children: [
                                        Checkbox(
                                            value: false,
                                            onChanged: (value) {}),
                                        const Text('男性'),
                                        Checkbox(
                                            value: false,
                                            onChanged: (value) {}),
                                        const Text('女性'),
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
                              formControlName: 'addressArea',
                              decoration: const InputDecoration(
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
                              formControlName: 'numberPassport',
                              decoration: const InputDecoration(
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
                                    formControlName: 'dateLandingPermit',
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime.now(),
                                    builder: (BuildContext context,
                                        ReactiveDatePickerDelegate<dynamic>
                                            picker,
                                        Widget? child) {
                                      return ReactiveTextField<DateTime>(
                                        formControlName: 'dateLandingPermit',
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
                                            '上陸許可日',
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
                                  child: ReactiveDatePicker<DateTime>(
                                    formControlName: 'dateVisaExpiration',
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime.now(),
                                    builder: (BuildContext context,
                                        ReactiveDatePickerDelegate<dynamic>
                                            picker,
                                        Widget? child) {
                                      return ReactiveTextField<DateTime>(
                                        formControlName: 'dateVisaExpiration',
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
                                            'ビザの有効期限　満了日',
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
                                    formControlName: 'dateEntryIntoJapan',
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime.now(),
                                    builder: (BuildContext context,
                                        ReactiveDatePickerDelegate<dynamic>
                                            picker,
                                        Widget? child) {
                                      return ReactiveTextField<DateTime>(
                                        formControlName:
                                            'dateEntryIntoJapan',
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
                                            '日本への入国日',
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
                                  child: ReactiveDatePicker<DateTime>(
                                    formControlName: 'dateEntryFromJapan',
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime.now(),
                                    builder: (BuildContext context,
                                        ReactiveDatePickerDelegate<dynamic>
                                            picker,
                                        Widget? child) {
                                      return ReactiveTextField<DateTime>(
                                        formControlName:
                                            'dateEntryFromJapan',
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
                                            '日本からの出国日',
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
                            const Text('入国'),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: ReactiveTextField(
                                    formControlName: 'departureEntry',
                                    decoration: const InputDecoration(
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
                                    formControlName: 'arrivalEntry',
                                    decoration: const InputDecoration(
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
                                    formControlName: 'flightNumberEntry',
                                    decoration: const InputDecoration(
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
                                    formControlName: 'departureTimeEntry',
                                    decoration: const InputDecoration(
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
                                    formControlName: 'arrivalTimeEntry',
                                    decoration: const InputDecoration(
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
                            const Text('出国'),
                            SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: ReactiveTextField(
                                    formControlName: 'departureDeparture',
                                    decoration: const InputDecoration(
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
                                    formControlName: 'arrivalDeparture',
                                    decoration: const InputDecoration(
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
                                    formControlName: 'flightNumberDeparture',
                                    decoration: const InputDecoration(
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
                                    formControlName: 'departureTimeDeparture',
                                    decoration: const InputDecoration(
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
                                    formControlName: 'arrivalTimeDeparture',
                                    decoration: const InputDecoration(
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
                                        'flightSeatNumbeDeparturer',
                                    decoration: const InputDecoration(
                                      label: Text(
                                        '座席番号',
                                      ),
                                    ),
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
                            '上記セットを追加',
                            style:
                                TextStyle(color: context.appTheme.primaryColor),
                          )
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
                              decoration: const InputDecoration(
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
                ReactiveForm(
                  formGroup: formGroup.control('withdrawalOfVisaOther')
                      as FormGroup,
                  child: Row(
                    children: [
                      Checkbox(value: true, onChanged: (value) {}),
                      const Text('ビザの取り下げ'),
                      SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('理由'),
                          Row(
                            children: [
                              Checkbox(value: false, onChanged: (value) {}),
                              const Text('患者死亡'),
                              Checkbox(value: false, onChanged: (value) {}),
                              const Text('その他'),
                            ],
                          )
                        ],
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
                SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                ),
                Text(
                  'ビザ取得後に必要なもの',
                  style: context.textTheme.titleMedium,
                ),
                SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                ),
                ReactiveForm(
                  formGroup:
                      formGroup.control('requiredInJapan') as FormGroup,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Expanded(child: Text('ビザのページ')),
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
                            flex: 2,
                            child: SizedBox(
                              width: context.appTheme.spacing.marginMedium,
                            ),
                          ),
                          SizedBox(
                            width: context.appTheme.spacing.marginMedium,
                          ),
                          ElevatedButton(
                              onPressed: () {}, child: const Text('ファイル選択'))
                        ],
                      ),
                      SizedBox(
                        height: context.appTheme.spacing.marginMedium,
                      ),
                      Row(
                        children: [
                          const Expanded(child: Text('上陸許可証')),
                          SizedBox(
                            width: context.appTheme.spacing.marginMedium,
                          ),
                          Expanded(
                            child: ReactiveDatePicker<DateTime>(
                              formControlName:
                                  'landing_permit_file_upload_date',
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                              builder: (BuildContext context,
                                  ReactiveDatePickerDelegate<dynamic> picker,
                                  Widget? child) {
                                return ReactiveTextField<DateTime>(
                                  formControlName:
                                      'landing_permit_file_upload_date',
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
                            flex: 2,
                            child: SizedBox(
                              width: context.appTheme.spacing.marginMedium,
                            ),
                          ),
                          SizedBox(
                            width: context.appTheme.spacing.marginMedium,
                          ),
                          ElevatedButton(
                              onPressed: () {}, child: const Text('ファイル選択'))
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
                            style:
                                TextStyle(color: context.appTheme.primaryColor),
                          )
                        ],
                      ),
                      SizedBox(
                        height: context.appTheme.spacing.marginMedium,
                      ),
                      Row(
                        children: [
                          const Expanded(child: Text('来日時の飛行機チケット')),
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
                            flex: 2,
                            child: SizedBox(
                              width: context.appTheme.spacing.marginMedium,
                            ),
                          ),
                          SizedBox(
                            width: context.appTheme.spacing.marginMedium,
                          ),
                          ElevatedButton(
                              onPressed: () {}, child: const Text('ファイル選択'))
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
                            style:
                                TextStyle(color: context.appTheme.primaryColor),
                          )
                        ],
                      ),
                      SizedBox(
                        height: context.appTheme.spacing.marginMedium,
                      ),
                      Row(
                        children: [
                          const Expanded(child: Text('帰国時の飛行機チケット')),
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
                            flex: 2,
                            child: SizedBox(
                              width: context.appTheme.spacing.marginMedium,
                            ),
                          ),
                          SizedBox(
                            width: context.appTheme.spacing.marginMedium,
                          ),
                          ElevatedButton(
                              onPressed: () {}, child: const Text('ファイル選択'))
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
                            style:
                                TextStyle(color: context.appTheme.primaryColor),
                          )
                        ],
                      ),
                      SizedBox(
                        height: context.appTheme.spacing.marginMedium,
                      ),
                      Row(
                        children: [
                          const Expanded(child: Text('帰国時のボーディングパス')),
                          SizedBox(
                            width: context.appTheme.spacing.marginMedium,
                          ),
                          Expanded(
                            child: ReactiveDatePicker<DateTime>(
                              formControlName:
                                  'boardingPassReturningFileUploadDate',
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                              builder: (BuildContext context,
                                  ReactiveDatePickerDelegate<dynamic> picker,
                                  Widget? child) {
                                return ReactiveTextField<DateTime>(
                                  formControlName:
                                      'boardingPassReturningFileUploadDate',
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
                            flex: 2,
                            child: SizedBox(
                              width: context.appTheme.spacing.marginMedium,
                            ),
                          ),
                          SizedBox(
                            width: context.appTheme.spacing.marginMedium,
                          ),
                          ElevatedButton(
                              onPressed: () {}, child: const Text('ファイル選択'))
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
                            style:
                                TextStyle(color: context.appTheme.primaryColor),
                          )
                        ],
                      ),
                      SizedBox(
                        height: context.appTheme.spacing.marginMedium,
                      ),
                      Row(
                        children: [
                          const Expanded(child: Text('在留資格認定証明書')),
                          SizedBox(
                            width: context.appTheme.spacing.marginMedium,
                          ),
                          Expanded(
                            child: ReactiveDatePicker<DateTime>(
                              formControlName:
                                  'certificateEligibilityFileUploadDate',
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                              builder: (BuildContext context,
                                  ReactiveDatePickerDelegate<dynamic> picker,
                                  Widget? child) {
                                return ReactiveTextField<DateTime>(
                                  formControlName:
                                      'certificateEligibilityFileUploadDate',
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
                            flex: 2,
                            child: SizedBox(
                              width: context.appTheme.spacing.marginMedium,
                            ),
                          ),
                          SizedBox(
                            width: context.appTheme.spacing.marginMedium,
                          ),
                          ElevatedButton(
                              onPressed: () {}, child: const Text('ファイル選択'))
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
          Padding(
            padding:
                EdgeInsets.only(top: context.appTheme.spacing.marginMedium),
            child: ValueListenableBuilder<int>(
              valueListenable: _selectedIndex,
              builder: (BuildContext context, int value, Widget? child) {
                return Row(
                  children: [
                    TabBarWidget(
                      selectedIndex: value,
                      menu: menu,
                      onPressed: (index) {
                        _selectedIndex.value = index;
                      },
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Row(children: [
            const Expanded(
              child: Text('書類'),
            ),
            SizedBox(
              width: context.appTheme.spacing.marginMedium,
            ),
            const Expanded(
              child: Text('発行日'),
            ),
            SizedBox(
              width: context.appTheme.spacing.marginMedium,
            ),
            Expanded(
              child: SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
            ),
          ]),
          const Divider(),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Text(
            '日本で必要',
            style: context.textTheme.titleMedium,
          ),
          ReactiveForm(
            formGroup: formGroup.control('requiredInJapan') as FormGroup,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(child: Text('パスポート')),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    Expanded(
                      child: ReactiveDatePicker<DateTime>(
                        formControlName: 'passportFileUploadDate',
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                        builder: (BuildContext context,
                            ReactiveDatePickerDelegate<dynamic> picker,
                            Widget? child) {
                          return ReactiveTextField<DateTime>(
                            formControlName: 'passportFileUploadDate',
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
                      flex: 3,
                      child: SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    ElevatedButton(onPressed: () {}, child: const Text('ファイル選択'))
                  ],
                ),
                SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                ),
                Row(
                  children: [
                    const Expanded(child: Text('身元保証書')),
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
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(value: true, onChanged: (value) {}),
                          const Text('原本送付'),
                          const Text('（'),
                          Checkbox(value: false, onChanged: (value) {}),
                          const Text('EMS'),
                          Checkbox(value: true, onChanged: (value) {}),
                          const Text('Fedex'),
                          Checkbox(value: false, onChanged: (value) {}),
                          const Text('その他'),
                          const Text('）'),
                          SizedBox(
                            width: context.appTheme.spacing.marginMedium,
                          ),
                          Checkbox(value: true, onChanged: (value) {}),
                          const Text('PDF送付'),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    ElevatedButton(onPressed: () {}, child: const Text('ファイル選択'))
                  ],
                ),
                SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                ),
                Row(
                  children: [
                    const Expanded(child: Text('治療予定表')),
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
                      flex: 3,
                      child: SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    ElevatedButton(onPressed: () {}, child: const Text('ファイル選択'))
                  ],
                ),
                SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                ),
                Row(
                  children: [
                    const Expanded(child: Text('理由書')),
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
                      flex: 3,
                      child: SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    ElevatedButton(onPressed: () {}, child: const Text('ファイル選択'))
                  ],
                ),
                SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                ),
                Row(
                  children: [
                    const Expanded(child: Text('同行者リスト')),
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
                      flex: 3,
                      child: SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    ElevatedButton(onPressed: () {}, child: const Text('ファイル選択'))
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Text(
            'ビザ取得後に必要なもの',
            style: context.textTheme.titleMedium,
          ),
          ReactiveForm(
            formGroup: formGroup.control('requiredInJapan') as FormGroup,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(child: Text('ビザのページ')),
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
                      flex: 3,
                      child: SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    ElevatedButton(onPressed: () {}, child: const Text('ファイル選択'))
                  ],
                ),
                SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                ),
                Row(
                  children: [
                    const Expanded(child: Text('上陸許可証')),
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
                      flex: 3,
                      child: SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    ElevatedButton(onPressed: () {}, child: const Text('ファイル選択'))
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
                    const Expanded(child: Text('来日時の飛行機チケット')),
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
                      flex: 3,
                      child: SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    ElevatedButton(onPressed: () {}, child: const Text('ファイル選択'))
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
                    const Expanded(child: Text('帰国時の飛行機チケット')),
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
                      flex: 3,
                      child: SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    ElevatedButton(onPressed: () {}, child: const Text('ファイル選択'))
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
                    const Expanded(child: Text('帰国時のボーディングパス')),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    Expanded(
                      child: ReactiveDatePicker<DateTime>(
                        formControlName:
                            'boardingPassReturningFileUploadDate',
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                        builder: (BuildContext context,
                            ReactiveDatePickerDelegate<dynamic> picker,
                            Widget? child) {
                          return ReactiveTextField<DateTime>(
                            formControlName:
                                'boardingPassReturningFileUploadDate',
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
                      flex: 3,
                      child: SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    ElevatedButton(onPressed: () {}, child: const Text('ファイル選択'))
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
                    const Expanded(child: Text('在留資格認定証明書')),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    Expanded(
                      child: ReactiveDatePicker<DateTime>(
                        formControlName:
                            'certificateEligibilityFileUploadDate',
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                        builder: (BuildContext context,
                            ReactiveDatePickerDelegate<dynamic> picker,
                            Widget? child) {
                          return ReactiveTextField<DateTime>(
                            formControlName:
                                'certificateEligibilityFileUploadDate',
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
                      flex: 3,
                      child: SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    ElevatedButton(onPressed: () {}, child: const Text('ファイル選択'))
                  ],
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
