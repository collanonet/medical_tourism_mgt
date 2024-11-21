import 'package:core_network/core_network.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AfterGettingVisaFinal extends StatelessWidget {
  const AfterGettingVisaFinal({super.key});

  @override
  Widget build(BuildContext context) {
    final formatter = InputFormatter();
    final formGroup = ReactiveForm.of(context) as FormGroup;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ビザ取得後に必要なもの',
          style: context.textTheme.titleMedium,
        ),
        ReactiveForm(
          formGroup: formGroup.control('afterGettingVisaFinal') as FormGroup,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReactiveFormArray(
                formArrayName: 'vasaInfo',
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
                                        const Text('ビザのページ'),
                                        const SizedBox(
                                          width: 140,
                                        ),
                                        IntrinsicWidth(
                                          stepWidth: 200,
                                          child: ReactiveDatePicker<DateTime>(
                                            formControlName: 'visaPage',
                                            firstDate: DateTime(1900),
                                            lastDate: DateTime(2100),
                                            builder: (BuildContext context,
                                                ReactiveDatePickerDelegate<
                                                        dynamic>
                                                    picker,
                                                Widget? child) {
                                              return ReactiveTextField<
                                                  DateTime>(
                                                formControlName: 'visaPage',
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
                                        'visaPageFileName'),
                                  ],
                                ),
                                SizedBox(
                                  height: context.appTheme.spacing.marginMedium,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Text('上陸許可証'),
                                        const SizedBox(
                                          width: 150,
                                        ),
                                        IntrinsicWidth(
                                          stepWidth: 200,
                                          child: ReactiveDatePicker<DateTime>(
                                            formControlName: 'landingPermit',
                                            firstDate: DateTime(1900),
                                            lastDate: DateTime(2100),
                                            builder: (BuildContext context,
                                                ReactiveDatePickerDelegate<
                                                        dynamic>
                                                    picker,
                                                Widget? child) {
                                              return ReactiveTextField<
                                                  DateTime>(
                                                formControlName:
                                                    'landingPermit',
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
                                        'landingPermitFileName'),
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
                        onTap: () {
                          formArray.add(
                            FormGroup({
                              'visaPage': FormControl<DateTime>(
                                validators: [
                                  Validators.pattern(
                                    ValidatorRegExp.date,
                                  ),
                                ],
                              ),
                              'visaPageFileName': FormControl<FileSelect>(),
                              'landingPermit': FormControl<DateTime>(
                                validators: [
                                  Validators.pattern(
                                    ValidatorRegExp.date,
                                  ),
                                ],
                              ),
                              'landingPermitFileName':
                                  FormControl<FileSelect>(),
                            }),
                          );
                        },
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
                              '追加',
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
                formArrayName: 'ticket',
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
                                    const Text('来日時の飛行機チケット'),
                                    const SizedBox(
                                      width: 70,
                                    ),
                                    IntrinsicWidth(
                                      stepWidth: 200,
                                      child: ReactiveDatePicker<DateTime>(
                                        formControlName:
                                            'planeTicketForYourVisitToJapan',
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(2100),
                                        builder: (BuildContext context,
                                            ReactiveDatePickerDelegate<dynamic>
                                                picker,
                                            Widget? child) {
                                          return ReactiveTextField<DateTime>(
                                            formControlName:
                                                'planeTicketForYourVisitToJapan',
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
                                    'planeTicketForYourVisitToJapanFileName'),
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
                        onTap: () {
                          formArray.add(FormGroup({
                            'planeTicketForYourVisitToJapan':
                                FormControl<DateTime>(
                              validators: [
                                Validators.pattern(
                                  ValidatorRegExp.date,
                                ),
                              ],
                            ),
                            'planeTicketForYourVisitToJapanFileName':
                                FormControl<FileSelect>(),
                          }));
                        },
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
                              '追加',
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
                formArrayName: 'ticketBack',
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
                                    const Text('帰国時の飛行機チケット'),
                                    const SizedBox(
                                      width: 70,
                                    ),
                                    IntrinsicWidth(
                                      stepWidth: 200,
                                      child: ReactiveDatePicker<DateTime>(
                                        formControlName: 'returnFlightTicket',
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(2100),
                                        builder: (BuildContext context,
                                            ReactiveDatePickerDelegate<dynamic>
                                                picker,
                                            Widget? child) {
                                          return ReactiveTextField<DateTime>(
                                            formControlName:
                                                'returnFlightTicket',
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
                                    'returnFlightTicketFileName'),
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
                        onTap: () {
                          formArray.add(
                            FormGroup({
                              'returnFlightTicket': FormControl<DateTime>(
                                validators: [
                                  Validators.pattern(
                                    ValidatorRegExp.date,
                                  ),
                                ],
                              ),
                              'returnFlightTicketFileName':
                                  FormControl<FileSelect>(),
                            }),
                          );
                        },
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
                              '追加',
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
                formArrayName: 'boardingPass',
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
                                    const Text('帰国時のボーディングパス'),
                                    const SizedBox(
                                      width: 60,
                                    ),
                                    IntrinsicWidth(
                                      stepWidth: 200,
                                      child: ReactiveDatePicker<DateTime>(
                                        formControlName:
                                            'boardingPassForReturnFlight',
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(2100),
                                        builder: (BuildContext context,
                                            ReactiveDatePickerDelegate<dynamic>
                                                picker,
                                            Widget? child) {
                                          return ReactiveTextField<DateTime>(
                                            formControlName:
                                                'boardingPassForReturnFlight',
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
                                    'boardingPassForReturnFlightFileName'),
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
                        onTap: () {
                          formArray.add(
                            FormGroup({
                              'boardingPassForReturnFlight':
                                  FormControl<DateTime>(
                                validators: [
                                  Validators.pattern(
                                    ValidatorRegExp.date,
                                  ),
                                ],
                              ),
                              'boardingPassForReturnFlightFileName':
                                  FormControl<FileSelect>(),
                            }),
                          );
                        },
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
                              '追加',
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
                      const Text('在留資格認定証明書'),
                      const SizedBox(
                        width: 95,
                      ),
                      IntrinsicWidth(
                        stepWidth: 200,
                        child: ReactiveDatePicker<DateTime>(
                          formControlName: 'certificateOfEligibility',
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                          builder: (BuildContext context,
                              ReactiveDatePickerDelegate<dynamic> picker,
                              Widget? child) {
                            return ReactiveTextField<DateTime>(
                              formControlName: 'certificateOfEligibility',
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
                      formGroup.control('afterGettingVisaFinal') as FormGroup,
                      'certificateOfEligibilityFileName'),
                ],
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
                        if (control.value?.url != null) {
                          openUrlInBrowser(fileName: control.value!.url!);
                        }
                      },
                      child: Text(
                        control.value?.filename ?? 'File Input .....',
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
