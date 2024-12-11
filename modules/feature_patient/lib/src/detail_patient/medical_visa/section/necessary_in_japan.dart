import 'package:core_network/core_network.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

class NecessaryInJapan extends StatelessWidget {
  const NecessaryInJapan({super.key});

  @override
  Widget build(BuildContext context) {
    final formatter = InputFormatter();
    final formGroup = ReactiveForm.of(context) as FormGroup;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '日本で必要',
          style: context.textTheme.titleMedium,
        ),
        ReactiveForm(
          formGroup: formGroup.control('necessaryInJapan') as FormGroup,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReactiveFormArray(
                formArrayName: 'visaInfo',
                builder: (context, formArray, _) {
                  final rows = formArray.controls
                      .map((control) => control as FormGroup)
                      .map((currentForm) => ReactiveForm(
                            formGroup: currentForm,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Text('パスポート'),
                                        const SizedBox(
                                          width: 150,
                                        ),
                                        IntrinsicWidth(
                                          stepWidth: 200,
                                          child: ReactiveDatePicker<DateTime>(
                                            formControlName: 'passportDate',
                                            firstDate: DateTime(1900),
                                            lastDate: DateTime(2100),
                                            builder: (BuildContext context,
                                                ReactiveDatePickerDelegate<
                                                        dynamic>
                                                    picker,
                                                Widget? child) {
                                              return ReactiveTextField<
                                                  DateTime>(
                                                formControlName: 'passportDate',
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
                                                  suffixIcon: IconButton(
                                                    icon: const Icon(
                                                      CupertinoIcons.calendar,
                                                      color: Colors.grey,
                                                    ),
                                                    onPressed:
                                                        picker.showPicker,
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
                                    fileUpload(context, currentForm,
                                        'passportFileSelect'),
                                  ],
                                ),
                                SizedBox(
                                  height: context.appTheme.spacing.marginMedium,
                                ),
                                Row(
                                  children: [
                                    const Expanded(child: Text('身元保証書')),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Expanded(
                                      child: ReactiveDatePicker<DateTime>(
                                        formControlName:
                                            'letterOfGuaranteeDate',
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(2100),
                                        builder: (BuildContext context,
                                            ReactiveDatePickerDelegate<dynamic>
                                                picker,
                                            Widget? child) {
                                          return ReactiveTextField<DateTime>(
                                            formControlName:
                                                'letterOfGuaranteeDate',
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
                                      flex: 3,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Expanded(
                                            child: ReactiveRadioListTile(
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .leading,
                                              contentPadding: EdgeInsets.zero,
                                              value: 'true',
                                              formControlName: 'sendBy',
                                              title: const Text('原本送付'),
                                            ),
                                          ),
                                          const Text('（'),
                                          Expanded(
                                            child: ReactiveCheckboxListTile(
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .leading,
                                              contentPadding: EdgeInsets.zero,
                                              formControlName: 'byEMS',
                                              title: const Text('EMS'),
                                            ),
                                          ),
                                          Expanded(
                                            child: ReactiveCheckboxListTile(
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .leading,
                                              contentPadding: EdgeInsets.zero,
                                              formControlName: 'byFedex',
                                              title: const Text('Fedex'),
                                            ),
                                          ),
                                          Expanded(
                                            child: ReactiveCheckboxListTile(
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .leading,
                                              contentPadding: EdgeInsets.zero,
                                              formControlName: 'byOthers',
                                              title: const Text('その他'),
                                            ),
                                          ),
                                          const Text('）'),
                                          SizedBox(
                                            width: context
                                                .appTheme.spacing.marginMedium,
                                          ),
                                          Expanded(
                                            child: ReactiveRadioListTile(
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .leading,
                                              contentPadding: EdgeInsets.zero,
                                              value: 'false',
                                              formControlName: 'sendBy',
                                              title: const Text('PDF送付'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    fileUpload(context, currentForm,
                                        'letterOfGuaranteeFileSelect'),
                                  ],
                                ),
                              ],
                            ),
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
                              'passportDate': FormControl<DateTime>(
                                validators: [
                                  Validators.pattern(
                                    ValidatorRegExp.date,
                                  ),
                                ],
                              ),
                              'passportFileSelect': FormControl<FileSelect>(),
                              'letterOfGuaranteeDate': FormControl<DateTime>(
                                validators: [
                                  Validators.pattern(
                                    ValidatorRegExp.date,
                                  ),
                                ],
                              ),
                              'letterOfGuaranteeFileSelect':
                                  FormControl<FileSelect>(),
                              'sendBy': FormControl<String>(value: ''),
                              'byEMS': FormControl<bool>(value: false),
                              'byFedex': FormControl<bool>(value: false),
                              'byOthers': FormControl<bool>(value: false),
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
                              '身元保証書を追加',
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
              SizedBox(
                height: context.appTheme.spacing.marginMedium,
              ),
              ReactiveFormArray(
                formArrayName: 'schedule',
                builder: (context, formArray, _) {
                  final rows = formArray.controls
                      .map((control) => control as FormGroup)
                      .map((currentForm) => ReactiveForm(
                            formGroup: currentForm,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Text('治療予定表'),
                                    const SizedBox(
                                      width: 150,
                                    ),
                                    IntrinsicWidth(
                                      stepWidth: 200,
                                      child: ReactiveDatePicker<DateTime>(
                                        formControlName: 'treatmentSchedule',
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(2100),
                                        builder: (BuildContext context,
                                            ReactiveDatePickerDelegate<dynamic>
                                                picker,
                                            Widget? child) {
                                          return ReactiveTextField<DateTime>(
                                            formControlName:
                                                'treatmentSchedule',
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
                                fileUpload(context, currentForm,
                                    'treatmentScheduleFileSelect'),
                              ],
                            ),
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
                              'treatmentSchedule': FormControl<DateTime>(
                                validators: [
                                  Validators.pattern(
                                    ValidatorRegExp.date,
                                  ),
                                ],
                              ),
                              'treatmentScheduleFileSelect':
                                  FormControl<FileSelect>(),
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
                              '治療予定表を追加',
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
              SizedBox(
                height: context.appTheme.spacing.marginMedium,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text('理由書'),
                      const SizedBox(
                        width: 175,
                      ),
                      IntrinsicWidth(
                        stepWidth: 200,
                        child: ReactiveDatePicker<DateTime>(
                          formControlName: 'statementOfReasonsDate',
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                          builder: (BuildContext context,
                              ReactiveDatePickerDelegate<dynamic> picker,
                              Widget? child) {
                            return ReactiveTextField<DateTime>(
                              formControlName: 'statementOfReasonsDate',
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
                    ],
                  ),
                  fileUpload(
                      context,
                      formGroup.control('necessaryInJapan') as FormGroup,
                      'statementOfReasonsFileSelect'),
                ],
              ),
              SizedBox(
                height: context.appTheme.spacing.marginMedium,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text('同行者リスト'),
                      const SizedBox(
                        width: 135,
                      ),
                      IntrinsicWidth(
                        stepWidth: 200,
                        child: ReactiveDatePicker<DateTime>(
                          formControlName: 'travelCompanionListDate',
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                          builder: (BuildContext context,
                              ReactiveDatePickerDelegate<dynamic> picker,
                              Widget? child) {
                            return ReactiveTextField<DateTime>(
                              formControlName: 'travelCompanionListDate',
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
                    ],
                  ),
                  fileUpload(
                      context,
                      formGroup.control('necessaryInJapan') as FormGroup,
                      'travelCompanionListFileSelect'),
                ],
              ),
              SizedBox(
                height: context.appTheme.spacing.marginMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget fileUpload(
      BuildContext context, FormGroup currentForm, String fileName) {
    return ColumnSeparated(
      mainAxisAlignment: MainAxisAlignment.start,
      separatorBuilder: (context, index) => SizedBox(
        height: context.appTheme.spacing.formSpacing,
      ),
      children: [
        RowSeparated(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          separatorBuilder: (context, index) => SizedBox(
            width: context.appTheme.spacing.formSpacing,
          ),
          children: [
            RowSeparated(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              separatorBuilder: (context, index) => SizedBox(
                width: context.appTheme.spacing.marginExtraSmall,
              ),
              children: [
                ReactiveValueListenableBuilder<FileSelect>(
                  formControlName: fileName,
                  builder: (context, control, _) {
                    return InkWell(
                      onTap: () {
                        if (control.value?.url != null ||
                            control.value?.filename != null) {
                          openUrlInBrowser(
                              fileName: control.value?.url ??
                                  control.value!.filename!);
                        }
                      },
                      child: Text(
                        control.value?.url ??
                            control.value?.filename ??
                            'File Name',
                        style: context.textTheme.bodySmall,
                      ),
                    );
                  },
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                filePicker().then((value) {
                  if (value != null) {
                    currentForm.control(fileName).value = value;
                  }
                });
              },
              child: Chip(
                label: const Text('ファイル選択'),
                labelStyle: TextStyle(
                  color: context.appTheme.secondaryBackgroundColor,
                ),
                backgroundColor: context.appTheme.primaryColor,
              ),
            ),
          ],
        )
      ],
    );
  }
}
