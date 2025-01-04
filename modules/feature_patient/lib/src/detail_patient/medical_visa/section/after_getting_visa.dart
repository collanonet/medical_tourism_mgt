// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/entities.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AfterGettingVisa extends StatelessWidget {
  const AfterGettingVisa({super.key});

  @override
  Widget build(BuildContext context) {
    final formGroup = ReactiveForm.of(context) as FormGroup;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ビザ取得後に必要なもの',
          style: context.textTheme.titleMedium,
        ),
        SizedBox(
          height: context.appTheme.spacing.marginMedium,
        ),
        ReactiveForm(
          formGroup: formGroup.control('afterGettingVisa') as FormGroup,
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
                                    const Row(
                                      children: [
                                        Text('ビザのページ'),
                                        SizedBox(
                                          width: 140,
                                        ),
                                        IntrinsicWidth(
                                          stepWidth: 200,
                                          child: ReactiveDatePickerField(
                                            formControlName: 'visaPage',

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
                                    const Row(
                                      children: [
                                        Text('上陸許可証'),
                                        SizedBox(
                                          width: 150,
                                        ),
                                        IntrinsicWidth(
                                          stepWidth: 200,
                                          child: ReactiveDatePickerField(
                                            formControlName: 'landingPermit',
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
                            FormGroup(
                              {
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
                              },
                            ),
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
                                const Row(
                                  children: [
                                    Text('来日時の飛行機チケット'),
                                    SizedBox(
                                      width: 75,
                                    ),
                                    IntrinsicWidth(
                                      stepWidth: 200,
                                      child: ReactiveDatePickerField(
                                        formControlName:
                                            'planeTicketForYourVisitToJapan',
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
                          formArray.add(
                            FormGroup(
                              {
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
                              },
                            ),
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
                formArrayName: 'ticketBack',
                builder: (context, formArray, _) {
                  final rows = formArray.controls
                      .map((control) => control as FormGroup)
                      .map((currentForm) => ReactiveForm(
                            formGroup: currentForm,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Row(
                                  children: [
                                    Text('帰国時の飛行機チケット'),
                                    SizedBox(
                                      width: 75,
                                    ),
                                    IntrinsicWidth(
                                      stepWidth: 200,
                                      child: ReactiveDatePickerField(
                                        formControlName: 'returnFlightTicket',

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
                            FormGroup(
                              {
                                'returnFlightTicket': FormControl<DateTime>(
                                  validators: [
                                    Validators.pattern(
                                      ValidatorRegExp.date,
                                    ),
                                  ],
                                ),
                                'returnFlightTicketFileName':
                                    FormControl<FileSelect>(),
                              },
                            ),
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
                                const Row(
                                  children: [
                                    Text('帰国時のボーディングパス'),
                                    SizedBox(
                                      width: 65,
                                    ),
                                    IntrinsicWidth(
                                      stepWidth: 200,
                                      child: ReactiveDatePickerField(
                                        formControlName:
                                            'boardingPassForReturnFlight',

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
                            FormGroup(
                              {
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
                              },
                            ),
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
                  const Row(
                    children: [
                      Text('在留資格認定証明書'),
                      SizedBox(
                        width: 100,
                      ),
                      IntrinsicWidth(
                        stepWidth: 200,
                        child: ReactiveDatePickerField(
                          formControlName: 'certificateOfEligibility',

                        ),
                      ),
                    ],
                  ),
                  fileUpload(
                      context,
                      formGroup.control('afterGettingVisa') as FormGroup,
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
